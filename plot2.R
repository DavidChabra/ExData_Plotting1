data <- read.table("./household_power_consumption.txt", 
                   sep = ";", 
                   head = TRUE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
new_times <- paste(as.Date(data$Date, "%d/%m/%Y"),
                   data$Time,
                   sep = " "
                  )
data$Time <- as.POSIXct(new_times)
png(filename = "plot2.png",
    width = 480, 
    height = 480
)
plot(data$Global_active_power ~ data$Time, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
     )
dev.off()
