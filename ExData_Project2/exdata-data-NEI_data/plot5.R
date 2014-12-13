## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
SCC_mobile_index <- SCC$SCC[grep("Vehicles", SCC[,4])]
BC <- NEI[NEI$fips=="24510",]
mobile <- BC[BC$SCC %in% SCC_mobile_index,]
mobile_sum <- aggregate(Emissions ~ year, data=mobile, FUN=sum)
qplot(year, Emissions,data=mobile_sum,geom=c("point","smooth"),method="lm",main="PM2.4 Emissions Trend for Motor Vehicle Sources in Baltimore City")
dev.copy(png,file="plot5.png")
dev.off()
