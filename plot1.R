#set the working directory where has the data file
#read-in data set
#convert the Date and Time variables

setwd ("c:/temp/EDA/")
datafile <- "./household_power_consumption.txt"
data <- read.table (text = grep("^[1,2]/2/2007", readLines(datafile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE, na.strings = "?")
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Plot1

#Open a png graphics device
png("plot1.png", bg="transparent", width=480, height=480)

#Create plot1
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

#close the graphics device
dev.off()
