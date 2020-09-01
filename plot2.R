# Read the data
data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Set the date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")

# Filter the data
subsetData<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# set the Date-time format
dateTime<-strptime(paste(subsetData$Date,subsetData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert string to numeric format
GlobActPow<-as.numeric(subsetData[,"Global_active_power"])

# Make and save the plot
png("plot2.png",width = 480, height = 480)
plot(dateTime,GlobActPow,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()
