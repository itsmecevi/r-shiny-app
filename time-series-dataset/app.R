library(shiny)

# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Time Series Data sets in package 'astsa':"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("EQ5","EQcount","EXP6","HCT","PLT",
                              "UnempRate","WBC","ar1miss","arf","beamd",
                              "birth" ,                       
                              "blood",                         
                              "bnrf1ebv",                      
                              "bnrf1hvs" ,                     
                              "chicken",                       
                              "climhyd",                      
                              "cmort" ,                        
                              "cpg" ,                          
                              "djia" ,                         
                              "econ5",                         
                              "eqexp",                        
                              "flu" ,
                              "fmri" ,                         
                              "fmri1",                         
                              "gas",                          
                              "globtemp" ,                     
                              "globtempl",                     
                              "gnp" ,                          
                              "gtemp",                         
                              "gtemp2" ,                       
                              "hor" ,                          
                              "jj",                            
                              "lap" ,                          
                              "lead" ,                         
                              "nyse",                          
                              "oil" ,                         
                              "part" ,                         
                              "prodn" ,                        
                              "qinfl",                         
                              "qintr" ,                        
                              "rec",                          
                              "sales" ,                        
                              "salt" ,                         
                              "saltemp" ,                     
                              "so2" ,                          
                              "soi" ,                          
                              "soiltemp",                      
                              "sp500w",                        
                              "speech",                        
                              "star" ,                         
                              "sunspotz" ,                     
                              "tempr" ,                        
                              "unemp" ,                        
                              "varve"                         
                              
                           )),
      
      # Input: Numeric entry for number of obs to view ----
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),
      
      # Output: HTML table with requested number of observations ----
      tableOutput("view")
      
    )
  )
)

# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  
  # Return the requested dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "EQ5" = EQ5,
           "EQcount" =EQcount,
           "EXP6" = EXP6,
           "HCT"=HCT,
           "PLT"=PLT,
           "UnempRate"=UnempRate,
           "WBC"=WBC,"ar1miss"=ar1miss,"arf"=arf,"beamd"=beamd ,
           "birth" =birth ,                     
           "blood" =blood ,                       
           "bnrf1ebv" = bnrf1ebv ,                   
           "bnrf1hvs" = bnrf1hvs ,                   
           "chicken"  =chicken ,                    
           "climhyd"  =  climhyd ,                 
           "cmort"  = cmort ,                     
           "cpg"  =cpg ,                      
           "djia" =djia ,                        
           "econ5" =econ5  ,                      
           "eqexp" =eqexp,                       
           "flu"=flu ,
           "fmri" =fmri,                         
           "fmri1"=fmri1 ,                        
           "gas"=gas ,                         
           "globtemp"=globtemp ,                     
           "globtempl" =globtemp1  ,                  
           "gnp"=gnp ,                          
           "gtemp"=gtemp,                         
           "gtemp2"=gtemp2  ,                      
           "hor"=hor,                           
           "jj"=jj ,                           
           "lap"=lap ,                          
           "lead"=lead ,                         
           "nyse"=nyse ,                         
           "oil"=oil ,                         
           "part"=part,                          
           "prodn"=prodn ,                        
           "qinfl"=qinfl ,                        
           "qintr"=qintr,                         
           "rec"=rec ,                         
           "sales"=sales,                         
           "salt" =salt,                        
           "saltemp"=saltemp ,                     
           "so2"=so2 ,                          
           "soi"= soi ,                         
           "soiltemp"=soiltemp ,                     
           "sp500w" =sp500w ,                      
           "speech"=speech,                        
           "star"=star,                          
           "sunspotz"=sunspotz ,                     
           "tempr"=tempr,                         
           "unemp"=unemp,                         
           "varve"=varve                         
           
           
           )})
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations ----
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)