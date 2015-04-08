

elecData = read.table('household_power_consumption.txt', header=T, sep=";", stringsAsFactors=F)

summary(elecData)


elecData = subset(elecData, Global_active_power!='?')
elecData = subset(elecData, Global_reactive_power!='?')
elecData = subset(elecData, Voltage!='?')
elecData = subset(elecData, Global_intensity!='?')
elecData = subset(elecData, Sub_metering_1!='?')
elecData = subset(elecData, Sub_metering_2!='?')
elecData = subset(elecData, Sub_metering_3!='?')

elecData = as.data.frame(elecData)

elecData$Global_active_power = as.numeric(elecData$Global_active_power)
elecData$Global_reactive_power = as.numeric(elecData$Global_reactive_power)
elecData$Voltage = as.numeric(elecData$Voltage)
elecData$Global_intensity = as.numeric(elecData$Global_intensity)
elecData$Sub_metering_1 = as.numeric(elecData$Sub_metering_1)
elecData$Sub_metering_2 = as.numeric(elecData$Sub_metering_2)
elecData$Sub_metering_3 = as.numeric(elecData$Sub_metering_3)

# 16/12/2006
elecData$Date = as.Date(elecData$Date, "%d/%m/%Y")
fullTime = with(elecData, paste(Date, Time))
elecData$Time = strptime(fullTime, format="%Y-%m-%d %H:%M:%S")


#  2007-02-01 and 2007-02-02

elecData2 = subset(elecData, (Date=="2007-02-01" | Date=="2007-02-02"))

summary(elecData2)

# Plot 3
png('plot3.png')
plot(elecData2$Time, elecData2$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(elecData2$Time, elecData2$Sub_metering_2, col='red')
lines(elecData2$Time, elecData2$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c('black', 'red', 'blue'))
dev.off()