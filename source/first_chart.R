library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library(tidyr)

get_chart1 <- function(year = -1) {
  # Chart of the disasters code:
  data_1 <- data.frame(read.csv("data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
  data_1 <- data_1[data_1$ISO == "USA", ]
  data_1 <- data_1 %>%
    select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
           Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
           Total.Affected)
  if (year %in% seq(from=1970, to=2021)) {
    data_1 <- data_1[data_1$Year == year, ]
  }


  deaths <- data_1 %>%
    group_by(Disaster = Disaster.Type) %>%
    summarise(Death = sum(Total.Deaths, na.rm = TRUE))


  chart <- ggplot(data = deaths) +
    geom_col(mapping = aes(x = Disaster, y = Death, fill = Disaster), position = "dodge") +
    scale_x_discrete(labels = c("Drought", "Earthquake", "Epidemic", "Extreme temperature", "Flood", "Landslide", "Storm", "Volcanic activity", "Wildfire")) +
    labs(
      title = "Total Deaths by Dieasters in a certain Year",
      x = "Type of Desaster",
      y = "Deaths"
    )

  return(chart)
}
