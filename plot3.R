# TODO: Add comment
# 
# Author: Agouveia
###############################################################################

#QUESTION3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
#have seen decreases in emissions from 1999Ð2008 for Baltimore City? Which have seen increases in emissions from 1999Ð2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

baltimore3 <- ddply(baltimore, .(type, year), summarize, Emissions = sum(Emissions))

png("graficos/plot3.png", width = 480, height = 480)
qplot(year, Emissions, data = baltimore3, group = type, 
		color = type, geom = c("point", "line"), ylab = expression("Total Emissions of PM"[2.5]), 
		xlab = "Year", main = "Total Emissions in U.S. by Type of Pollutant")
dev.off()
