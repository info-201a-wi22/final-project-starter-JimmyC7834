install.packages("areaplot")
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")

data_1 <- data.frame(read.csv("../data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
data_1 <- data_1[data_1$ISO == "USA", ]
data_1 <- data_1 %>%
  select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
         Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
         Total.Affected)


Type <- data_1$Disaster.Type

Year <- data_1$Year


# year_group <- year_group %>%
#   filter(F != 0) %>%
#   group_by(Year) %>%
#   summarize(
#     Drought = sum(F[Type == "Drought"]),
#     Earthquake = sum(F[Type == "Earthquake"]),
#     Epidemic = sum(F[Type == "Epidemic"]),
#     Extreme_temperature = sum(F[Type == "Extreme temperature "]),
#     Flood = sum(F[Type == "Flood"]),
#     Landslide = sum(F[Type == "Landslide"]),
#     Storm = sum(F[Type == "Storm"]),
#     Volcanic_activity = sum(F[Type == "Volcanic activity"]),
#     Wildfire = sum(F[Type == "Wildfire"])
#   )

# generate zeros to make the plot function work
z_data <- list()
z_data$Year <- seq(from = 1970, to = 2021)
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Year <- append(z_data$Year, seq(from = 1970, to = 2021))
z_data$Type <- append(z_data$Type, rep("Drought", 52))
z_data$Type <- append(z_data$Type, rep("Earthquake", 52))
z_data$Type <- append(z_data$Type, rep("Epidemic", 52))
z_data$Type <- append(z_data$Type, rep("Extreme temperature ", 52))
z_data$Type <- append(z_data$Type, rep("Flood", 52))
z_data$Type <- append(z_data$Type, rep("Landslide", 52))
z_data$Type <- append(z_data$Type, rep("Storm", 52))
z_data$Type <- append(z_data$Type, rep("Volcanic activity", 52))
z_data$Type <- append(z_data$Type, rep("Wildfire", 52))
z_data$F <- rep(0, 9 * 52)
z_data <- data.frame(z_data)


year_group <- rbind(data.frame(Year = data_1$Year, Type = data_1$Disaster.Type, F = data_1$Seq), z_data)
year_group <- year_group %>%
  group_by(Year, Type) %>%
  summarise(F = sum(F))

chart <- ggplot(year_group, aes(x=Year, y=F, fill=Type, group=Type)) +
  geom_area() +
  labs(
    title = "The frequencey of type of disaster in U.S from 1970 to 2021",
    x = "Year",
    y = "Frequency"
  )

