library(plotly)

source("source/data_access.R")
load_summaries_and_tables()

server <- function(input, output) {

  output$chart1 <- renderPlotly(return(get_chart1(year = input$chart1_year)))

  output$chart2 <- renderPlotly(return(get_chart2(checks = input$chart2_checks)))

  output$chart3 <- renderPlotly(return(get_chart3(type = input$chart3_type)))

  output$summary1_1 <- renderText({
    return(paste(c("There are ", summary_info_1$num_observations, " observations in this dataset.")))
  })

  output$summary1_2 <- renderText({
    return(paste(c("The highest number of people affected by a disaster is: ", summary_info_1$most_total_affected, ".")))
  })

  output$summary1_3 <- renderText({
    return(paste(c("The highest number of deaths caused by a disaster is: ", summary_info_1$most_total_deaths_costed_by_single_disaster, ".")))
  })

  output$summary1_4 <- renderText({
    return(paste(c("The highest number of homeless caused by a disaster is: ",summary_info_1$most_total_homeless_costed_by_single_disaster, ".")))
  })

  output$summary1_5 <- renderText({
    return(paste(c("The most occurred type of disaster between 1970 and 2021 is ", summary_info_1$most_occurred_disaster, ".")))
  })

  output$summary1_6 <- renderText({
    return(paste(c("There are ", summary_info_1$average_disaster_count, " disasters occurred every year by average between 1970 and 2021.")))
  })

  output$summary2_1 <- renderText({
    return(paste(c("There are ", summary_info_2$num_observation, " observations in this dataset.")))
  })

  output$summary2_2 <- renderText({
    return(paste(c("The greatest anomaly (difference between temperature and the average temperature) is: ", summary_info_2$greatest_anomaly, ".")))
  })

  output$summary2_3 <- renderText({
    return(paste(c("The state with the highest temperature is: ", summary_info_2$state_highest_temp, ".")))
  })

  output$summary2_4 <- renderText({
    return(paste(c("The highest temperature of a state is: ", summary_info_2$highest_temp, ".")))
  })

  output$summary2_5 <- renderText({
    return(paste(c("The state with the lowest temperature is: ", summary_info_2$state_lowest_temp, ".")))
  })

  output$summary2_6 <- renderText({
    return(paste(c("The lowest temperature of a state is: ", summary_info_2$min_temp, ".")))
  })

}