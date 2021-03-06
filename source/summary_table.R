library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")
library("dplyr")
library("tidyr")

data_1 <- read.csv("data/1970-2021_DISASTERS.xlsx - emdat data.csv")
data_1 <- data_1[data_1$ISO == "USA", ]
data_1 <- data_1 %>%
  select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
         Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
         Total.Affected)

# aggegate tables data 1
info_1_top_homeless <- data_1 %>%
  filter(!is.na(No.Homeless)) %>%
  filter(Disaster.Type != "") %>%
  group_by(Disaster.Type) %>%
  summarise(n_homeless = sum(No.Homeless)) %>%
  arrange(desc(n_homeless))

year_group <- data.frame(Year = data_1$Year, Type = data_1$Disaster.Type, F = data_1$Seq)
year_group <- year_group %>%
  group_by(Year, Type) %>%
  summarise(F = sum(F))

info_1_max_seq_by_year <- year_group %>%
  group_by(Year) %>%
  filter(F == max(F)) %>%
  summarise(Disaster_Type = Type, Max_Seq = max(F))

info_1_disaster_deaths <- data_1 %>%
  group_by(Disaster = Disaster.Type) %>%
  summarise(Death = sum(Total.Deaths, na.rm = TRUE)) %>%
  arrange(desc(Death))


data_2 <- data.frame(read.csv("data/110-tavg.csv"))


states_df <- data_2 %>%
  group_by(Location) %>%
  summarise(Mean_temp = mean(X1901.2000.Mean))
states_df$Mean_temp <- round(states_df$Mean_temp, digits = 3)

info_2_max_avg_anomaly <- data_2 %>%
  group_by(Location) %>%
  summarise(Mean_anomaly = mean(Anomaly..1901.2000.base.period.)) %>%
  arrange(desc(Mean_anomaly))

info_2_max_avg_anomaly <- head(info_2_max_avg_anomaly, 10)
info_2_max_avg_anomaly$Mean_anomaly <- round(info_2_max_avg_anomaly$Mean_anomaly, digits = 3)


