household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

hpc <- subset(household_power_consumption, as.Date(Date)==as.Date("2007-02-01") | as.Date(Date)==as.Date("2007-02-02"))
hpc$timestamp <- strptime(paste0(hpc$Date, " ", hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)

# PLOT 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(hpc$timestamp,hpc$Global_active_power, pch=".", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hpc$timestamp,hpc$Global_active_power)
dev.off()
