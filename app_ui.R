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
  textOutput("summary2_6"),
  h2("Findings"),
  p("Has climate change always been an issue?", style="font-weight: bold; font-style: italic;"),
  p("Climate change has not always been an issue in the beginning of 1970. From the chart, which describes the frequency of type of disaster in U.S from 1970 to 2021, there are many types of disaster such as drought, earthquake, epidemic, extreme temperature, flood, landslide, storm, volcanic activity, and wildfire in U.S. Some of them have been big issues, but some of them have not. In the beginning around 1970, climate change has not been an issue as the chart indicates the frequency of disaster was not high. However, from 1990, climate change has been an issue in 1990 especially such as drought, flood and storm and climate change has been an issue nowadays."),
  p("What causes and contributes to the climate crisis in the U.S?", style="font-weight: bold; font-style: italic;"),
  p("Who is most vulnerable to climate change issues?", style="font-weight: bold; font-style: italic;"),
  p("Which state has the most/least intense climate (for example, intense temperature change)?", style="font-weight: bold; font-style: italic;"),
  p("After going through the two data sets we found and analyzing it using Rstudio and DataSpell, we have learned a lot about climate change in the United States. We have learned about the different disasters that are common in this country and how these disasters impacted the lives of people here.  Based on the dates from both our data, it’s clear that our climate has been changing, there were less occurrences of storms and other disasters in the 1970s and the temperatures of states were different, but the issue has always been there. So, to answer our first question, climate change has always been an issue and it will continue to be an issue. Many different events and activities contribute to climate These activities endanger humans, animals, the water, etc. The people that are most vulnerable to climate change are those that live near area where disasters occur. These disasters have long lasting effects. They cause homelessness and economic problems. For example, from our data, we have learned that storms that have occurred between 1970 and 2021 have caused a total of 534132 homelessness. This is a large number, and it means that so many people have lost everything because of these disasters and because of our climate situation. The average temperature for each state has also been changing. The state that has the most intense climate is the state of Florida and its average temperature between 1995 and 2021 was 70.136. The state with the lowest climate or the lowest average temperature between 1995 and 2021 was North Dakota with an average temperature of 39.683."),
  h2("Discussion"),
  p("Our findings have helped us learn new facts about climate change. Before we started this project and before we started our research, we knew very little about climate change and we had a lot of assumptions but working on this project has changed our thinking. Using our two data sets, we have learned that the natural disasters that occur have serious consequences, even if it’s just one. The death of innocent people is the biggest issue that comes after the disasters, but the problem does not stop with deaths. After the deaths, there are people that lose their jobs, their homes, and almost everything else. We have also learned about the effects these disasters and hot temperatures have on the animals and how they change the earth. All these findings are important because they help us understand that climate change is not something to be taken lightly. It’s a serious issue that needs all our attention. If we want to change our climate crisis, we need to make a lot of changes in our lives. There are changes that government institutions could make, there are changes that big companies could make, and there are changes we civilians could make."),
)

summary_panel <- tabPanel(
  "Summaries",
  titlePanel("Data Summaries of CCUS"),
  sidebarLayout(
    sidebarPanel(
      h2("Three Takeaways"),
      p("The climate change is REAL", style = "font-weight: bold; font-style: italic;"),
      p("Exetreme Weathers are getting more as climate changes", style = "font-weight: bold; font-style: italic;"),
      p("We should all start taking actions from now", style = "font-weight: bold; font-style: italic;")
    ),
    mainPanel(
      p("The goal of our project is to bring awareness on an issue that many people doubt even though there is evidence that proves it. We want people to act and to care about the environment because we only have one earth and polluting it and extracting the natural resources only causes us serious problems. We must educate ourselves on this issue, then make change in our daily activity. Being aware that a problem exists is the first step, once we have acknowledged it, then we can act. Making small changes such as using less gas, recycling correctly, using less plastic containers, and eating less will benefit us and help us make our earth safer for everyone."),
    )
  )
)

chart1_panel <- tabPanel(
  "Chart 1",
  titlePanel("Total Deaths by Dieasters in a certain Year"),
  sidebarLayout(
    sidebarPanel(
      p("This chart combines the total deaths that occurred for each disaster from the years 1970-2021. Just by looking at the chart, you will be able to see the disaster that caused the highest number of deaths and the disaster that caused the lowest. If you also look at the x and y axis, you can see that this chart is showing a relationship between the deaths and the disasters.")
    ),
    mainPanel(
      selectInput(
        inputId = "chart1_year",
        label = "Select Year of Data:",
        choices = rbind("All Years", seq(from=1970, to=2021))
      ),
      plotlyOutput("chart1"),
    )
  )

)

chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("The Frequencey of Type of Disasters in U.S from 1970 to 2021"),
  p("This chart indicates the frequency of type of disaster such as drought, earthquake, epidemic, extreme temperature, flood, landslide, storm, volcanic activity, wildfire in U.S from 1970 to 2021. Each disaster is labeled in color, for example, drought is red, earthquake is brown and etc. By doing this, the audience and researcher distinguish the type of disaster and look at each trend by year. They could also select the data of the type of disaster desired to do more specific researches. This chart tried to answer the first question, Has climate change always been an issue?"),
  checkboxGroupInput("chart2_checks", "Choose Disaster Type(s):",
    choiceNames = unique(data_1$Disaster.Type),
    choiceValues = unique(data_1$Disaster.Type),
    selected = unique(data_1$Disaster.Type)
  ),
  plotlyOutput("chart2")
)

chart3_panel <- tabPanel(
  "Chart 3",
  titlePanel("The Sum of Damages to People by Disasters"),
  sidebarPanel(
    p("This chart had show the total number of people got affected/injured/homeless due to disasters. This chart tried to answer who are most vulnerable to natural disasters in the U.S. People could also select the data for a specific type of disaster to do futher and more detailed research."),
  ),
  mainPanel(
    selectInput(
      inputId = "chart3_type",
      label = "Type of Disasters",
      choices = rbind("All Disasters", unique(data_1$Disaster.Type))
    ),
    plotlyOutput("chart3")
  )
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