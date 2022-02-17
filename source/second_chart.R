install.packages("areaplot")
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")
disasters <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-JimmyC7834/main/data/1970-2021_DISASTERS.xlsx%20-%20emdat%20data.csv", stringsAsFactors = FALSE)
colnames(disasters)
View(disasters)

Type <- disasters %>% 
  filter(Country == "United States of America (the)") %>% 
  pull(Disaster.Type)

Year <- disasters %>% 
  filter(Country == "United States of America (the)") %>% 
  pull(Year)


data <- data.frame(Year, Type)

type_group <- data %>% 
  group_by(Type) %>% 
  summarize(Frequency = n()) %>% 
  select(Type, Frequency)
print(type_group)

View(data)

#final <- ggplot(data, aes(x = Year, fill = Type))



disaster_plot <- ggplot(type_group, aes(Frequency, Type, fill = Type)) + 
  geom_col() +
  labs(
    title = "The total number of the type of disasters in U.S.",
    x = "The total cases",
    y = "Type of disasters",
  )
disaster_plot
