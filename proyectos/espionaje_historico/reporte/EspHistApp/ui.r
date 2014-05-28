library(shiny)

shinyUI(fluidPage(
  
  # Load d3.js
  tags$head(
    tags$script(src = 'http://d3js.org/d3.v3.min.js')
  ),
  
  # Application title
  titlePanel('Espionaje Histórico'),
    p('Ingresa temas que te interese relacionar. Nuestro método de búsqueda relacionará estos a través del corpus de Wikipedia y devolverá una representacón gráfica de los mismos. Los elementos de la búsqueda deben de estar delimitados por comas.'),
  
## Sidebar with a slider input for node opacity
  sidebarLayout(
    sidebarPanel(
      textInput("busqueda", "Búsqueda:","Manila, Denver, Lisbon, Rome, Amsterdam, Beijing, Tokyo, Mexico City, New York City, Rio de Janeiro, Houston, Dallas, Toronto, Turin, Hamburg, London, Bristol, Athens, Capetown, Sydney, Wellington"), tags$style(type='text/css', "#busqueda { width: 900px; }"),
      
    submitButton(text="Actualiza")
    ),
    
    # Show network graph
    mainPanel(
      htmlOutput('networkPlot')
    )
  )
))

