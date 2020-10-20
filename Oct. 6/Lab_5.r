## Nathen Byford
## Lab 5 
## October 6, 2020

rm(list = ls())
library(tidyverse)
library(GGally)
setwd("\\Users\\Nate\\OneDrive\\Documents\\GitHub\\STA3386\\Data")

data <- read_csv("housingprices.csv")
view(data)


pairs(data)
## Or
ggpairs(data)

fit1  <- lm(salePrice ~ localTaxes, data)
fit1 %>% summary()
## localTaxes is significant 2.05e-8

fit2  <- lm(salePrice ~ numBaths, data)
fit2 %>% summary()
## numBaths is significant 9.27e-5

fit3  <- lm(salePrice ~ lotSize, data)
fit3 %>% summary()
## lotSize is significant 0.000596

fit4  <- lm(salePrice ~ livingSpace, data)
fit4 %>% summary()
## LivingSpace is significant 0.000101

fit5  <- lm(salePrice ~ numGarageStalls, data)
fit5 %>% summary()
## Num of garage stalls is significant 0.0541

fit6 <- lm(salePrice ~ numRooms, data)
fit6 %>% summary()
## Num of Rooms is significant 0.00761

fit7 <- lm(salePrice ~ numBedrooms, data)
fit7 %>% summary()

full <- lm(salePrice ~ ., data)
## . represents all other x's

full %>% summary()

## the p-values are different when we use multiple regression
## it shows "does knowing x help predict y given everyother x included in the model"

small  <-  lm(salePrice ~ .-localTaxes, data)
small %>% summary()

small2  <- lm(salePrice ~ .-numBaths, data)
small2 %>% summary()

small3  <- lm(salePrice ~ .-lotSize, data)
small3 %>% summary()
## without lotSize the Adjusted R squared goes up so it isn't explaining anything new

small4  <- lm(salePrice ~ .-livingSpace, data)
small4 %>% summary()
## Also not explainig anything new

small5  <- lm(salePrice ~ .-localTaxes, data)
small5 %>% summary()
