test <- read_rds("/Users/gregorymatthews/Dropbox/nibrs_1991_2022_offense_segment_rds/nibrs_offense_segment_2022.rds")

names(test)


sort(unique(test$ucr_offense_code[1:10000]))

murder <- test %>% filter(ucr_offense_code == "murder/nonnegligent manslaughter")

n <- murder %>% mutate(month = substring(incident_date,1,7)) %>% filter(ori == "ILCPD0000") %>% group_by(ori,month) %>% summarize(n = n()) %>% pull(n)


