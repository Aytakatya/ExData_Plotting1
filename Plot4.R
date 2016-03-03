## Script for building the plot 4

## 1. Read the data file
DT <- fread("../household_power_consumption.txt", na.strings = c("?"))

##Get the two-month subset of the data
DTs <- subset(DT, Date=="1/2/2007" | Date == "2/2/2007")
## Concatenate the data in the Date and Time columns
strDatetime <- with( DTs, (paste(Date, Time, sep="*")))
## Convert the list of concatenated strings to the list of datetime objects
datetime<-strptime(strDatetime,"%d/%m/%Y*%H:%M:%S")
## Open the PNG device
png(filename = "Plot4.png",width=480, height=480, units="px")
## create 4 transprent panels
par(mfcol = c(2,2), bg=NA)
## Draw 1st plot
plot(datetime, DTs$Global_active_power, ann=FALSE, type="n")
box()
lines(datetime, DTs$Global_active_power)
title(ylab="Global Active Power")
## Draw 2nd plot 
plot(datetime, DTs$Sub_metering_1, ann=FALSE, type="n")
box()
lines(datetime, DTs$Sub_metering_1)
lines(datetime, DTs$Sub_metering_2, col="red")
lines(datetime, DTs$Sub_metering_3, col="blue")
title(ylab="Energy sub metering")
legend("topright", names(DTs)[7:9], col=c("black", "red", "blue"), lty = 1, bty = "n")
## Draw 3rd plot
with(DTs, plot(datetime, Voltage, type="n"))
box()
lines(datetime, DTs$Voltage)
## Draw 4rd plot
with(DTs, plot(datetime, Global_reactive_power, type="n"))
box()
lines(datetime, DTs$Global_reactive_power)
## 5. Close the graphical device to write the file
dev.off()
## Clear the workspace of the data
rm(DT, DTs, strDatetime, datetime)