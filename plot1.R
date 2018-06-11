#ctrl+L clear console
#rm(list = ls()) clear environment

# Read data frame. Missing values are coded as ?
data_all <- read.csv2("household_power_consumption.txt")
#class(data_all$Date) [1] "factor"

# Convert the Date and Time variables to Date/Time classes
data_all$Global_active_power <- as.numeric(levels(data_all$Global_active_power))[data_all$Global_active_power]
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y") #convert to "Date" class
data_all$Time <- strptime(data_all$Time, format="%H:%M:%S")

# Subset data from dates 2007-02-01 and 2007-02-02:
data_sub <- subset(data_all, Date == "2007-02-01" | Date == "2007-02-02")

# Construct the plot and save it to a PNG file with a width of 480x480 pixels
# Create plot on screen device   width=480,height=480,units="px"
hist(data_sub$Global_active_power, col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
#with(data_sub, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Copy my plot to a PNG file and close the PNG graphic device
#dev.list() #dev.cur() #dev.set(2)
png("plot1.png", width=480, height = 480, units = "px")
#dev.copy(png, file = "plot1.png", width=480, height = 480, units = "px")
dev.off()
