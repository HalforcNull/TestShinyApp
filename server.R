
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(RSQLite)
library(gplots)
library(ggplot2)
library(e1071) # computing kurtosis
library(reshape2) # for melt correlation matrix in heatmap
library(DT) # for renderDataTable
library(plotly) # for interactive heatmap
# bioconductor packages
library(limma) # Differential expression
library(DESeq2) # count data analysis
library(edgeR) # count data D.E.
library(gage) # pathway analysis
library(PGSEA) # pathway 
library(fgsea) # fast GSEA
library(ReactomePA) # pathway analysis
library(pathview)
library(PREDA)  # showing expression on genome
library(PREDAsampledata) 
library(sfsmisc)
library(lokern)
library(multtest)
iDEPversion = "iDEP 0.37"

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
