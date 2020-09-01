rm(list = ls())

library(tidyverse)

x <- c(1, 2, 2.75, 4, 6, 7, 8, 10)
y <- c(2, 1.4, 1.6, 1.25, 1, 0.5, 0.5, 0.4)

dat <- tibble(x, y)
dat

ggplot(data = dat, aes(x = x, y = y)) +
    geom_point() +
    xlim(0, 10) +
    ylim(0, 2) +
    theme_classic()

ybar <- mean(y)
xbar <- mean(x)
beta1_hat <- sum((x - xbar) * (y - ybar)) / sum((x - xbar) ^ 2)

beta1_hat

beta0_hat <- ybar - beta1_hat * xbar

beta0_hat

ggplot(dat, aes(x = x, y = y)) +
    geom_point() +
    xlim(0, 10) +
    ylim(0, 2) +
    geom_abline(intercept = beta0_hat, slope = beta1_hat, color = "steel blue")

yhat <- beta0_hat + beta1_hat * x

dists <- y - yhat

sum(dists)

sum(dists ^ 2)

fit <- lm(y ~ x, data = dat)
fit

fit$fitted.values
fit$residuals

fit$residuals ^ 2 %>% sum()