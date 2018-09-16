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
              h2("Widgets tab content")
      ),
      
      # Second tab content govind
      tabItem(tabName = "govind",
              h2("govind tab content")
      ),
      # Second tab content pooja
      tabItem(tabName = "pooja",
              h2("pooja tab content")
      ),
      # Second tab content  vikey
      tabItem(tabName = "vikey",
              h2("vikey tab content")
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
}

shinyApp(ui, server)
