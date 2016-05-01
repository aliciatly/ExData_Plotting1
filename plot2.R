filename<- "./household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data<-  data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
x <- paste(data$Date, data$Time)
data$datetime<-as.POSIXct(x)
png("plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()