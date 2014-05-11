getData <- function(){
	data = read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
					  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
	data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
	data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	
	data
}

data <- getData()
png("plot3.png", width = 480, height = 480)
with(data, plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Time, Sub_metering_1, type = "l"))
with(data, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(data, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
	   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()