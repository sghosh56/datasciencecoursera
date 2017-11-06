setwd("C:/Users/553168/Desktop/Data Science Coursera")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
library(ggplot2)
ggplot(data=baltimore, aes(x=year, y=Emissions, fill=type)) +    
  geom_bar(stat="identity", position="dodge") +
  ggtitle("Baltimore, MD Emission by Type: 1999-2008")