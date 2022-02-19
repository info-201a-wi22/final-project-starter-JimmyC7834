library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")
library("dplyr")
library("tidyr")

# This data set is the one focusing on the disasters and it gives the years which they have taken place
data_1 <- read.csv("../data/1970-2021_DISASTERS.xlsx - emdat data.csv")
data_1 <- data_1[data_1$ISO == "USA", ]
data_1 <- data_1 %>%
  select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
         Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
         Total.Affected)


new_df <- data_1 %>%
  group_by(Disaster = Disaster.Type) %>%
  summarise(Death = sum(Total.Deaths, na.rm = TRUE))


# Distribution of Deaths for each disaster:
# The graph will show us how the deaths are distributed, meaning which disaster
# caused the most deaths.
chart <- ggplot(data = new_df) +
  geom_col(mapping = aes(x = Disaster, y = Death, fill = Disaster), position = "dodge") +
  scale_x_discrete(labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9))