library(dplyr)

#setwd("D:/Coursera/R_WorkingDir")
dt <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
subset_dt <- filter(dt, dt$Date %in% c("1/2/2007","2/2/2007"))
subset_dt$Date <- as.POSIXlt(as.character(subset_dt$Date), format="%d/%m/%Y")
subset_dt <- mutate(subset_dt, TimeStamp=as.POSIXct(paste(Date, Time)))

png(file = "plot2.png", width = 480, height = 480)
with(subset_dt, plot(subset_dt2$TimeStamp, subset_dt$Global_active_power, main = "", type="l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()
