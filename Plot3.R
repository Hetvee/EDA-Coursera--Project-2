NE_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#Creating a table with Emissions per year in Baltimore
Baltimore_EPY = summarize(group_by(filter(NE_data, fips=="24510"),type,year),sum(Emissions))
colnames(Baltimore_EPY) <- c("Type","Year","Emissions")
Baltimore_EPY$Year<-as.character(Baltimore_EPY$Year)

#Creating the plot
library(ggplot2)
png('Plot3.png')
qplot(Year, data = Baltimore_EPY, geom = "bar", facets=.~Type, fill=Year, weight=Emissions, main='Baltimore City: Emissions PM 2.5 per year and type', xlab='', ylab = 'Emissions PM 2.5')
dev.off()
