# Package names
packages <- c("tidyverse", 
              "janitor", 
              "lubridate")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages,
                 library,
                 character.only = TRUE))

### Functions ###

# Creates a ymdh column from the storms dataset
storms_ymdh <- function(DATA){
  DATA %>%
    unite("ymd", c(year, month, day), sep = "-", remove = FALSE) %>%
    unite("ymdh", c(ymd, hour), sep = "T", remove = FALSE) %>%
    mutate(ymdh = ymd_h(ymdh),
           year = factor(year))
}

# 