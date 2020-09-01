library(tidyverse)

rm(list = ls())

x <- mtcars

mpg <- x %>% select(mpg)

summary(mpg)
