# Thrid Chart of the project.
# set work directory

# Load the `dplyr` and `tidyr` libraries for data manipulation
library("dplyr")
library("tidyr")
library("ggplot2") 

data_1 <- data.frame(read.csv("../data/1970-2021_DISASTERS.xlsx - emdat data.csv"))
data_1 <- data_1[data_1$ISO == "USA", ]
data_1 <- data_1 %>%
  select(Year, Seq, Disaster.Type, Location, Start.Year, Start.Month,
         Start.Day, End.Year, End.Month, End.Day, Total.Deaths, No.Injured, No.Affected, No.Homeless,
         Total.Affected)


# Wrangle the data using `tidyr` and `dplyr` -- a common step!
# Select the columns for racial population totals, then
# `gather()` those column values into `race` and `population` columns
make_data <- data_1 %>%
  select(No.Injured, No.Homeless, Total.Deaths) %>%
  gather(key = Dameges, value = Start.Day) # all columns except `state`

data_group <- data_1 %>%
  group_by(Start.Year) %>%
  summarize(Frequency = sum(Seq)) %>%
  select(Start.Year, Frequency) 

# Create a stacked bar chart of the number of people in each state
# Fill the bars using different colors to show racial composition
ggplot(make_data) +
  geom_col(mapping = aes(x = Dameges, y = Start.Day, fill = Dameges))


