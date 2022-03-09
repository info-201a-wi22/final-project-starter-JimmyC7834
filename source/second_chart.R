install.packages(areaplot)
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)

get_chart2 <- function(checks = list()) {
  data_1 <- data.frame(read.csv("data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
  data_1 <- data_1[data_1$ISO == "USA", ]
  data_1 <- data_1 %>%
    select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
           Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
           Total.Affected)

  if (is.null(checks)) {
    checks <- unique(data_1$Disaster.Type)
  }


  data_1 <- data_1[data_1$Disaster.Type %in% checks, ]

  # generate zeros to make the plot function work
  z_data <- list()
  for (check in checks) {
    z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
    z_data$Type <- append(z_data$Type, rep(check, 52))
  }
  z_data$F <- rep(0, length(checks) * 52)
  z_data <- data.frame(z_data)


  year_group <- rbind(data.frame(Year = data_1$Year, Type = data_1$Disaster.Type, F = data_1$Seq), z_data)
  year_group <- year_group %>%
    group_by(Year, Type) %>%
    summarise(F = sum(F))

  chart <- ggplot(year_group, aes(x=Year, y=F, fill=Type, group=Type)) +
    geom_area() +
    labs(
      title = "The Frequencey of Type of Disasters in U.S from 1970 to 2021",
      x = "Year",
      y = "Frequency"
    )

  return(chart)
}


