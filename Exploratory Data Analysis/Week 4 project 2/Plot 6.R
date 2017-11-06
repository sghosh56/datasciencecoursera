setwd("C:/Users/553168/Desktop/Data Science Coursera")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
LA<-subset(NEI, NEI$fips=="06037") 

LAgasHeavy<-subset(LA, SCC %in% Gas_Heavy$SCC)   #Subset Baltimore by SCC retaining vehicle type 
LAgasLight<-subset(LA, SCC %in% Gas_Light$SCC)
LAdieselLight<-subset(LA, SCC %in% Diesel_Light$SCC)
LAdieselHeavy<-subset(LA, SCC %in% Diesel_Heavy$SCC)

LAcars1<-data.frame(LAgasHeavy, vehicle="Gas - Heavy Duty")      #Add vehicle type column to NEI 
LAcars2<-data.frame(LAgasLight, vehicle="Gas - Light Duty")
LAcars3<-data.frame(LAdieselLight, vehicle="Diesel - Light Duty")
LAcars4<-data.frame(LAdieselHeavy, vehicle="Diesel - Heavy Duty")
carsALL<-rbind(cars, LAcars1, LAcars2, LAcars3, LAcars4) 
carsALL$fips<-gsub("24510", "Baltimore", carsALL$fips)     #Replace fips with city names
carsALL$fips<-gsub("06037", "Los Angeles", carsALL$fips)

ggplot(data=carsALL, aes(x=year, y=Emissions, fill=vehicle)) + facet_grid(.~fips) +
  geom_bar(stat="identity", position=position_dodge()) +
  ggtitle(expression(atop("Two City Motor-Vehicle Emission Comparison", 
                          atop(italic("Baltimore, MD and Los Angeles, CA: 1999-2008")))))