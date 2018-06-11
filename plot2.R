#ctrl+L clear console
#rm(list = ls()) clear environment

# Read data frame. Missing values are coded as ?
data_all <- read.csv2("household_power_consumption.txt")
#class(data_all$Date) [1] "factor"

# Convert the Date and Time variables to Date/Time classes
data_all$Global_active_power <- as.numeric(levels(data_all$Global_active_power))[data_all$Global_active_power]
data_all$datetime <- as.POSIXct(paste(data_all$Date, data_all$Time), format ="%d/%m/%Y %H:%M:%S")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y") #convert to "Date" class


# Subset data from dates 2007-02-01 and 2007-02-02:
data_sub <- subset(data_all, Date == "2007-02-01" | Date == "2007-02-02")
# Convert date to day data_sub$Day <- weekdays(as.Date(data_sub$Date))

#plot and save png
png("plot2.png", width=480, height = 480, units = "px")
plot(data_sub$datetime, data_sub$Global_active_power, type="l", pch=20, xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
     