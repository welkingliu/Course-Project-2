vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehiclesBA <- with(vehiclesBaltimoreNEI, tapply(Emissions, year, sum))
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLA <- with(vehiclesLANEI, tapply(Emissions, year, sum))
vehicle_df <- matrix(NA,4,3)
vehicle_df[,1]<-as.numeric(as.character(names(vehicles)))
vehicle_df[,2]<-vehiclesBA 
vehicle_df[,3]<-vehiclesLA
vehicle_df <- data.frame(vehicle_df)
colnames(vehicle_df) <- c("Year", "BA", "LA")
range(vehicle_df$BA,vehicle_df$LA)
png("plot6.png", width = 600, height = 480)
plot(x=vehicle_df$Year, y=vehicle_df$BA, xlab="Year", ylab="Total Emissions", 
     main="Total Emissions from Motor Vehicle Sources from 1999 to 2008", 
     type="l", col="red", ylim=c(100,8000))
lines(x=vehicle_df$Year, y=vehicle_df$LA,col="blue")
legend("topright",c("Baltimore City", "Los Angeles"), lty=c(1,1),col=c("red","blue"))
dev.off()

