# read in and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", 
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
x <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# plot data and export as png
png(file = "plot1.png", width = 480, height = 480)
hist(x$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
