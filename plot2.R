file <- "household_power_consumption.txt"
data <- read.table(file,header = TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gblActivePower <- as.numeric(reqData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, gblActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()