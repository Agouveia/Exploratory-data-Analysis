# TODO: Add comment
# 
# Author: Agouveia
###############################################################################

#QUESTION1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#Upload a PNG file containing your plot addressing this question.

setwd("/Users/pacha/Dropbox/R/exdata/course-project-2")

library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr) 

direccion <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
datos <- "datos"
if(!file.exists(datos)){
	dir.create(datos)
} 
graficos <- "graficos" 
if(!file.exists(graficos)){
	dir.create(graficos)
}
archivo <- paste(getwd(), "/datos/exdata_data_NEI_data.zip", sep = "")
if(!file.exists(archivo)){
	download.file(direccion, archivo, method="curl", mode="wb")
}
archivo1 <- paste(getwd(), "/datos/Source_Classification_Code.rds", sep = "")
if(!file.exists(archivo1)){
	unzip(archivo, list = FALSE, overwrite = FALSE, exdir = datos)
}
archivo2 <- paste(getwd(), "/datos/summarySCC_PM25.rds", sep = "")
if(!file.exists(archivo2)){
	unzip(archivo, list = FALSE, overwrite = FALSE, exdir = datos)
}

clasificacion <- readRDS("datos/Source_Classification_Code.rds")
datos <- readRDS("datos/summarySCC_PM25.rds")

clasificacion = data.table(clasificacion)
datos = data.table(datos)

contaminacion <- with(datos, aggregate(Emissions, by = list(year), sum))

png("graficos/plot1.png", width = 480, height = 480)
plot(contaminacion, type = "b", pch = 25, col = "blue", ylab = "Emissions", xlab = "Year", main = "Annual Emissions")
dev.off()


