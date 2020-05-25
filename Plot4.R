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
SubMetering1 <- as.numeric(PowerData$Sub_metering_1)
SubMetering2 <- as.numeric(PowerData$Sub_metering_2)
SubMetering3 <- as.numeric(PowerData$Sub_metering_3)
Voltage <- as.numeric(PowerData$Voltage)
Global_Reactive_Power <- as.numeric(PowerData$Global_reactive_power)


## plotting
par(mfcol=c(2,2))
plot(DateTime, Global_Active_Power, type = "l", xlab = " ", ylab = "Global Active Power")
plot(DateTime, SubMetering1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(DateTime, SubMetering2, type = "l", col = "red")
lines(DateTime, SubMetering3, type = "l", col = "blue")
legend("topright", lty = c(1,1), lwd = c(1,1), col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_matering_3"))
plot(DateTime, Voltage, type = "l", xlab = " ", ylab = "Voltage")
plot(DateTime, Global_Reactive_Power, type = "l", xlab = " ", ylab = "Global_reactive_power")

## copying to graphic device png and disconnecting the device
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
