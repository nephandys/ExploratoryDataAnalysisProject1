# Read the data
data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")

# Filter the data
subsetData<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# set the Date-time format
dateTime<-strptime(paste(subsetData$Date,subsetData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert string to numeric format
subset1<-as.numeric(subsetData[,"Sub_metering_1"])
subset2<-as.numeric(subsetData[,"Sub_metering_2"])
subset3<-as.numeric(subsetData[,"Sub_metering_3"])

# Make and save the plot
png("plot3.png",width = 480, height = 480)
plot(dateTime,subset1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(dateTime, subset2, col = "red")
lines(dateTime, subset3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()
