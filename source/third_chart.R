library(dplyr)
library(tidyr)
library(ggplot2)

get_chart3 <- function(type = -1){
  data_1 <- data.frame(read.csv("data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
  data_1 <- data_1[data_1$ISO == "USA", ]
  data_1 <- data_1 %>%
    select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
           Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
           Total.Affected)
  if (type %in% unique(data_1$Disaster.Type)) {
    data_1 <- data_1[data_1$Disaster.Type == type, ]
  }

  summary_data <- data_1 %>%
    summarise(sum_homeless = sum(No.Homeless, na.rm = TRUE), sum_injured = sum(No.Injured, na.rm = TRUE), sum_affected = sum(No.Affected, na.rm = TRUE))

  t_data <- data.frame(
    Type = c("Homeless", "Injured", "Affected"),
    Sum = c(summary_data$sum_homeless, summary_data$sum_injured, summary_data$sum_affected)
  )

  chart <- ggplot(t_data, aes(x = Type, y = Sum, fill = Type)) +
    geom_bar(stat='identity') +
    labs(
      title = "The Sum of Damages to People by Desasters",
      x = "Type of Desasters",
      y = "Number of People"
    )

  return(chart)
}


