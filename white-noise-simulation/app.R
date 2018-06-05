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
  titlePanel("White Noise Simulation"),
  
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
  ),
  
  
  
  
  
  # Application title
  titlePanel("Autocorrelation Function (Lags)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins2",
                  "Number of Lags",
                  min = 1,
                  max = 50,
                  value = 10)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot2")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot1 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x<-rnorm(input$bins1,0,1) 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    #bins <- rnorm()
    # draw the histogram with the specified number of bins
    plot.ts(x, ylab="", col = 'red', border = 'white')
  })
  
  
  
  ####
  
  output$distPlot2 <- renderPlot({
    # generate bins based on input$bins2 from ui.R
    acf(rnorm(input$bins1,0,1),input$bins2)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

