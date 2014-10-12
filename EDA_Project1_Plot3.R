#Exploratory Data Analysis
#Sean Jackson
#Plot 3

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

plot(data$Timestamp, data$Sub_metering_1, type = "l",
     col = "Black",
     xlab = "", ylab = "Energ Sub Metering")
lines(data$Timestamp, data$Sub_metering_2, col = "Red")
lines(data$Timestamp, data$Sub_metering_3, col="Blue")
plot_colors = c("Black", "Red", "Blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = plot_colors, lwd = 1,  cex = .5)
dev.copy(png, file = "plot3.png")                 #copy plot to png
dev.off()   