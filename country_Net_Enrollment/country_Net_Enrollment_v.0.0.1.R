library(readr)
library(dplyr)
library(ggplot2)
library(XML)

#Url location
url = "http://fmwww.bc.edu/ec-p/data/oecd/oecd.ctylist.html"

#OECD upload
oecd = readHTMLTable(url, header=F, which=1, stringsAsFactors=F)

#Name column names
colnames(oecd) <- c('Country_Code', 'Country_Name')
oecd$Country_Code

#Education stats loaded
ed_stats <- read_csv('/home/drew/Desktop/R/Education/datasets/EdStatsData.csv')

#USA Net Enrollment
net_Enrollment <- ed_stats %>%
  filter(`Indicator Code` == 'SE.PRM.NENR', `Country Code` %in% oecd$Country_Code)

str(net_Enrollment)