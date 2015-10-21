library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Data Science FTW"),
    sidebarPanel(
        h3('SideBar text')
    ),
    mainPanel(
        h3('Main Panel txt')
    )
))

library(shiny)
shinyServer(
    function(input, output) {
    }
)
