## loading package 'data.table'
library(data.table)

## reading data
Dataset <- "household_power_consumption.txt"
PowerData <- read.table(Dataset, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Filtering the required dates
PowerData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007"),]

## str
DateTime <- strptime(paste(PowerData$Date, PowerData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power <- as.numeric(PowerData$Global_active_power)


## plotting
plot(DateTime, Global_Active_Power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

## copying to graphic device png and disconnecting the device
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
