type_bc <- unique(balt.city$type)
type_df <- matrix(NA,4,5)
type_df[,1] <- unique(balt.city$year)
n=2
for (i in type_bc)
{
  data <- balt.city[balt.city$type==i,]
  type_df[,n] <- with(data, tapply(Emissions, year,sum))
  n = n+1
}
type_df <- data.frame(type_df)
colnames(type_df) <- c("Year", "Point","Nonpoint","Onroad","Nonroad")
# type_df
png("plot3.png", width = 480, height = 480)
ggplot(data=type_df, aes(x=Year))+geom_line(aes(y=Point,color=type_bc[1]))+
  geom_line(aes(y=Nonpoint,color=type_bc[2]))+
  geom_line(aes(y=Onroad,color=type_bc[3]))+
  geom_line(aes(y=Nonroad,color=type_bc[4]))+
  scale_colour_manual("Type", breaks=type_bc, values=c(1,2,3,4))+
  ylab("Total Emissions")+labs(title="Types of Sources in the Baltimore City, Maryland")
dev.off()

