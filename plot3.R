data <- read.table("./household_power_consumption.txt", 
                   sep = ";", 
                   head = TRUE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
new_times <- paste(as.Date(data$Date, "%d/%m/%Y"),
                   data$Time,
                   sep = " "
)
data$Time <- as.POSIXct(new_times)
png(filename = "plot3.png",
    width = 480, 
    height = 480
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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )
dev.off()