setwd("C:/Users/553168/Desktop/Data Science Coursera")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
totalNEI<-tapply(NEI$Emissions, INDEX=NEI$year, sum)     #Sum emissions per year
barplot(totalNEI, main = "Total Emissions by Year", xlab="Year", ylab="Emissions")