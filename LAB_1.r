## Nathen Byford
## September 1, 2020
## STA 3386
######################

rm(list = ls())

library(datasets)
library(tidyverse)

faithful <- faithful

faithful$waiting %>% mean()
faithful$waiting %>% sd()

faithful$waiting %>% quantile()

faithful$waiting %>% summary()

ggplot(faithful, aes(x = eruptions, y = waiting)) +
    geom_point()

cars