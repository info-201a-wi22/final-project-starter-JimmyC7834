# A function that takes in a dataset and returns a list of info about it:
rm(list = ls())
library(dbplyr)

# summerise usa disaster data
data_1 <- data.frame(read.csv("../data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
data_2 <- data.frame(read.csv("../data/110-tavg.csv"))
data_1 <- data_1[data_1$ISO == "USA", ]

summary_info_1 <- list()
summary_info_1$num_observations <- nrow(data_1)

summary_info_1$num_disaster_type <- length(unique(data_1 %>%
  filter(!is.na(Disaster.Subtype)) %>%
  filter(Disaster.Subtype != "") %>%
  pull(Disaster.Subtype)))

summary_info_1$most_occurred_disaster <- tail(names(sort(table(data_1 %>%
                                                                 filter(!is.na(Disaster.Subtype)) %>%
                                                                 filter(Disaster.Subtype != "") %>%
                                                                 pull(Disaster.Subtype)))), 1)

summary_info_1$most_total_damage_costed <- max(data_1 %>%
  filter(!is.na(Total.Damages...000.US..)) %>%
  pull(Total.Damages...000.US..)
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
  summarise(count = n()))$count)

aggragate_info_1$disaster_count <- data_1 %>%
  group_by(Year) %>%
  summarise(count = n())
