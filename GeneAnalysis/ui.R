library(shiny)
library(shinythemes)

shinyUI(fluidPage(
    tags$head(
      tags$style(HTML("img.resize{
                      max-width:10%;
                      max-height:10%;
                      }
                      #text{
                        font-family: Impact, Charcoal, sans-serif;
                        font-size: 25px;
                        color: white;
                        font-weight: large;
                      }
                      body{background: url(dna.png) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
                      -o-background-size: cover;
                      background-size: cover;}
                      h1{
                        text-shadow: 0 1px 0 #ccc,
                      0 2px 0 #c9c9c9,
                      0 3px 0 #bbb,
                      0 4px 0 #b9b9b9,
                      0 5px 0 #aaa,
                      0 6px 1px rgba(0,0,0,.1),
                      0 0 5px rgba(0,0,0,.1),
                      0 1px 3px rgba(0,0,0,.3),
                      0 3px 5px rgba(0,0,0,.2),
                      0 5px 10px rgba(0,0,0,.25),
                      0 10px 10px rgba(0,0,0,.2),
                      0 20px 20px rgba(0,0,0,.15);
                        font-family: Impact, Charcoal, sans-serif;
                        color: white;
                        font-size: 40px;

                      }
                ")
      )
    ),
                  
	#title of  app
  	headerPanel(
	    HTML('<img class = "resize" src="raptor.png"/>')
	),
    titlePanel(h1("GENE ANALYSIS", align = "center")),
	#sidebar with file input
	sidebarLayout(position = "right",
		sidebarPanel(
			textInput("fileInput", "File Input", ""), 
      actionButton("submit", "submit file")
		),

		mainPanel(
			tableOutput("text")
		)
	)
))
