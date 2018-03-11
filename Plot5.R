NE_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC_data<-readRDS("/Users/HetveePatel/Downloads/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

# creating table with Motor Vehicle emissions per year in Baltimore
Baltimore_EV = summarize(group_by(filter(NE_data, fips=="24510", type=='ON-ROAD'), year), sum(Emissions))
colnames(Baltimore_EV)<-c("Years", "Emissions")

#creating plot
png('Plot5.png')
ggplot(Baltimore_EV, aes(Years,Emissions))+scale_x_continuous(breaks = c(1999,2002,2005,2008))+geom_point(size=4, color='red')+geom_line(size=1.5,color='red')+labs(title="Baltimore City: Emissions of motor vehicle", x="Years",y="Emissions (PM 2.5)")
dev.off()
