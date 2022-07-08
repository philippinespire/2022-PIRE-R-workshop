#### Activity 1 ####

read_csv("davis_practive.csv")

davis <- read_csv("davis_practive.csv")

davis <- read_csv("davis_practive.csv",
                  col_types = cols(name = col_character(),
                                   haircolor = col_character(),
                                   sex = col_character(),
                                   weight = col_double(),
                                   height = col_double(),
                                   repwt = col_double(),
                                   repht = col_double()))

davis_drop_na <- read_csv("davis_practive.csv",
                          col_types = cols(name = col_character(),
                                           haircolor = col_character(),
                                           sex = col_character(),
                                           weight = col_double(),
                                           height = col_double(),
                                           repwt = col_double(),
                                           repht = col_double())) %>%
  drop_na()

#### Activity 2 ####

davis_drop_na %>% 
  select(-height, -repht)

davis_drop_na %>% 
  select(-height, -repht) %>%
  filter(sex == "F",
         haircolor == "brown")

davis_drop_na %>% 
  select(-height, -repht) %>%
  filter(sex == "F",
         haircolor == "brown") %>%
  mutate(mean_weight = (weight + repwt)/2,
         weight_difference = weight - repwt)

davis_drop_na %>% 
  select(-height, -repht) %>%
  filter(sex == "F",
         haircolor == "brown") %>%
  mutate(mean_weight = (weight + repwt)/2,
         weight_difference = weight - repwt,
         np = case_when(weight_difference < 0 ~ "Negative",
                        weight_difference > 0 ~ "Positive",
                        weight_difference == 0 ~ "No Change"))

#### Assignment 3 ####

davis_drop_na %>% 
  separate(name,
           into = c("surname",
                    "given_name"),
           sep = ", ",
           remove = FALSE)

davis_drop_na %>% 
  separate(name,
           into = c("surname",
                    "given_name"),
           sep = ", ",
           remove = FALSE) %>%
  unite(haircolor_sex,
        c("haircolor", 
          "sex"),
        sep = "_",
        remove = FALSE)

davis_drop_na %>% 
  separate(name,
           into = c("surname",
                    "given_name"),
           sep = ", ",
           remove = FALSE) %>%
  unite(haircolor_sex,
        c("haircolor", 
          "sex"),
        sep = "_",
        remove = FALSE) %>%
  relocate(name, haircolor_sex)

#### Assignment 4 ####

(davis_longer <- davis_drop_na %>%
  pivot_longer(cols = c(weight,
                        repwt,
                        height,
                        repht),
               names_to = "metric",
               values_to = "values"))

(davis_wider <- davis_longer %>%
  pivot_wider(names_from = "metric",
              values_from = "values"))

#### Assignment 5 ####

davis_drop_na %>% 
  select(-height, -repht) %>%
  mutate(mean_weight = (weight + repwt)/2,
         weight_difference = weight - repwt) %>%
  group_by(haircolor,
           sex) %>%
  summarise(count = n(),
            mean_mean_weight = mean(mean_weight),
            sd_mean_weight = sd(mean_weight),
            median_mean_weight = median(mean_weight),
            IQR_mean_weight = IQR(mean_weight)) %>%
  ungroup()
