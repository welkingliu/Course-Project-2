balt.city <- NEI[NEI$fips=="24510",]
total_emissions.bc <- with(balt.city, tapply(Emissions, year, sum))
png("plot2.png", width = 480, height = 480)
plot(x=names(total_emissions.bc), y=total_emissions.bc, xlab="Year", ylab="Total Emissions", 
     main="Total Emissions in the Baltimore City, Maryland from 1999 to 2008")
dev.off()