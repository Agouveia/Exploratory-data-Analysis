# TODO: Add comment
# 
# Author: Agouveia
###############################################################################
#QUESTION6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
#California (fips == 06037). Which city has seen greater changes over time in motor vehicle emissions?

baltimore4 <- datos[(datos$fips=="24510"), ]
baltimore4 <- aggregate(Emissions ~ year, data = baltimore4, FUN = sum)
losangeles <- datos[(datos$fips=="06037"),]
losangeles <- aggregate(Emissions ~ year, data = losangeles, FUN = sum)
baltimore4$County <- "Baltimore"
losangeles$County <- "Los Angeles"
ambasciudades <- rbind(baltimore4, losangeles)

fmt <- function(){
	f <- function(x) as.character(round(x,2))
	f
}

png("graficos/plot6.png", width = 480, height = 480)
ggplot(ambasciudades, aes(x=factor(year), y=Emissions, fill=County)) +
		geom_bar(aes(fill = County), position = "dodge", stat="identity") +
		labs(x = "Year") + labs(y = expression("Total Emissions (in log scale) of PM"[2.5])) +
		xlab("year") +
		ggtitle(expression("Motor vehicle emission in Baltimore and Los Angeles")) +
		scale_y_continuous(trans = log_trans(), labels = fmt())
dev.off()
