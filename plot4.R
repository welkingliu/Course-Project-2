combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]
coal <- with(combustionNEI, tapply(Emissions, year, sum))
png("plot4.png", width = 600, height = 480)
plot(x=names(coal), y=coal, xlab="Year", ylab="Total Emissions", 
     main="Total Emissions from Coal Combustion-Related Sources from 1999 to 2008")
dev.off()
