library(dplyr)

#setwd("D:/Coursera/R_WorkingDir")
dt <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
subset_dt <- filter(dt, dt$Date %in% c("1/2/2007","2/2/2007"))
subset_dt$Date <- as.POSIXlt(as.character(subset_dt$Date), format="%d/%m/%Y")
subset_dt <- mutate(subset_dt, TimeStamp=as.POSIXct(paste(Date, Time)))

png(file = "plot3.png", width = 480, height = 480)
with(airquality, plot(subset_dt2$TimeStamp, subset_dt$Sub_metering_1, main = "", type="n", ylab = "Energy sub metering", xlab="", col="black"))
with(subset_dt, points(subset_dt2$TimeStamp, subset_dt$Sub_metering_1, col = "black", type = "l"))
with(subset_dt, points(subset_dt2$TimeStamp, subset_dt$Sub_metering_2, col = "red", type = "l"))
with(subset_dt, points(subset_dt2$TimeStamp, subset_dt$Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd=3)
dev.off()






