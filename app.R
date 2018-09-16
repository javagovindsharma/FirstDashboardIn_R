## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("govind", tabName = "govind", icon = icon("th")),
      menuItem("pooja", tabName = "pooja", icon = icon("th")),
      menuItem("vikey", tabName = "vikey", icon = icon("th")),
      menuItem("vivan", tabName = "vivan", icon = icon("th")),
      menuItem("gopal", tabName = "gopal", icon = icon("th")),
      menuItem("Widgets1", tabName = "widgets1", icon = icon("th"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content"),
              # infoBoxes with fill=FALSE
              fluidRow(
                # A static infoBox
                infoBox("New Orders", 10 * 2, icon = icon("credit-card")),
                # Dynamic infoBoxes
                infoBoxOutput("progressBox"),
                infoBoxOutput("approvalBox")
              )
      ),
      
      # Second tab content govind
      tabItem(tabName = "govind",
              h2("Welcome Govind Tab using pi Chart "),
              fluidRow(
                box(plotOutput("govindplot", height = 250)),
                
                box(
                  title = "bar",
                  box(plotOutput("govindplot1", height = 250))
                )
              )
      ),
      # Second tab content pooja
      tabItem(tabName = "pooja",
              h2("pooja tab content"),
              # infoBoxes with fill=TRUE
              fluidRow(
                infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE),
                infoBoxOutput("progressBox2"),
                infoBoxOutput("approvalBox2")
              )
      ),
      # Second tab content  vikey
      tabItem(tabName = "vikey",
              h2("vikey tab content"),
              fluidRow(
                # Clicking this will increment the progress amount
                box(width = 4, actionButton("count", "Increment progress"))
              )
      ),
      # Second tab content  gopal
      tabItem(tabName = "gopal",
              h2("gopal tab content")
      ),
      # Second tab content  vivan
      tabItem(tabName = "vivan",
              h2("vivan tab content")
      )
      
      
      
      
      
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  
  output$govindplot <- renderPlot({
    data1=read.csv("/home/tattva/Desktop/govind.csv")
    attach(data1)
    count <- table(gender)
    pie(count)
    
  })
  output$govindplot1 <- renderPlot({
    
    par(mfrow=c(1,2))
    plot(age[gender=="male"],heght[gender=="male"],xlab = "AGE",ylab = "HEIGHT",main="h vs a chart",
         xlim = c(0,60),ylim = c(0,100))
    plot(age[gender=="female"],heght[gender=="female"],xlab = "AGE",ylab = "HEIGHT",main="h vs a chart",
         xlim = c(0,60),ylim = c(0,100))       
    
    
  })
  
  
  
  
  output$progressBox <- renderInfoBox({
    infoBox(
      "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
      color = "purple"
    )
  })
  output$approvalBox <- renderInfoBox({
    infoBox(
      "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  
  # Same as above, but with fill=TRUE
  output$progressBox2 <- renderInfoBox({
    infoBox(
      "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
      color = "purple", fill = TRUE
    )
  })
  output$approvalBox2 <- renderInfoBox({
    infoBox(
      "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow", fill = TRUE
    )
  })
  
  
  
}

shinyApp(ui, server)
