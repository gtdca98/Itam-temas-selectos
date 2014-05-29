library(doMC)
registerDoMC(2)

library(bitops)
library(RCurl)
library(RJSONIO)
library(plyr)
library(igraph)
library(d3Network)

neo_local <- 'localhost:7474/db/data/cypher'
neo_remote <- 'http://X.X.X.X:7474/db/data/cypher'

#items <- c('Mexico','Canada','United_States','Guatemala','Germany','France','China','Japan')

url <- neo_remote

n4j_query <- function(item) {
  if (substr(url, 1, 9)=='localhost'){
    querystring <- paste("MATCH (i)--(n) WHERE n.item='", item, "' RETURN i.item", sep="")
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

#### Shiny ####
shinyServer(function(input, output) {
  # Return the requested dataset
  busquedaUI <- reactive({
    items <- trim(unlist(strsplit(input$busqueda, ',')))
    net <- buildNet(items)
    analyzeNet(net)
  })
  output$networkPlot <- renderPrint({
    edges <- busquedaUI()
    d3SimpleNetwork(edges, width = 400, height = 250)
  })
})
