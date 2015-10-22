source('params.R')
shinyUI(fluidPage(
  titlePanel("Structure Plots in R"),
  sidebarLayout(
    sidebarPanel(
    wellPanel(
      fileInput('structure_file',"Upload a Structure Q-Matrix File")
    ),
    wellPanel(
      numericInput("k","Number of clusters",2)
    ),
  
    wellPanel(
      uiOutput("numClusters")
    ),
    wellPanel(
      uiOutput("getPopLabels")
      #submitButton("submit")
    ),
    wellPanel(
      checkboxInput("sort_indiv",label="Sort the Q-Matrix by Population?")
    )
    
    
  ),
  mainPanel(plotOutput('map'))
  )
)) 