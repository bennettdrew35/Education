library(tidyverse)
library(ggplot2)
#load edited csv file
USA_ed_stats <- read_csv('/home/drew/Desktop/R/Education/datasets/USA_ed_stats.csv')

#Filter for Net enrolment rate, primary, both sexes (%)
USA_Net <- USA_ed_stats %>%
    filter(`Indicator Code` == 'SE.PRM.NENR') %>%
    select(-c(`Country Name`, `Country Code`, `Indicator Name`, `Indicator Code`, `X1`))

# Remove na columns
USA_Net_date <- USA_Net[,colSums(is.na(USA_Net))<nrow(USA_Net)]

# Transpose USA to get dates
t_USA_Net <- as.data.frame(t(USA_Net_date))

#Rename column headers
colnames(t_USA_Net)[1] = "USA_Net_Enrollment"

#Time series plot
t_USA_Net%>%
  ggplot(aes(row.names(t_USA_Net), USA_Net_Enrollment, group=1)) +
  geom_line(color="red")+
  geom_point(color="blue")+
  labs(x="Dates", y="USA Net Enrollment")+
  ggtitle("USA Enrollment over Time") +
  theme(plot.title = element_text(hjust = 0.5))
  
