library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "Monitoring")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard"),
    menuItem("About", tabName = "about")
  )
)

body <- dashboardBody("Dashboard\n",
  tabItems(
    tabItem(
      tabName = "dashboard",
      fluidRow(
        div(class = "col-md-2",
            actionButton("box1", label = "Temperature", class = "rounded-box", style = "width: 100%; height: 100px;")
        ),
        div(class = "col-md-2",
            actionButton("box2", label = "Kelembaban", class = "rounded-box", style = "width: 100%; height: 100px;")
        ),
        div(class = "col-md-2",
            actionButton("box3", label = "Kelembaban Tanah", class = "rounded-box", style = "width: 100%; height: 100px;")
        ),
        div(class = "col-md-2",
            actionButton("box4", label = "Wind Direction", class = "rounded-box", style = "width: 100%; height: 100px;")
        ),
        div(class = "col-md-2",
            actionButton("box5", label = "Wind Speed", class = "rounded-box", style = "width: 100%; height: 100px;")
        ),
        div(class = "col-md-2",
            actionButton("box6", label = "Ground Water Level", class = "rounded-box", style = "width: 100%; height: 100px;")
        ),
        div(class = "col-md-12",
            box(
              title = "Grafik",
              plotOutput("plot"),
              class = "rounded-box",
              style = "width: 100%; height: 450px;"
            )
        )
      )
    ),
    tabItem(
      tabName = "about",
      h2("tentang kami")
    )
      
  ),
  
)

ui <- dashboardPage(
  header,
  sidebar,
  body
  
)


server <- function(input,output){
  observeEvent(input$box1, {
    output$plot <- renderPlot({
      plot(rnorm(100))
    })
  })
  observeEvent(input$box2, {
    output$plot <- renderPlot({
      plot(runif(100))
    })
  })
  observeEvent(input$box3, {
    output$plot <- renderPlot({
      hist(rnorm(100))
    })
  })
  observeEvent(input$box4, {
    output$plot <- renderPlot({
      boxplot(rnorm(100))
    })
  })
  observeEvent(input$box5, {
    output$plot <- renderPlot({
      barplot(rnorm(5))
    })
  })
  observeEvent(input$box6, {
    output$plot <- renderPlot({
      plot(density(rnorm(100)))
    })
  })
}

shinyApp(ui=ui, server=server)