filename<- "./household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data<-  data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
x <- paste(data$Date, data$Time)
data$datetime<-as.POSIXct(x)
png("plot3.png", width=480, height=480)
plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()