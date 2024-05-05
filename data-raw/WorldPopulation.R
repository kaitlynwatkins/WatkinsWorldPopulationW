library(tidyverse)
library(readxl)

#Read and clean up the data
data <- read_excel('data-raw/World_Population.xlsx', sheet='ESTIMATES', range = 'A17:BZ306')
data<- subset(data, data$Type!="Label/Separator")

WorldPopulation <- subset(data, data$Type=="Country/Area" ) %>%
  rename(Country = "Region, subregion, country or area *") %>%
  select(-Index) %>%
  select(-Variant) %>%
  select(-Notes) %>% select(-`Country code`) %>% select(-Type) %>% select(-`Parent code`)

WorldPopulation <- WorldPopulation %>% pivot_longer('1950':'2020',names_to = 'Year', values_to = 'Population')
WorldPopulation$Population <- as.numeric(WorldPopulation$Population)

#Save the data frame to the data/directory
usethis::use_data(WorldPopulation)
