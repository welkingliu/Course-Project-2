vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]
vehicles <- with(baltimoreVehiclesNEI, tapply(Emissions, year, sum))
png("plot5.png", width = 600, height = 480)
plot(x=names(vehicles), y=vehicles, xlab="Year", ylab="Total Emissions", 
     main="Total Emissions from Motor Vehicle Sources from 1999 to 2008")
dev.off()
