## Lab 6 part 2
rm(list = ls())
##Dataset of patient satisfaction

library(tidyverse)
library(GGally)
library(car)

setwd("C:\\Users\\Nate\\OneDrive\\Documents\\GitHub\\STA3386\\Data")

dat  <- read.table("patientSatisfaction.txt", header = T)

##x1 = Age
##x2 = severity of illness
##x3 = Anxiety
## y = Satisfaction Score

ggpairs(dat)

full  <- lm(Y~., dat)

summary(full)

vif(full)

## if thre is a very high value remove it in the lm and try that
## if one decreases by more then 10 you know that they where highly correlated.
## repeat if necessary
## goal is to get all vifs below 10

