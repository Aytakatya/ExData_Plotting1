## Script for building the histogram of data in the "global active power" column.

## 1. Read the data file
DT <- fread("../household_power_consumption.txt", na.strings = c("?"))

## 2. Get the two-month subset of the data
DTs <- subset(DT, Date=="1/2/2007" | Date == "2/2/2007")

## 3. Open the PNG device
png(filename = "Plot1.png",width=480, height=480, units="px")

## 4. Draw a histogram of the data in the column Global_active_power
hist(DTs$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

## 5. Close the graphical device to write the file
dev.off()

## Clear the workspace of the data
rm(DT, DTs)