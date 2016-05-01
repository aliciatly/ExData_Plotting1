filename<- "./household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data<-  data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red",  xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()