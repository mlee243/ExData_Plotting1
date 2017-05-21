# read in and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", 
                                  "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
x <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# plot and export as png
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
dt <- as.POSIXct(paste(x$Date, x$Time))
plot(dt, x$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
plot(dt, x$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt, x$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
points(dt, x$Sub_metering_2, type = "l", col = "red")
points(dt, x$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")
plot(dt,x$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()

