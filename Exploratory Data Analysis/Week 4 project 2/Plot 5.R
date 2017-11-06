setwd("C:/Users/553168/Desktop/Data Science Coursera")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
greps2<-unique(grep("mobile", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
#only need greps2[1:4]

Gas_Heavy<-subset(SCC, EI.Sector %in% greps2[1])  #Subset SCC by Vehicle Type
Gas_Light<-subset(SCC, EI.Sector %in% greps2[2])
Diesel_Light<-subset(SCC, EI.Sector %in% greps2[3])
Diesel_Heavy<-subset(SCC, EI.Sector %in% greps2[4])

gasHeavy<-subset(baltimore, SCC %in% Gas_Heavy$SCC)   #Subset Baltimore by SCC retaining vehicle type 
gasLight<-subset(baltimore, SCC %in% Gas_Light$SCC)
dieselLight<-subset(baltimore, SCC %in% Diesel_Light$SCC)
dieselHeavy<-subset(baltimore, SCC %in% Diesel_Heavy$SCC)

cars1<-data.frame(gasHeavy, vehicle="Gas - Heavy Duty")      #Add vehicle type column to NEI 
cars2<-data.frame(gasLight, vehicle="Gas - Light Duty")
cars3<-data.frame(dieselLight, vehicle="Diesel - Light Duty")
cars4<-data.frame(dieselHeavy, vehicle="Diesel - Heavy Duty")
cars<-rbind(cars1, cars2, cars3, cars4) 

ggplot(data=cars, aes(x=year, y=Emissions, fill=vehicle)) +
  geom_bar(stat="identity", position=position_dodge()) +
  ggtitle("Motor Vehicle-Related Emissions in Baltimore, MD: 1999-2008")