## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
SCC_coal_index <- SCC$SCC[grep("Coal", SCC[,4])]
coal <- NEI[NEI$SCC==SCC_coal_index,]
coal_sum <- aggregate(Emissions ~ year, data=coal, FUN=sum)
qplot(year, Emissions,data=coal_sum,geom=c("point","smooth"),method="lm",main="PM2.4 Emissions Trend for Coal Combustion-related Sources")
dev.copy(png,file="plot4.png")
dev.off()
