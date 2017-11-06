setwd("C:/Users/553168/Desktop/Data Science Coursera")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
greps1<-unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
#Isolate instances of "coal" in SCC column EI.Sector

data1<-subset(SCC, EI.Sector %in% greps1)    #Subset SCC by coal labels
coal<-subset(NEI, SCC %in% data1$SCC)        #Subset NEI by data1 overlaps

ggplot(data=coal, aes(x=year, y=Emissions, fill = type)) + 
  geom_bar(stat="identity", position=position_dodge()) + 
  ggtitle("U.S. Coal Combustion-Related Emissions: 1999-2008")