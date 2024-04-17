library(tidyverse)
library(readr)
library(lubridate)
########################################################################################################################
#Figure out which cities are reporting all 60 months in this data set by looking at was ANYTHING reported in a given month. 
########################################################################################################################
covid_2018 <- read_rds("../data/nibrs_offense_segment_2018.rds")
covid_2019 <- read_rds("../data/nibrs_offense_segment_2019.rds")
covid_2020 <- read_rds("../data/nibrs_offense_segment_2020.rds")
covid_2021 <- read_rds("../data/nibrs_offense_segment_2021.rds")
covid_2022 <- read_rds("../data/nibrs_offense_segment_2022.rds")

check2018 <- covid_2018 %>% mutate(yearmonth = substring(incident_date,1,7)) %>% 
  group_by(ori, yearmonth) %>% summarize(n = n()) %>% ungroup() %>% group_by(ori) %>% summarize(n = n())

check2019 <- covid_2019 %>% mutate(yearmonth = substring(incident_date,1,7)) %>% 
  group_by(ori, yearmonth) %>% summarize(n = n()) %>% ungroup() %>% group_by(ori) %>% summarize(n = n())

check2020 <- covid_2020 %>% mutate(yearmonth = substring(incident_date,1,7)) %>% 
  group_by(ori, yearmonth) %>% summarize(n = n()) %>% ungroup() %>% group_by(ori) %>% summarize(n = n())

check2021 <- covid_2021 %>% mutate(yearmonth = substring(incident_date,1,7)) %>% 
  group_by(ori, yearmonth) %>% summarize(n = n()) %>% ungroup() %>% group_by(ori) %>% summarize(n = n())

check2022 <- covid_2022 %>% mutate(yearmonth = substring(incident_date,1,7)) %>% 
  group_by(ori, yearmonth) %>% summarize(n = n()) %>% ungroup() %>% group_by(ori) %>% summarize(n = n())


check <- rbind(check2018,
check2019,
check2020,
check2021,
check2022)

coverage <- check %>% group_by(ori) %>% summarize(n = sum(n)) %>% arrange(-n)
save(coverage, file = "../data/reporting_coverage.rds")
