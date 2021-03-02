library("tidyverse")
library("shiny")

homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")

ui <- fluidPage(    
  titlePanel("Log 10 Homerange by Taxon"),
  sidebarLayout(      
    sidebarPanel(
      selectInput("taxon", " Select Taxon of Interest:", 
                  choices=unique(homerange$taxon)),
      sliderInput("fontsize", "Select the Font Size", min = 10, max = 24, value = 18, step = 1),
      hr(),
      helpText("Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211.")
    ),
    mainPanel(
      plotOutput("taxonPlot")  
    )
    
  )
)

server <- function(input, output, session) {
  session$onSessionEnded(stopApp)
  output$taxonPlot <- renderPlot({
    homerange %>% 
      filter(taxon == input$taxon) %>% 
      ggplot(aes(x=log10.hra)) + 
      geom_density(color="black", fill="steelblue", alpha=0.6) +
      theme_light(base_size = input$fontsize)
  })
}

shinyApp(ui, server)