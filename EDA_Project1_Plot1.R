#Exploratory Data Analysis
#Project 1
#Sean Jackson



#open library
library(datasets)

#download zip file
temp <- tempfile()
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, temp)
#copy data into variable
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, na.strings = "?")
unlink(temp)

#clean data/isolate rows
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#plot1
hist(data$Global_active_power,                  #loading variable measured
     height = 480, width = 480,                 #setting dimesions of plot
     col = "Red",                               #color for histogram 
     xlab = "Global Active Power (kilowatts)",  #labeling x axis variable
     main = "Global Active Power")              #main label of histogram
dev.copy(png, file = "Plot1.png") #copy plot to png
dev.off()    