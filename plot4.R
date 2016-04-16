# TODO: Add comment
# 
# Author: Agouveia
###############################################################################
#QUESTION4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999Ð2008?

coal1 = clasificacion[grep("Coal", SCC.Level.Three), SCC]
coal2 = datos[SCC %in% coal1, sum(Emissions), by = "year"]
setnames(coal2, c("year", "Emissions"))

png("graficos/plot4.png", width = 480, height = 480)
g = ggplot(coal2, aes(year, Emissions))
g + geom_point(color = "black") + geom_line(color = "blue") + labs(x = "Year") + 
		labs(y = expression("Total Emissions of PM"[2.5])) + labs(title = "Emissions from Coal Combustion for the US")
dev.off()
