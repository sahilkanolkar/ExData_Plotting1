file <- "household_power_consumption.txt"
data <- read.table(file,header = TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

gblActivePower <- as.numeric(reqData$Global_active_power)
png("plot1.png",width=480,height=480)
hist(gblActivePower,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()