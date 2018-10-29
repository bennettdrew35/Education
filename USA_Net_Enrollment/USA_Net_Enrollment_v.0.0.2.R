library(tidyverse)
#load edited csv file
USA_ed_stats <- read_csv('/home/drew/Desktop/R/Education/USA_ed_stats.csv')

#Filter for Net enrolment rate, primary, both sexes (%)
USA_G_1 <- USA_ed_stats %>%
    filter(`Indicator Code` == 'SE.PRM.NENR')

USA_G_1

str(USA_G_1)
# Drop non date columns

USA_G_1_date <- USA_G_1 %>%
  select(-c(`Country Name`, `Country Code`, `Indicator Name`, `Indicator Code`))

USA_G_1_date

# Transpose USA to get 

t_USA_G_1 <- t(USA_G_1_date)

t_USA_G_1

# USA column header

colnames(t_USA_G_1)[1] = 'USA_Net_Enrollment'

t_USA_G_1

#remove na values

colnames(t_USA_G_1)

new_dataframe = as.data.frame(lapply(df1, na.omit))

ft_USA_G_1

#keep only dates
t_USA_G_1 <- t_USA_G_1[3,0]

t_USA_G_1

