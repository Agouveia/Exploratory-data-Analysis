# TODO: Add comment
# 
# Author: Agouveia
###############################################################################

#QUESTION2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

baltimore <- datos[which(datos$fips == "24510"), ]
baltimore2 <- with(baltimore, aggregate(Emissions, by = list(year), sum))
colnames(baltimore2) <- c("year", "Emissions")

png("graficos/plot2.png", width = 480, height = 480)
plot(baltimore2$year, baltimore2$Emissions, type = "b", pch = 25, col = "red", 
		ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")
dev.off()

