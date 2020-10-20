## Nathen Byford
## Lab 2
## September 15, 2020

rm(list = ls())

## In chapter 1 we don't talk about normality assumptions.
## Least squares does not need any normality test.
## Normality is for CI's in chapter 2

library(tidyverse)
setwd("~/GitHub/STA3386/Data")

# Read in file and name variables
dat <- read.table("crime rate.txt")
names(dat) <- c("rate", "hs_perc")

#plot data
g <- ggplot(data = dat, aes(x = hs_perc, y = rate)) +
  geom_point()
g


fit <- lm(rate ~ hs_perc, data = dat)

fit %>% summary()

## only 17% of the variation is modeled by HS deploma percentage

g + geom_abline(intercept = fit$coefficients[1],
                slope = fit$coefficients[2], col = "red")

x1 <- data.frame(hs_perc = 75)

fit %>% predict(x1, interval = "confidence", level = .95)
fit %>% predict(x1, interval = "predict", level = .95)

##########################################################
## Typographical Errors

data <- data.frame(num_error = c(7, 12, 4, 14, 25, 30), 
                   Cor_cost = c(128, 213, 75, 250, 446, 540))

ggplot(data = data, aes(x = num_error, y = Cor_cost)) +
  geom_point()

fit <- lm(Cor_cost ~ num_error, data = data)
fit %>% summary()

ggplot(data = data, aes(x = num_error, y = Cor_cost)) +
  geom_point() +
  geom_abline(intercept = fit$coefficients[1],
              slope = fit$coefficients[2], col = "steel blue") +
  theme_classic()

pred <- data.frame(num_error = 20)

fit %>% predict(pred, interval = "prediction", level = .95)
