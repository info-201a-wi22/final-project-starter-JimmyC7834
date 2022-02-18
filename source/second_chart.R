install.packages("areaplot")
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library("plotly")
disasters <- data.frame(read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-JimmyC7834/main/data/1970-2021_DISASTERS.xlsx%20-%20emdat%20data.csv", stringsAsFactors = FALSE))
# colnames(disasters)
# View(disasters)

disasters <- disasters[disasters$ISO == "USA",]

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

# View(data)

#final <- ggplot(data, aes(x = Year, fill = Type))


disaster_plot <- ggplot(type_group, aes(Frequency, Type, fill = Type)) + 
  geom_col() +
  labs(
    title = "The total number of the type of disasters in U.S.",
    x = "The total cases",
    y = "Type of disasters",
  )
disaster_plot


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

year_group <- data.frame(table(disasters$Year, disasters$Disaster.Type))
year_group <- data.frame(Year = year_group$Var1, Type = year_group$Var2, F = year_group$Freq)

ggplot(year_group, aes(x=Year, y=F, fill=Type, group=Type)) + geom_area()

