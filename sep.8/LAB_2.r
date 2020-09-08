library(tidyverse)

setwd("~/GitHub/STA3386/Data")

dat <- read.table("copier maintenance.txt", header = TRUE)

#1. plot scatterplot

scatter <- function(data, x, y) {
  ggplot(data, aes(x = x, y = y)) + geom_point()
}

g <- scatter(dat, dat$num_copies, dat$minutes)
g

#2. find the least square line
fit <- lm(minutes ~ num_copies, data = dat)

#3. add least squares line to ggplot
g + geom_abline(intercept = fit$coefficients[1], 
                slope = fit$coefficients[2], col = "red")

#4. test the slope
fit %>% summary()

#5. CI for the true slope
fit %>% confint(level = .95)

#6. assess the fit
cor(dat$num_copies, dat$minutes)

fit %>% summary()

# we see looking at the multiple R squared that 95.7% of the variation 
# is explained by the model

## airfreight breakage

airfreight <- read.table("airfreight breakage.txt", header = TRUE)

#1. plot a scatter plot
g <- ggplot(data = airfreight, aes(x = transfers, y = broke_ampules)) +
  geom_point()
g

#2. find the least square line
fit <- lm(broke_ampules~transfers, data = airfreight)

#3. add least squares line to ggplot
g + geom_abline(intercept = fit$coefficients[1], 
                slope = fit$coefficients[2], col = "red")

#4. test the slope
fit %>% summary()

#5. CI for the true slope
fit %>% confint(level = .95)

#6. asess the fit
fit %>% summary()

#90% of the variance is explained

## Muscle mass

#0. read in data

muscle <- read.table("muscle mass.txt", header = TRUE)

#1. plot a scatter plot

g <- ggplot(data = muscle, aes(x = age, y = mass)) +
  geom_point()
g

#2. find the least square line
fit <- lm(mass ~ age, data = muscle)

#3. add the least square line to the plot
g + geom_abline(intercept = fit$coefficients[1], 
                slope = fit$coefficients[2], col = "red")

#4. test the slope
fit %>% summary()

#5. CI for true slope
fit %>% confint(level = .95)

#6. assess the fit
fit %>% summary()

#75% of the variance is explained with this model.

# Book 2.1
#   A. The conclusion is warranted because we cannot have the slope be 0 and 0 
#   is not in the CI. It has a 5% level of significance.
#   B. the CI of the intercept doesn't matter because we just need the intercept
#   to make a line.
