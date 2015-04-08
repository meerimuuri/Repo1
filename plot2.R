

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


# Plot 2
plot(elecData2$Time, elecData2$Global_active_power, type='l', xlab='', ylab="Global Active Power (kilowatts)")
