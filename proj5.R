setwd("D:\\coursera\\proj5")
list.files()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
dim(NEI)
str(NEI)
head(NEI)

dim(SCC)
str(SCC)
head(SCC)

source("plot1.r")

source("plot2.r")

source("plot3.r", print.eval=TRUE)

source("plot4.r")

source("plot5.r")

source("plot6.r")
