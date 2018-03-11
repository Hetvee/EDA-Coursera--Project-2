NE_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
head(NE_data)
head(SCC_data)
#Question 1

#Creating table with total emissions per year
Emission_per_year<-summarize(group_by(NE_data, year), sum(Emissions))

colnames(Emission_per_year)<-c("Year", "Emissions")
Emission_per_year$Emissions_in_millions<-Emission_per_year$Emissions/1000000
colour<-c("maroon","red", "orange", "yellow")
#PLot1.png
png('Plot1.png')
barplot(Emission_per_year$Emissions_in_millions, names.arg = Emission_per_year$Year,xlab='Years', ylab='Emissions PM 2.5 in millions', main='Emission PM 2.5 per Year', col=colour)
dev.off()
