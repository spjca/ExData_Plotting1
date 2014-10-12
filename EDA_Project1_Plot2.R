#Exploratory Data Analysis
#Sean Jackson
#Plot 2

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
     data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") #label plot
dev.copy(png, file = "plot2.png")                 #copy plot to png
dev.off()   