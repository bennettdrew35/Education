#load libraries
library(readr)
library(dplyr)
library(ggplot2)

#Education stats loaded
ed_stats <- read_csv('/home/drew/Desktop/R/Education/datasets/EdStatsData.csv')

#USA Net Enrollment
USA_Net <- ed_stats %>%
  filter(`Country Code` == 'USA', `Indicator Code` == 'SE.PRM.NENR', !is.na(`2000`), !is.na(`2015`)) %>%
  group_by(`Country Code`, `Country Name`) %>%
  arrange(desc(`Country Name`))
  
#Remove non date columns
USA_Net_r <- USA_Net %>%  
  select(-c(`X70`, `Country Name`, `Country Code`, `Indicator Name`, `Indicator Code`, `X1`))

# Remove na columns
USA_Net_date <- USA_Net_r[,colSums(is.na(USA_Net_r))<nrow(USA_Net_r)]

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
  
