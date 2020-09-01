# Read the data
data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Set the date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")

# Filter the data
subsetData <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

GlobActPow <- suppressWarnings(as.numeric(subsetData[,"Global_active_power"]))
dateTime <- strptime(paste(subsetData$Date,subsetData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
subset1 <- as.numeric(subsetData[,"Sub_metering_1"])
subset2 <- as.numeric(subsetData[,"Sub_metering_2"])
subset3 <- as.numeric(subsetData[,"Sub_metering_3"])
globalReact <- as.numeric(subsetData[,"Global_reactive_power"])
Volt <- as.numeric(subsetData[,"Voltage"])

png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
plot(dateTime,GlobActPow,type = "l",xlab = " ",ylab = "Global Active Power")

# Plot 2
plot(dateTime,Volt,type = "l",xlab = "dateTimeime",ylab = "Voltage")

#Plot 3
plot(dateTime,subset1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(dateTime, subset2, col = "red")
lines(dateTime, subset3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

#Plot 4
plot(dateTime,globalReact,type = "l",xlab = "dateTimeime",ylab = "Global_reactive_power")

dev.off()