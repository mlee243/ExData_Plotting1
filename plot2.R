# read in and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", 
                                  "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
x <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# plot data and export as png
png(file = "plot2.png", width = 480, height = 480)
dt <- as.POSIXct(paste(x$Date, x$Time))
plot(dt, x$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
