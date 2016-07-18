# setwd() to this folder

# data was downloaded from http://www.cdc.gov/growthcharts/percentile_data_files.htm

library(dplyr)
library(magrittr)

# pull the data
# but we dont need the percentiles
# just age, sex, L, M, S
bmiChart <- read.csv("bmiagerev.csv",
                     stringsAsFactors = FALSE,
                     colClasses = c(rep(NA, 5), rep("NULL", 10))) %>% tbl_df

# tables for male and female are stacked vertically
# so there's a second header about halfway down
# get rid of it
bmiChart <- bmiChart[-which(bmiChart$Sex == "Sex"),]

# age is on the half-month
# round down based on BMI Data Processing guide
bmiChart %<>% mutate_each(funs(as.numeric), everything()) %>%
  filter(Agemos != 24.5, Agemos != 240.5) %>%
  mutate(Sex = c("Male", "Female")[Sex],
         Agemos = floor(Agemos))

wfaChart <- read.csv("wtageinf.csv") %>% tbl_df %>%
  filter(Agemos < 24, Agemos != 0.5) %>%
  mutate(Sex = c("Male", "Female")[Sex],
         Agemos = floor(Agemos)) %>%
  select(Sex, Agemos, L, M, S)

chart <- rbind(bmiChart, wfaChart)

save(chart, file = "chart.RData")