rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(janitor)
library(lubridate)

source("workshop_functions.R")

#### Read In Data ####

stm <-tibble(storms) %>%
  storms_ymdh()

dmd <-tibble(diamonds)

#### Scatter Plots ####

stm %>%
  filter(year == 1998) %>%
  ggplot(aes(y = wind,
             x = ymdh,
             color = name)) + 
  geom_point() + 
  geom_line() 

### Tend Lines ###

stm %>%
  filter(year == 1998,
         month == "9") %>%
  ggplot(aes(y = wind,
             x = ymdh,
             color = name)) + 
  geom_point() + 
  geom_smooth()

stm %>%
  filter(year == 1998,
         month == "9") %>%
  ggplot(aes(y = wind,
             x = ymdh,
             color = name)) + 
  geom_point() + 
  geom_smooth(method = "lm")

stm %>%
  filter(year == 1998,
         month == "9") %>%
  ggplot(aes(y = wind,
             x = ymdh,
             color = name)) + 
  geom_point() + 
  geom_smooth(method = "lm",
              formula = y ~ poly(x,3))

stm %>%
  filter(year == 1998,
         month == "9") %>%
  ggplot(aes(y = wind,
             x = ymdh,
             color = name)) + 
  geom_point() + 
  geom_smooth(method = "lm",
              formula = y ~ poly(x,3),
              se = FALSE)

#### Histograms Density and Bar Plots ####

dmd %>%
  ggplot(aes(x = price,
             fill = cut)) +
  geom_histogram(bins = 100)

dmd %>%
  ggplot(aes(x = price,
             color = clarity)) +
  geom_density()

stm %>%
  group_by(category) %>%
  summarise(mean_winds = mean(wind)) %>%
  ungroup() %>%
  ggplot(aes(x = category,
             y = mean_winds,
             fill = category)) +
  geom_col()

### Error Bars ###

stm %>%
  group_by(category) %>%
  summarise(mean_winds = mean(wind),
            sd_winds = sd(wind)) %>%
  ungroup() %>%
  ggplot(aes(x = category,
             y = mean_winds,
             fill = category)) +
  geom_col() +
  geom_errorbar(aes(ymin = mean_winds - sd_winds,
                    ymax = mean_winds + sd_winds))

### Box and Violin Plot ###

dmd %>%
  ggplot(aes(x = cut, 
             y = depth,
             fill = cut)) +
  geom_boxplot()

dmd %>%
  ggplot(aes(x = cut, 
             y = depth,
             fill = cut)) +
  geom_violin()


















test <- psmc.result("SfadenovoSSL100kall.psmc"
                    )

test1 <- read_delim("SfadenovoSSL100kall.psmc", 
                    delim = "\\",
                    col_names = "data")













