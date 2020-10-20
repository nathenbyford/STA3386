##

rm(list = ls())

library(tidyverse)
library(GGally)
library(car)

setwd("C:\\Users\\Nate\\OneDrive\\Documents\\GitHub\\STA3386\\Data")

dat  <- read.table("baseball_pitchers.txt", header = T)

view(dat)


dat$firstName  <- NULL
dat$lastName <- NULL
dat$team86  <- NULL
dat$league86 <- NULL
dat$league87 <- NULL
dat$team87 <- NULL

ggpairs(dat)

full <- lm(salary ~ ., dat)

summary(full)

vif(full)
## remove careerIP

fit1 <- lm(salary ~ .-careerIP, dat)
vif(fit1)
## CareerW and careerL are correlated with careerIP 

fit2 <- lm(salary ~ .-careerIP-careerG, dat)
vif(fit2)
## years and careerG correlated

fit3 <- lm(salary ~ .-careerIP-careerL-careerG, dat)
vif(fit3)
## careerL and careerW correlatated

fit4 <- lm(salary ~ .-careerIP-careerG-careerL-careerW, dat)
vif(fit4)
## years and careerW

