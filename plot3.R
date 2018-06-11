#ctrl+L clear console
#rm(list = ls()) clear environment

# Read data frame. Missing values are coded as ?
data_all <- read.csv2("household_power_consumption.txt")
#class(data_all$Date) [1] "factor"

# Convert the Date and Time variables to Date/Time classes
data_all$Sub_metering_1 <- as.numeric(levels(data_all$Sub_metering_1))[data_all$Sub_metering_1]
data_all$Sub_metering_2 <- as.numeric(levels(data_all$Sub_metering_2))[data_all$Sub_metering_2]
data_all$Sub_metering_3 <- as.numeric(levels(data_all$Sub_metering_3))[data_all$Sub_metering_3]
data_all$datetime <- as.POSIXct(paste(data_all$Date, data_all$Time), format ="%d/%m/%Y %H:%M:%S")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y") #convert to "Date" class


# Subset data from dates 2007-02-01 and 2007-02-02:
data_sub <- subset(data_all, Date == "2007-02-01" | Date == "2007-02-02")
# Convert date to day data_sub$Day <- weekdays(as.Date(data_sub$Date))

#plot and save png
plot(data_sub$datetime, data_sub$Sub_metering_1, type="l", pch=20, xlab ="", ylab = "Energy sub metering")
lines(data_sub$datetime, data_sub$Sub_metering_2, type="l", pch=20, col = "red", xlab ="", ylab ="")
lines(data_sub$datetime, data_sub$Sub_metering_3, type="l", pch=20, col = "blue", xlab ="", ylab = "")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1:2, cex=0.8)
png("plot3.png", width=480, height = 480, units = "px")
dev.off()