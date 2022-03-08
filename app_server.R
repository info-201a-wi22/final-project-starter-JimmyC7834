library(plotly)

source("source/data_access.R")
load_summaries_and_tables()

server <- function(input, output) {
  # output$chart <- renderPlotly({
  #   return(create_chart(data, s_country = input$country_opt, yvar = input$var_opt))
  # })
  #
  # output$summary1 <- renderPlotly({
  #   return(create_summary1(summaries$avg_co2_e_2020))
  # })
  #
  # output$summary2 <- renderText({
  #   return(paste(c(paste(c(summaries$country_w_highest_co2_e[1], " with ", summaries$country_w_highest_co2_e[2])), " million tonnes CO2")))
  # })
  #
  # output$summary3 <- renderText({
  #   return(paste(c(paste(c(summaries$country_w_lowest_co2_e[1], " with ", summaries$country_w_lowest_co2_e[2])), " million tonnes CO2")))
  # })
  #
  # output$summary4 <- renderText({
  #   return(paste(c(paste(c(summaries$country_w_greatest_co2_growth[1], " with ", summaries$country_w_greatest_co2_growth[2])), " % growth since 1990")))
  # })
  #
  # output$summary5 <- renderText({
  #   return(paste(c(paste(c(summaries$country_w_lowest_co2_growth[1], " with ", summaries$country_w_lowest_co2_growth[2])), " % growth since 1990")))
  # })

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