## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
SCC_mobile_index <- SCC$SCC[grep("Vehicles", SCC[,4])]
BC <- NEI[NEI$fips=="24510",]
BC_df <- BC[factor(BC$SCC) %in% SCC_mobile_index,]
BC_sum <- aggregate(Emissions ~ year+fips, data=BC_df, FUN=sum)
BC_sum$fips <- rep(c("Baltimore City"),length(LA_sum$fips))

LA <- NEI[NEI$fips == "06037",]
LA_df <- LA[LA$SCC %in% SCC_mobile_index,]
LA_sum <- aggregate(Emissions ~ year+fips, data=LA_df, FUN=sum)
LA_sum$fips <- rep(c("LA"),length(LA_sum$fips))
df <- rbind(BC_sum,LA_sum)
qplot(x=year,y=Emissions, data=df, group=fips, colour=fips,main="Motor Viecle Sources: PM2.4 Emissions Comparison between Baltimore and LA") + geom_line()+geom_point()
dev.copy(png,file="plot6.png")
dev.off()
