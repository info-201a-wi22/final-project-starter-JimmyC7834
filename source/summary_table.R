install.packages("areaplot")
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")


#This data set is the one focusing on the disasters and it gives the years which they have taken place 
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
View (us_df)

# Here, We used the data frame we created to just focus on the locations and
# the specific disaster that occurred most in each location. The question we 
# want to answer.
# *Which disaster occurred the most each year?* 

new_df <- us_df %>%
  group_by(Year) %>%
  summarise(Disaster_Type = max(Disaster.Type), Max_Seq = max(Seq)) 
  View(new_df)


