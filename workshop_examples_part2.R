rm(list=ls())

#install.packages("tidyverse")
library("tidyverse")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#### Reading in data ####
read_tsv("fastqc_data.tsv")
read_delim("fastqc_data.tsv", 
           delim = "\t")
fastqc_tbl <- read_tsv(file = "fastqc_data.tsv", 
                       skip = 1,
                       col_names = c("id",
                                     "total_sequences",
                                     "percent_failed",
                                     "percent_gc_content",
                                     "percent_duplication"),
                       col_types = cols(id = col_character(),
                                        total_sequences = col_double(),
                                        percent_failed = col_double(),
                                        percent_gc_content = col_double(),
                                        percent_duplication = col_double()))


#### Subseting Your Data ####

fastqc_tbl %>%
  select(id,
         total_sequences)
fastqc_tbl %>%
  select(-starts_with("percent"))

fastqc_tbl %>%
  filter(total_sequences >= 50000000)
fastqc_tbl %>%
  filter(percent_gc_content == 44 | percent_gc_content == 45,
         total_sequences <= 50000000 & total_sequences >= 30000000)

fastqc_tbl %>%
  filter(total_sequences >= 50000000) %>%
  select(id, 
         percent_duplication)

#### Changing and Creating Columns ####
fastqc_tbl %>% 
  mutate(log_total_sequences = log10(total_sequences)) 

fastqc_tbl %>% 
  mutate(percent_duplication = percent_duplication/100) 

fastqc_tbl %>%
  mutate(percent_duplication_as_decimal = percent_duplication/100,
         number_of_nonduplicate_sequences = percent_duplication_as_decimal * total_sequences,
         number_of_duplicated_sequences = (1 - percent_duplication_as_decimal) * total_sequences) %>%
  select(id,
         total_sequences,
         number_of_nonduplicate_sequences,
         number_of_duplicated_sequences)

fastqc_tbl %>%
  mutate(gc_interpretation = case_when(percent_gc_content < 45 ~ "Less than 40% GC Content",
                                       percent_gc_content > 50 ~ "Greater then 50% GC Content",
                                       TRUE ~ "Inbetween 40 and 50% GC Content")) %>%
  select(id,
         gc_interpretation)

(fastqc_tbl_separate <- fastqc_tbl %>%
    separate(id,
             into = c("wga",
                      "species",
                      "repair",
                      "ng_dna"),
             sep = "_"))

(fastqc_tbl_unite <- fastqc_tbl_separate %>%
    relocate(species, 
             ng_dna,
             repair,
             wga) %>%
    unite("id", 
          species:wga,
          sep = "-"))

#### Pivoting Data in R ####

(fastqc_tbl_long <- fastqc_tbl %>% 
  pivot_longer(cols = c(total_sequences, 
                        percent_failed, 
                        percent_gc_content, 
                        percent_duplication),
               names_to = "metrics",
               values_to = "values"))

(fastqc_tbl_wide <- fastqc_tbl_long %>%
  pivot_wider(id_cols = id, 
              names_from = metrics,
              values_from = values))

#### Summarising a Tibble ####

fastqc_tbl_separate %>%
  group_by(species) %>%
  summarise(number_of_observations = n()) %>%
  ungroup()

fastqc_tbl_separate %>%
  group_by(wga, ng_dna) %>%
  summarise(number_of_observations = n(),
            mean_failed_percent = mean(percent_failed),
            median_failed_percent = median(percent_failed),
            mean_duplicate_percent = mean(total_sequences),
            median_duplicate_percent = median(total_sequences),
            mean_number_of_nonduplicate_sequences = mean((1-(percent_duplication/100)) * total_sequences)) %>%
  ungroup()



