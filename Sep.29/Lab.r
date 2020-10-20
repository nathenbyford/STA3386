
library(datasets)
library(tidyverse)
library(forcats)
library(lmtest)

data(faithful)
view(faithful)

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
    geom_point()

fit <- lm(waiting ~ eruptions, data = faithful)
fit %>% summary()

fit$residuals

results <- data.frame(e = fit$residuals, x = faithful$eruptions, yhat = fit$fitted.values)

#linearity assumption
ggplot(results, aes(x, e)) +
    geom_point()

ggplot(results, aes(x = yhat, y = e)) + 
    geom_point()

# Shapiro-Wilk test

# ACF

acf(results$e)

# Breusch-Godfreed

bgtest(fit, order = 7)

#the p-value is small enough we see that there is a correlation of lag

#Check for normality

ggplot(data = results, aes(sample = e)) +
    geom_qq() +
    geom_qq_line()

#Shapiro Test

shapiro.test(results$e)


##Data is not normal due to P-value of 0.02947
##P-value should not be the only thing we look at
##P-value is a rv
##rv is a number that you don't know what it is untill you get your data and calculate it.

ggplot(results, aes(x = e)) +
    geom_histogram(bins = 10, fill = "grey")


# Check for constant variance

ggplot(results, aes(x = yhat, y = e)) +
    geom_point()

ggplot(results, aes(x = yhat, y = e^2)) +
    geom_point()
    
#Breusch-Pagan Test

bptest(fit)
#null is constant variance. We don't want to reject null.

## If we don't have normality we can Bootstrap to get normality
