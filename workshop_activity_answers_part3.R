setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(janitor)
library(lubridate)

source("workshop_functions.R")

#### 1. #### 

psmc <- psmc.result("SfadenovoSSL100kall.psmc",
                    i.iteration=25,
                    mu=1e-8,
                    s=100,
                    g=1)

psmc %>% ggplot(aes(x = YearsAgo, 
                    y = Ne)) +
  geom_point() +
  geom_smooth()

#### 2. ####

psmc %>% 
  mutate(mya = YearsAgo/1000000) %>%
  ggplot(aes(x = mya, 
                    y = Ne)) +
  geom_point() +
  geom_smooth() +
  theme_classic() +
  xlab("Million Years Ago") +
  ylab("Effective Population Size (Ne)") +
  labs(title = "PSMC Estimated Effective Population Size for Selarius fasciatus Over Time") +
  theme(panel.grid.major.y = element_line(size = .5, 
                                          linetype = "longdash", 
                                          colour = "lightgrey"),
        axis.title = element_text(size = 16, colour = "black"),
        axis.text = element_text(size = 12, colour = "black"),
        title = element_text(size = 16, colour = "black"),
        legend.position = "none")

