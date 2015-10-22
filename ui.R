source('params.R')
shinyUI(fluidPage(
  titlePanel("Structure Plots in R"),
  sidebarLayout(
    sidebarPanel(
    wellPanel(
      fileInput('structure_file',"Upload a Structure Q-Matrix File")
    ),
    wellPanel(
      numericInput("k","Number of clusters in your file",2)
    ),
  
    wellPanel(
      uiOutput("numClusters")
    ),
    wellPanel(
      checkboxInput("sort_indiv",label="Sort the Q-Matrix by Population?")
    ),
    wellPanel(
      uiOutput("getPopLabels")
      #submitButton("submit")
    )

    
    
  ),
  mainPanel(wellPanel(tags$a(href="https://github.com/mossmatters/structureplot_shiny/tree/master/data", "Click here for example data sets.")),plotOutput('map'))
  )
)) 