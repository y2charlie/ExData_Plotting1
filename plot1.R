library(dplyr)

#setwd("D:/Coursera/R_WorkingDir")
dt <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
subset_dt <- filter(dt, dt$Date %in% c("1/2/2007","2/2/2007"))
subset_dt$Date <- as.Date(subset_dt$Date, "%d/%m/%Y")
subset_dt$Time <- strptime(subset_dt$Time, "%H:%M:%S")

png(file = "plot1.png", width = 480, height = 480)
with(subset_dt, hist(Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
