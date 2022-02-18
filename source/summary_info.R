# A function that takes in a dataset and returns a list of info about it:
rm(list = ls())
library(dbplyr)
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library(plotly)

# summerise usa disaster data
data_1 <- data.frame(read.csv("../data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
data_2 <- data.frame(read.csv("../data/110-tavg.csv"))


# clean up data
data_1 <- data_1[data_1$ISO == "USA", ]
data_1 <- data_1 %>%
  select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
         Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
         Total.Affected)

# summaries data 1
summary_info_1 <- list()
summary_info_1$num_observations <- nrow(data_1)

summary_info_1$num_disaster_type <- length(unique(data_1 %>%
                                                       filter(!is.na(Disaster.Type)) %>%
                                                       filter(Disaster.Type != "") %>%
                                                       pull(Disaster.Type)))

disasters_count <- data_1 %>%
  filter(!is.na(Disaster.Type)) %>%
  filter(Disaster.Type != "") %>%
  group_by(Disaster.Type) %>%
  summarise(F = sum(Seq))

summary_info_1$most_occurred_disaster <- disasters_count$Disaster.Subtype[disasters_count$F == max(disasters_count$F)]


summary_info_1$most_total_affected <- max(data_1 %>%
  filter(!is.na(Total.Affected)) %>%
  pull(Total.Affected)
)

summary_info_1$most_total_deaths_costed_by_single_disaster <- max(data_1 %>%
  filter(!is.na(Total.Deaths)) %>%
  pull(Total.Deaths)
)

summary_info_1$most_total_homeless_costed_by_single_disaster <- max(data_1 %>%
  filter(!is.na(No.Homeless)) %>%
  pull(No.Homeless)
)

summary_info_1$average_disaster_count <- mean((data_1 %>%
  group_by(Year) %>%
  summarise(count = sum(Seq)))$count)

# aggegate tables data 1
info_1_top_homeless <- data_1 %>%
  filter(!is.na(No.Homeless)) %>%
  filter(Disaster.Type != "") %>%
  group_by(Disaster.Type) %>%
  summarise(n_homeless = sum(No.Homeless)) %>%
  arrange(desc(n_homeless))

# Here, We used the data frame we created to just focus on the locations and
# the specific disaster that occurred most in each location. The question we
# want to answer.
# *Which disaster occurred the most each year?*

info_1_max_seq_by_year <- data_1 %>%
  group_by(Year) %>%
  summarise(Disaster_Type = max(Disaster.Type), Max_Seq = max(Seq))

# summeries data 2
summary_info_2 <- list()
summary_info_2$num_observations <- nrow(data_2)
summary_info_2$highest_temp <- max(data_2$Value)
summary_info_2$min_temp <- min(data_2$Value)
summary_info_2$greatest_anomaly <- max(data_2$Anomaly..1901.2000.base.period.)
summary_info_2$state_highest_temp <- data_2$Location[data_2$Value == max(data_2$Value)]
summary_info_2$state_lowest_temp <- data_2$Location[data_2$Value == min(data_2$Value)]
