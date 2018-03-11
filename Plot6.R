NE_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#creating table with Motor Vehicle emissions per year in Baltimore
Baltimore_EV = summarize(group_by(filter(NE_data, fips=='24510', type=='ON-ROAD'), year), sum(Emissions))
Baltimore_EV = mutate(Baltimore_EV, Place = 'Baltimore City')
# creating table with Motor Vehicle emissions per year in LA, California
LA_EV = summarize(group_by(filter(NE_data, fips=='06037', type=='ON-ROAD'), year), sum(Emissions))
LA_EV=mutate(LA_EV, Place='Los Angeles County')

#combining two tables
LA_Baltimore <- rbind(LA_EV,Baltimore_EV)
colnames(LA_Baltimore) <- c('Year', 'Emissions', 'Place')
LA_Baltimore$Year <- as.character(LA_Baltimore$Year)

#creating a plot
png('Plot6.png')
ggplot(LA_Baltimore, aes(Year, Emissions, fill=Year))+geom_bar(stat='identity')+facet_grid(. ~Place)+labs(title="Baltimore City/Los Angeles County: Emissions of motor vehicle", x="Years",y="Emissions (PM 2.5) in thousands")
dev.off()
