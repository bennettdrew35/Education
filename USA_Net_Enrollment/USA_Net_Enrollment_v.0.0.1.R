library(tidyverse)
ed_stats <- read_csv('/home/drew/Desktop/R/Education/datasets/EdStatsData.csv')
str(ed_stats)
USA_ed_stats <- ed_stats %>%
  filter(`Country Code` == 'USA', !is.na(`2000`), !is.na(`2015`)) %>%
  group_by(`Country Code`, `Country Name`) %>%
  arrange(desc(`Country Name`))

USA_ed_stats
write.csv(USA_ed_stats, '/home/drew/Desktop/R/Education/datasets/USA_ed_stats.csv')
