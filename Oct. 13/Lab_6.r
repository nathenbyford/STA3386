## Nathen Byford   
## October 13, 2020
## Lab 6
## STA 3386

setwd("C:\\Users\\Nate\\OneDrive\\Documents\\GitHub\\STA3386\\Data")
library(tidyverse)
library(GGally)
library(car)


## Data set from brand preference from book
## Moisture content = x1 and sweetness = x2
dat <- read.table("BrandPreference.txt", header = T)

ggpairs(dat)

full  <- lm(Y~., dat)

full %>% summary()

vif(full)

