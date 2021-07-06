data <- read.table("./household_power_consumption.txt", 
                   sep = ";", 
                   head = TRUE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
new_times <- paste(as.Date(data$Date, "%d/%m/%Y"),
                   data$Time,
                   sep = " "
)
data$Time <- as.POSIXct(new_times)
png(filename = "plot4.png",
    width = 480, 
    height = 480
)
par(mfrow = c(2, 2))
plot(data$Global_active_power ~ data$Time, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
)
plot(data$Voltage ~ data$Time, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage"
)
plot(data$Sub_metering_1 ~ data$Time, 
     type = "n", 
     xlab = "", 
     ylab = "Energy sub metering"
)
points(data$Sub_metering_1 ~ data$Time, type = "l")
points(data$Sub_metering_2 ~ data$Time, type = "l", col = "red")
points(data$Sub_metering_3 ~ data$Time, type = "l", col = "blue")
legend("topright", 
       lwd = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n"
       )
plot(data$Global_reactive_power ~ data$Time, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power"
)
dev.off()