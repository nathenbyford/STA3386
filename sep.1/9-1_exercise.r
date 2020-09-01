## Nathen Byford
## September 1, 2020
## exercise with cars dataset
#############################

#clear env.
rm(list = ls())

#load librarys
library(datasets)
library(tidyverse)

#data
cars
cars <- cars

#mean and sd of cars
summary(cars)
cars$speed %>% sd()
cars$dist %>% sd()

#graph cars
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point()
