## Nathen Byford
## September 1, 2020
## STA 3386
######################

rm(list = ls())

library(datasets)
library(tidyverse)

faithful <- faithful

faithful$waiting %>% mean()
faithful$waiting %>% sd()

faithful$waiting %>% quantile()

faithful$waiting %>% summary()

ggplot(faithful, aes(x = eruptions, y = waiting)) +
    geom_point()

# New data set from Web
bodyfat <- read.table("http://www.jpstats.org/Regression/data/BodyFat.txt",
    header = TRUE)

bodyfat$bfat %>% summary()

ggplot(data = bodyfat, aes(x = tri, y = bfat)) +
    geom_point()


## Set wd to data folder
setwd("STA3386")
setwd("data")

data <- read.table("housingprices.csv", header = TRUE, sep = ",")

data %>% summary()

ggplot(data, aes(x = age, y = salePrice)) +
    geom_point()

# GPA exercise
rm(data)

data <- read.table("gpa.txt", header = TRUE)

data %>% summary()

ggplot(data, aes(x = act, y = gpa)) +
  geom_point(col = "steel blue")
