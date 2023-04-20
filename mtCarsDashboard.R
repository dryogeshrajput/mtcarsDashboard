library(shiny)
library(dplyr)
library(ggplot2)

# Define UI
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),
  titlePanel("mtcars Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cyl", "Select Cylinder:", 
                  choices = unique(mtcars$cyl), selected = 4),
      sliderInput("hp", "Select Horsepower Range:", 
                  min = 0, max = 400, value = c(0, 200)),
      selectInput("gear", "Select Gear:", 
                  choices = unique(mtcars$gear), selected = 3)
    ),
    mainPanel(
      plotOutput("mpg_vs_wt"),
      plotOutput("mpg_vs_hp"),
      plotOutput("mtcars_bar"),
      tableOutput("mtcars_table")
    )
  )
)

# Define server
server <- function(input, output) {
  
  # Filter mtcars data based on input values
  filtered_mtcars <- reactive({
    mtcars %>%
      filter(cyl == input$cyl) %>%
      filter(hp >= input$hp[1] & hp <= input$hp[2]) %>%
      filter(gear == input$gear)
  })
  
  # Create mpg vs. wt scatterplot
  output$mpg_vs_wt <- renderPlot({
    ggplot(filtered_mtcars(), aes(x = wt, y = mpg)) +
      geom_point(size=15,color = "red",shape=15) +
      labs(title = "mpg vs. wt Scatterplot", x = "Weight (1000 lbs)", y = "Miles per Gallon")
  })
  
  # Create mpg vs. hp scatterplot
  output$mpg_vs_hp <- renderPlot({
    ggplot(filtered_mtcars(), aes(x = hp, y = mpg)) +
      geom_point(size=15,color = "blue", shape=18) +
      labs(title = "mpg vs. hp Scatterplot", x = "Horsepower", y = "Miles per Gallon")
  })
  
  # Create mtcars bar chart
  output$mtcars_bar <- renderPlot({
    ggplot(filtered_mtcars(), aes(x = factor(gear))) +
      geom_bar(fill = "#f39c12") +
      labs(title = "Count of Cars by Gear", x = "Gear", y = "Count")
  })
  
  
  
  # Create mtcars table
  output$mtcars_table <- renderTable({
    filtered_mtcars() %>%
      select(mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
  })
}

# Run the app
shinyApp(ui, server)
