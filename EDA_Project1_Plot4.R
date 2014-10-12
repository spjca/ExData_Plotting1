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

#create new column in dataframe which measures day of week
data$Timestamp <- strptime(paste(data$Date, data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot global active power against new timestamp column
plot(data$Timestamp, 
     data$Voltage,
     type = "l", xlab = "", ylab = "Voltage") #label plot

#plot 4

par(mfrow=c(2,2))#create a 2 by 2 of plots

#plot 4-1: plot global active power against timestamp
plot(data$Timestamp, 
     data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power") #label plot

#plot 4-2: plot voltage against timestamp
plot(data$Timestamp, 
     data$Voltage,
#     xlab = "datetime",  #labeling x axis variable
     type = "l", xlab = "datetime", ylab = "Voltage") #label plot

#plot 4-3: energy sub metering measurements against timestamp
plot(data$Timestamp, data$Sub_metering_1, type = "l",
     col = "Black",
     xlab = "", ylab = "Energ Sub Metering")
lines(data$Timestamp, data$Sub_metering_2, col = "Red")
lines(data$Timestamp, data$Sub_metering_3, col="Blue")

#plot 4-4: plot global reactive power against timestamp
plot(data$Timestamp, 
     data$Global_reactive_power,
#     xlab = "datetime",  #labeling x axis variable
     type = "l", xlab = "datetime", ylab = "Global_reactive_power") #label plot

#output png of plot
dev.copy(png, file = "Plot4.png") #copy plot to png
dev.off() 