library(shiny)
library(plotly)

source("source/data_access.R")

main_panel <- tabPanel(
  "CCUS",
  titlePanel("Climate Change in the United States"),
  p("Author: Jimmy Cheong, Hamda Hassan, Takumi Shimada, Yohannes Tekle"),
  p("Date: 3/8/2022"),
  p("Affiliation: INFO-201 - Technical Foundations of Informatics - The Information School - University of Washington"),
  p("Keywords: Global warming, Air pollution, Extreme Weathers, Environmental Racism", style="font-style: italic;"),
  img(src = "https://cangeo-media-library.s3.amazonaws.com/s3fs-public/styles/web_article_slider_image/public/images/web_articles/article_images/5392/climate_change_header.jpg?itok=AlQyQbxj", style = "object-fit: none; height: 400px; width: 100%; margin-left: auto; margin-right: auto;"),
  h2("Abstract"),
  p("For our project, we chose to discuss the issue of climate change by answering the question What causes and contributes to the climate crisis in the U.S?. This question will help us learn more about climate change, potentially its effects on the U.S. and further understand the root of the problem. To address this question we will analyze our data and get concise answers."),
  h2("Introduction"),
  p("Climate change is when changes occur in weather in a region or our global weather patterns, including changes in the amount of rain, temperature, sea levels, and extreme phenomena like heat waves, floods, and hurricanes. As our technology progresses along with society, human activities that cause damage to the natural environment have also increased greatly. Riding transportation, generating electricity, producing industrial products...etc. While these activities are all creating pollution to our planet in various ways, the common and most impactful source of pollution is the carbon dioxide emissions into the air. For our project, we would analyze and compare data about climate changes in every state in the U.S. through several visualizations to help us understand the development of climate change in the U.S., the causes, the victims, the risks, how they affect each other, and future changes we could potentially make to mitigate the risks."),
  h2("Design Situation"),
  h4("Project Framing:"),
  p("Project framing will be climate change in states and how it has changed over time. Climate change is a significant problem nowadays. It is not only happening in the U.S. but also happening in the global environment. However, in our project, we will put our focus on the U.S. to see how climate change has affected local residents. While there are multiple reasons why climate change is unstoppable, human activities are the main contributor to its development and we wish to spot the causes through data."),
  h4("Human Values:"),
  p("We will focus on how climate change might affect and cause consequences on humans and society, and reflect the relationship between humans and nature. Climate change is a complicated problem and all of us are involved in solving or contributing to it; people have different opinions and perspectives of the current environment which causes difficulties in solving the problem. For instance, many researchers and specialists believe electric cars will save the natural environment. On the contrary, some of them disagree with it due to several reasons. However, while human activities cause damage to nature, we would still need to balance human activities and the natural environment in order for society to progress."),
  h4("Direct Stakeholders:"),
  p("Journalists and researchers who refer to this project by analyzing and publishing articles related to it would be benefited. Politicians who change policies depending on this project would also be benefited from their new policies which might regulate human activities and seek balance among the natural environment, As politics is also a key to climate change and how politicians apply them to the natural environment."),
  h4("Harms:"),
  p("In the process of searching and analyzing, we might end up finding data that does not have a credible source. Our immature data analyzing skills might also conduct misinformation; we're still learning how we analyze the data and we still have different perspectives and biases on this topic. It may end up including incorrect information in this project and confuse people who review this project."),
  h4("Benefits:"),
  p("We would be able to understand what causes climate change and how it affects different states in the U.S. Also if those who read the articles get inspired by this project, they may change their attitude and opinions towards climate change which potentially pushes the progress of solving the problem of climate change. They might expand this topic and create a new discussion for climate change."),
  h2("Research questions"),
  p("The following two questions will help us learn the development of climate change in the U.S. which would provide us with information about the cause and the contributors of climate change by analyzing the temperature changes in various states and conduct the causes of climate crisis in the U.S:"),
  p("Has climate change always been an issue?", style="font-weight: bold; font-style: italic;"),
  p("What causes and contributes to the climate crisis in the U.S?", style="font-weight: bold; font-style: italic;"),
  p("While these questions are asked so that we can analyze the impact and its seriousness in various states in the country which will help us to see the damage and negative effects climate change has brought us by analyzing natural disasters and the lost cost in various states:"),
  p("Who is most vulnerable to climate change issues?", style="font-weight: bold; font-style: italic;"),
  p("Which state has the most/least intense climate (for example, intense temperature change)?", style="font-weight: bold; font-style: italic;"),
  h2("Dataset"),
  h4("First Dataset"),
  a("All Natural Disasters from 1970 to 2021 in the U.S.", href="https://www.kaggle.com/brsdincer/all-natural-disasters-19002021-eosdis"),
  p("The first data we found and that we would work with consists of two different files, one is all-natural disasters from 1990-2021 and the other which we would be using is focusing on **1970-2022**. The data covered different countries, but we had filtered the dataset and kept the focus on the **United States** only. We will use this data to understand the different kinds of issues we are dealing with, also we will be comparing different disasters to learn which ones have the most serious impact upon the region."),
  p("Data Credibility:", style="font-weight: bold;"),
  p("We found this data on kaggle.com which the owner is a researcher and founder of the Space Science And Climate Observation Initiative. The data were gathered from \"Earth Observing System Data and Information System\" (EOSDIS), created by the owner recently on 10/2021. We don't truly know that the data is 100% credible, but based on the information source and the data provided in the CSV file, we believe it would be sufficient to answer our questions."),
  p("Data Size:", style="font-weight: bold;"),
  p("This data has around **1000 observations** and more than **45 variables**, where we would only be using around **20** of the variables including the type of natural disasters that have occurred, the damages they have caused, location, date, etc."),
  p("Summaries:", style="font-weight: bold;"),
  textOutput("summary1_1"),
  textOutput("summary1_2"),
  textOutput("summary1_3"),
  textOutput("summary1_4"),
  textOutput("summary1_5"),
  textOutput("summary1_6"),
  h4("Second Dataset"),
  a("Contiguous U.S. Statewide Average Temperature", href="https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/statewide/mapping/110/tavg/202112/12"),
  p("This data contains the monthly average temperature of each state in the United States from **1895 to 2021**. This could help us prove climate change by showing the trends of increasing temperature in the U.S. We can also use the change in temperature to learn the intensity of the current temperature change."),
  p("Data Credibility:", style="font-weight: bold;"),
  p("This data was created by the National Centers For Environmental Information (NCEI), which is the Nation’s leading authority for environmental data. Therefore the source is credible and inclusive enough for us to address our questions."),
  p("Data Size:", style="font-weight: bold;"),
  p("This data consists of around **70k observations** and **6 variables**. Indicating the date, temperature in Fahrenheit, ranking of the year, anomaly, etc."),
  p("Summaries:", style="font-weight: bold;"),
  textOutput("summary2_1"),
  textOutput("summary2_2"),
  textOutput("summary2_3"),
  textOutput("summary2_4"),
  textOutput("summary2_5"),
  textOutput("summary2_6")
)

summary_panel <- tabPanel(
  "Summaries",
  titlePanel("Data Summaries of CCUS")
)

chart1_panel <- tabPanel(
  "Chart 1",
  titlePanel("Total Deaths by Dieasters in a certain Year"),
  selectInput(
    inputId = "chart1_year",
    label = "Select Year of Data:",
    choices = rbind("All Years", seq(from=1970, to=2021))
  ),
  plotlyOutput("chart1")
)

chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("The Frequencey of Type of Disasters in U.S from 1970 to 2021"),
  checkboxGroupInput("chart2_checks", "Choose Desaster Type(s):",
    choiceNames = unique(data_1$Disaster.Type),
    choiceValues = unique(data_1$Disaster.Type),
    selected = unique(data_1$Disaster.Type)
  ),
  plotlyOutput("chart2")
)

chart3_panel <- tabPanel(
  "Chart 3",
  titlePanel("The Frequencey of Damages by Desasters"),
  selectInput(
    inputId = "chart3_type",
    label = "Type of Desasters",
    choices = rbind("All Desasters", unique(data_1$Disaster.Type))
  ),
  plotlyOutput("chart3")
)

acknowledgements_panel <- tabPanel(
  "Acknowledgements",
  titlePanel("Acknowledgements"),
  p("We would like to acknowledge each other for working on this project and helping each other to fulfill the requirements of this project. We also would like to thank our teacher's assistant (TA) for helping us understand the specification of the project with patience and kindness.")
)

references_panel <- tabPanel(
  "References",
  titlePanel("References"),
  p("NCEI.Monitoring.info@noaa.gov. \"Climate at a Glance.\" Climate at a Glance | National Centers for Environmental Information (NCEI), Jan. 2022, https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/statewide/mapping/110/tavg/202112/12.", style="font-style: italic;"),
  p("Dincer, B. (2021, October 10). All natural disasters 1900-2021 / eosdis. Kaggle. Retrieved February 4, 2022, from https://www.kaggle.com/brsdincer/all-natural-disasters-19002021-eosdis", style="font-style: italic;"),
)

ui <- navbarPage(
  "Climate Change in the United States",
  main_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  acknowledgements_panel,
  references_panel,
)