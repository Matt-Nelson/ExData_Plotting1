getData <- function(){
	data = read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
					  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
	data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
	data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	
	data
}

data <- getData()
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

with(data, {
	plot(Time, Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
	lines(Time, Global_active_power)
	
	
	plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
	lines(Time, Voltage)
	
	
	plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
	lines(Time, Sub_metering_1, type = "l")
	lines(Time, Sub_metering_2, type = "l", col = "red")
	lines(Time, Sub_metering_3, type = "l", col = "blue")
	legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), 
		   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	
	plot(Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
	lines(Time, Global_reactive_power)
})

dev.off()