## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
BC_df <- NEI[NEI$fips=="24510",]
BC_TY_sum <- aggregate(Emissions ~ year+type, data=BC_df, FUN=sum)
qplot(year, Emissions,data=BC_TY_sum,colour=type,geom=c("point","smooth"),method="lm",main="Total PM2.4 Emissions Trend in Baltimore City for Different Types")
dev.copy(png,file="plot3.png")
dev.off()
