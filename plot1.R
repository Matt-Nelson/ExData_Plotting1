getData <- function(){
	data = read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
					  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
	data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
	data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	data$Date <- as.Date(data$Date, "%d/%m/%Y")
	
	data
}

data <- getData()
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
	 main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()