## loading package 'data.table'
library(data.table)

## reading data
PowerData <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

## converting date column to Date type
PowerData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

## Filtering the required dates
PowerData <- PowerData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## plotting histogram
hist(PowerData[,Global_active_power], col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## copying to graphic device png and disconnecting the device
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
