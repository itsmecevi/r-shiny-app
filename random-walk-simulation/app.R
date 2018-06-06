##############################################################

# This is a Shiny web application. 
# You can run the application by clicking  'Run App' button
# Find out more about building applications with Shiny here:
# http://shiny.rstudio.com/


##############################################################


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Random Walk Simulation"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins1",
                  "Number of Observations (length)",
                  min = 50,
                  max = 1000,
                  value = 100)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot1")
      
    )
  ))

  
  
  
 

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot1 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x<-cumsum(rnorm(input$bins1,0,1))
    t<-c(1:(input$bins1))
    t
    fit1<-lm(x~t)
    abline(fit1,col="2")
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    #bins <- rnorm()
    # draw the histogram with the specified number of bins
    plot.ts(x, ylab="", col = 'blue', border = 'white')
    fit1<-lm(x~t)
    abline(fit1,col="3")
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

