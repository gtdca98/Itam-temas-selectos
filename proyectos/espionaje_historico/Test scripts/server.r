# Este script es para el server de shiny para dibujar modularidad.

library(doMC)
registerDoMC(2)

library(bitops)
library(RCurl)
library(RJSONIO)
library(plyr)
library(igraph)
library(d3Network)

neo_local <- 'localhost:7474/db/data/cypher'

#neo_remote <- 'http://X.X.X.X:7474/db/data/cypher'
#neo_remote <- 'http://54.86.244.206:7474/db/data/cypher'
#neo_remote <- 'http://54.209.209.148:7474/db/data/cypher'
#items <- c('Mexico','Canada','United_States','Guatemala','Germany','France','China','Japan')

url <- neo_local
items <- c('Metallica', 'Anthrax', 'Megadeth', 'Black_Label_Society', 'Lou_Reed', 'Slipknot', 'Mastodon', 'Trivium', 'Arch_Enemy', 'Periphery', 'James_Hetfield', 'Lars_Ulrich')

n4j_query <- function(item) {
  if (substr(url, 1, 9)=='localhost'){
    querystring <- paste("MATCH (i:base)--(n:base) WHERE n.cve='", item, "' RETURN i.cve", sep="")
  } else {
    querystring <- paste("MATCH (i:base)--(n:base) WHERE n.name='", item, "' RETURN i.name", sep="")
  }
  h = basicTextGatherer()
  curlPerform(url=url,
              postfields=paste('query', curlEscape(querystring), sep='='),
              writefunction = h$update,
              verbose = FALSE
  )
  unlist(fromJSON(h$value())$data)
}

jaccard <- function(a, b) {
  length(intersect(a, b))/(length(union(a, b)))
}

trim <- function (x) {
  gsub("^\\s+|\\s+$", "", x)
}

buildNet <- function(items){
  n_items <- length(items)
  q_output <- alply(.data=items, .margins=1, .fun=n4j_query, .parallel=T)
  index <- subset(expand.grid(i=seq(1, n_items), j=seq(1, n_items)), i<j)
  jeval <- mdply(index, .fun = function (i, j) {
    c(items[i], items[j], jaccard(q_output[[i]], q_output[[j]]))
  }, .parallel=T)
  jeval$i <- NULL
  jeval$j <- NULL
  names(jeval) <- c('Source','Target','Jaccard')
  jeval <- transform(jeval, Jaccard = as.numeric(Jaccard))
  jeval$dist <- 1 - jeval$Jaccard
  jeval
}

analyzeNet <- function(net) {
  g <- graph.data.frame(net, directed=F)
  E(g)$weight <- net$dist
  mst <- minimum.spanning.tree(g)
  as.data.frame(get.edgelist(mst))
}

getModularity <- function(net){
  g <- graph.data.frame(net, directed=F)
  mst <- minimum.spanning.tree(g)
  V(g)$group <- fastgreedy.community(mst)$membership
  data.frame(node = V(g)$name, group = V(g)$group)
}

cleanEdges <- function(edges, nodes){
  nodes$number <- seq(1,nrow(nodes))
  edges$Value <- 10
  edges$V1 <- plyr:::join(data.frame(node = as.character(edges$V1)), nodes, type = 'left')$number-1
  edges$V2 <- plyr:::join(data.frame(node = as.character(edges$V2)), nodes, type = 'left')$number-1
  names(edges) <- c('source', 'target', 'value') 
  edges <- edges[order(edges$source),]
  row.names(edges) <- seq(1, nrow(edges))
  nodes$number <- NULL
  edges
}

net <- buildNet(items)
edges <- analyzeNet(net)

### Shiny ####
shinyServer(function(input, output) {
  # Return the requested dataset
  busquedaUI <- reactive({
#    items <- trim(unlist(strsplit(input$busqueda, ',')))
    net <- buildNet(items)
    analyzeNet(net)
  })
  output$networkPlot <- renderPrint({
    edges <- busquedaUI()
    nodes <- getModularity(edges)
    nodes$node <- as.character(nodes$node)
    edges <- cleanEdges(edges, nodes)
    d3ForceNetwork(Links = edges, Nodes = nodes,
                   Source = "source", Target = "target",
                   Value = "value", NodeID = "node", 
                   Group = "group", width = 550, height = 400,
                   opacity = 0.9)
#     d3SimpleNetwork(edges, width = 400, height = 250)
  })
})
