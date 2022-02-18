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


info_1_disaster_count <- data.frame(disaster_count = data.frame(data_1 %>%
  group_by(Year) %>%
  summarise(freq = n())))

info_1_top_homeless <- data_1 %>%
  filter(!is.na(No.Homeless)) %>%
  filter(Disaster.Type != "") %>%
  group_by(Disaster.Type) %>%
  summarise(n_homeless = sum(No.Homeless)) %>%
  arrange(desc(n_homeless))


install.packages("areaplot")
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")


# This data set is the one focusing on the disasters and it gives the years which they have taken place
data_file <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-JimmyC7834/main/data/1970-2021_DISASTERS.xlsx%20-%20emdat%20data.csv"
disasters_data <- read.csv(data_file, stringsAsFactors = FALSE)


# This second data specifically focuses on the temperatures of different states.
data_file2 <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-JimmyC7834/main/data/110-tavg.csv"
us_avg_temps <- read.csv(data_file2, stringsAsFactors = FALSE)


# Here we created a data frame that just focuses on the Unites States and looks
# at the different locations and the after math of the disasters
us_df <- disasters_data %>%
  filter(Country == "United States of America (the)") %>%
  select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
         Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
         Total.Affected)

# Here, We used the data frame we created to just focus on the locations and
# the specific disaster that occurred most in each location. The question we
# want to answer.
# *Which disaster occurred the most each year?*
new_df <- us_df %>%
  group_by(Year) %>%
  summarise(Disaster_Type = max(Disaster.Type), Max_Seq = max(Seq))
