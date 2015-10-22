source('helpers.R')

filename = "data/nomissing.clumpp.out"
k = 2
global_barcolors = c('gray80','gray50','red','green','blue','orange','pink')
#poplabels = c("Bulgaria","Canada","Czech Republic","Finland","Japan","Luxembourg","Norway","Poland","Russia","Slovakia","Spain","Sweden","Switzerland","UK","USA")

shinyServer(function(input,output){
  
  output$getPopLabels = renderUI({
    numPops = 8 # length(tapply(mydata$V1,mydata$V4,length))
    textInput('poplabel_string',
                "Input the Population Names, Separated by Commas",
              "1,2,3,4,5,6,7,8,9"
                )
  
  })
  
  output$numClusters = renderUI({
    
    k = input$k
    helpText("Choose the colors for each cluster")
    lapply(1:k,function(i){
      selectInput(paste0("k",i,"_col"),
                  label = paste("Cluster",i," Color"),
                  choices = global_barcolors,
                  selected=global_barcolors[i])
    })
    
  })
  output$map = renderPlot({
    if(is.null(input$structure_file))
      filename=filename
    
    else{
      infile = input$structure_file
      filename = infile$datapath
      
    }
    mydata = read.table(filename,header=FALSE)
    
    
    barcolors = unlist(lapply(1:input$k,function(i) input[[paste0("k",i,"_col")]]))
    #barcolors = c(input$k1_col,input$k2_col,input$k3_col)
    poplabels = unlist(strsplit(input$poplabel_string,split=','))
    structure_plot(mydata=mydata,k=input$k,barcolors=barcolors,poplabels=poplabels,sort_by_pop=input$sort_indiv)
  })
})