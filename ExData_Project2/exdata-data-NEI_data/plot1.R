## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot
year_sum <- aggregate(Emissions ~ year,data=NEI, FUN = sum)
row.names(year_sum) <- year_sum$year
barplot(t(year_sum),col="red",main="Total PM2.4 Emissions Trend",names.arg=c("1999","2002","2005","2008"))
dev.copy(png, file="plot1.png")
dev.off()


