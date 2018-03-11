NE_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
Emission_per_year<-summarize(group_by(NE_data, year), sum(Emissions))
#Creating a table with Emissions per year in Baltimore
Baltimore_EPY = summarize(group_by(filter(NE_data, fips=="24510"), year), sum(Emissions))
colnames(Baltimore_EPY)<-c("Years", "Emissions")

#Creating the plot
png('plot2.png')
barplot(Baltimore_EPY$Emissions, names.arg = Emission_per_year$year, xlab='Years', ylab='Emission PM 2.5', main='Baltimore City', col="navy")
dev.off()
