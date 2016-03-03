## Script for building the plot of global active power vs time

## 1. Read the data file
DT <- fread("../household_power_consumption.txt", na.strings = c("?"))

##Get the two-month subset of the data
DTs <- subset(DT, Date=="1/2/2007" | Date == "2/2/2007")
## Concatenate the data in the Date and Time columns
datetime <- with( DTs, (paste(Date, Time, sep="*")))
## Convert the list of concatenated strings to the list of time objects
time<-strptime(datetime,"%d/%m/%Y*%H:%M:%S")
## Open the PNG device
png(filename = "Plot2.png",width=480, height=480, units="px")
## Draw a plot of the data with type="n" and default box around it
plot(time, DTs$Global_active_power, ann=FALSE, type="n")
box()
## Add lines
lines(time, DTs$Global_active_power)
## Add y label
title(ylab="Global Active Power (kilowatts)")
## 5. Close the graphical device to write the file
dev.off()
## Clear the workspace of the data
rm(DT, DTs, datetime, time)