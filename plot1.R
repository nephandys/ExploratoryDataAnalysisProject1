# Read the data
data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Set the date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")

# Filter the data
subsetData<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Convert string to numeric format
GlobActPow<-suppressWarnings(as.numeric(subsetData[,"Global_active_power"]))

# Make and save the plot
png("plot1.png",width = 480, height = 480)
hist(GlobActPow, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()



