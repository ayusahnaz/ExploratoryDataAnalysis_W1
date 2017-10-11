household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

hpc <- subset(household_power_consumption, as.Date(Date)==as.Date("2007-02-01") | as.Date(Date)==as.Date("2007-02-02"))
hpc$timestamp <- strptime(paste0(hpc$Date, " ", hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)

# PLOT 3
png("plot3.png", width=480, height=480)
plot(hpc$timestamp, hpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc$timestamp, hpc$Sub_metering_2, col="red")
lines(hpc$timestamp, hpc$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()