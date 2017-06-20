total_emissions <- with(NEI, tapply(Emissions, year, sum))
png("plot1.png", width = 480, height = 480)
plot(x=names(total_emissions), y=total_emissions, xlab="Year", ylab="Total Emissions", 
     main="Total Emissions in the United States from 1999 to 2008")
dev.off()