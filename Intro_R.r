library(MASS)


x <- c(2, 4, 6, 7, 9, 30)
y <- c(0, 4, 8, 5, 10, 9)


plot(x, y)
plot(x)

x[1]
y[5]


mean(x)
mean(y)
median(y)
sd(x)


library(tidyverse)

df <- data.frame(x, y, row.names = NULL, check.rows = FALSE, check.names = TRUE, stringsAsFactors = default.stringsAsFactors())
df

windows()
ggplot(df, aes(x, y)) +
    geom_point() +
    theme_classic()

x %>% 
    mean() %>% 
    round(., 2) %>% 
    ceiling()

windows()
ggplot(data = df, aes(x, y)) +
    geom_line()

