setwd("C:/Users/553168/Desktop/Data Science Coursera")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
baltimore<-subset(NEI, NEI$fips==24510)           #Subset Baltimore area
totalBaltimore<-tapply(baltimore$Emissions, INDEX=baltimore$year, sum)   #Sum emissions per year
barplot(totalBaltimore, main="Total Emissions in Baltimore, MD by Year", xlab="Year", ylab="Emissions")