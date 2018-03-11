NE_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#merging tables
NE_SCC <- merge(NE_data, SCC_data, by="SCC")
NE_SCC <- mutate(NE_SCC, coal = grepl("coal", NE_SCC$Short.Name, ignore.case=TRUE)) 
Emissions_CPY <- summarize(group_by(filter(NE_SCC, coal==TRUE),year),sum(Emissions))
colnames(Emissions_CPY) <- c("Year", "Emissions")
Emissions_CPY$Year<-as.character(Emissions_CPY$Year)
Emissions_CPY$Emission_in_thousand<-Emissions_CPY$Emissions/1000

#Creating the plot
png('Plot4.png')
ggplot(Emissions_CPY, aes(Year, Emission_in_thousand, fill=Year))+geom_bar(stat='identity')+labs(title="Emissions from coal combustion", x="Years",y="Emissions (PM 2.5) in thousands")
dev.off()
