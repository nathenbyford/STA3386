## Nathen Byford
## October 20, 2020
## Linear Regression Lab 7

rm (list = ls())

setwd("C:\\Users\\Nate\\OneDrive\\Documents\\GitHub\\STA3386\\Data")
library(tidyverse)
library(GGally)
library(car)
library(olsrr)

dat  <- read.table("patientSatisfaction.txt", header = T)

## x1 =  age, x2 = severity, x3 = anxiety

ggpairs(dat)

full <- lm(Y ~ ., data = dat)
full %>% summary()

vif(full)

ols_plot_added_variable(full)
# Xi regressed on residuals of Y~(x not i's)

fit1 <- lm(Y ~ .-X2, data = dat)
fit1 %>% summary()

vif(fit1)

