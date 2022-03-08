# install.packages('rsconnect')
# library(rsconnect)

library("shiny")

source("app_server.R")
source("app_ui.R")

# rsconnect::deployApp('./')
shinyApp(ui = ui, server = server)
