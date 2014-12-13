## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BC_df <- NEI[NEI$fips=="24510",]
BC_sum <- aggregate(Emissions ~ year, data=BC_df, FUN=sum)
row.names(BC_sum) <- BC_sum$year
barplot(BC_sum$Emissions, col="blue",main="Total PM2.4 Emissions Trend in Baltimore City",,names.arg=c("1999","2002","2005","2008"))
dev.copy(png,file="plot2.png")
dev.off()
