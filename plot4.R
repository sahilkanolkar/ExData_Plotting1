file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gblActivePower <- as.numeric(reqData$Global_active_power)
gblReactivePower <- as.numeric(reqData$Global_reactive_power)
voltage <- as.numeric(reqData$Voltage)
sub1 <- as.numeric(reqData$Sub_metering_1)
sub2 <- as.numeric(reqData$Sub_metering_2)
sub3 <- as.numeric(reqData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, gblActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, gblReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()