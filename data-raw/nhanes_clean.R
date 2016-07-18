# setwd() to this folder

# data was downloaded from:
# http://wwwn.cdc.gov/nchs/nhanes/search/DataPage.aspx?Component=Examination&CycleBeginYear=2013
# http://wwwn.cdc.gov/nchs/nhanes/search/DataPage.aspx?Component=Demographics&CycleBeginYear=2013

library(Hmisc)
library(magrittr)
library(dplyr)

exam <- sasxport.get("BMX_H.XPT")

demo <- sasxport.get("DEMO_H.XPT")

# http://wwwn.cdc.gov/Nchs/Nhanes/2013-2014/BMX_H.htm
exam %<>% select(seqn, height = bmxht, weight = bmxwt) %>%
  mutate(height = height/100)

# http://wwwn.cdc.gov/Nchs/Nhanes/2013-2014/DEMO_H.htm
demo %<>% mutate(age = ifelse(is.na(ridagemn), ridageyr, ridagemn/12),
                 sex = c("Male", "Female")[riagendr]) %>%
  select(seqn, age, sex)

nhanes <- full_join(demo, exam) %>%
  filter(age < 19) %>%
  mutate(age = age*12) %>% tbl_df

save(nhanes, file = "nhanes.RData")