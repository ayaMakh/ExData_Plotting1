# Plot 4: Multiple plots in one graph
library(data.table)
dt <- fread("curl https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip | funzip")

# Adding a new column where Date and Time values are combined: to be used as the plotting indexes. 
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())

# Setting Date column to "Date" format for filtering purposes
dt$Date <- as.Date(dt$Date,  "%d/%m/%Y")
epcData <- dt[dt$Date > as.Date("2007-01-31") & dt$Date < as.Date("2007-02-03"),]

# Switched from dev copy here due to legend cut off issues
png("plot4.png", width=480, height=480)

# Setting the graphing grid to take 2x2 graphs
par(mfcol = c(2,2))

# First plot: sLine graph of the Global Active Power column over the period of two days
with(epcData, plot(DateTime, as.numeric(Global_active_power), type = "l", ylab = "Global Active power", xlab = ""))

# Second plot: ine graph with multiples lines, representing the energy sub metering 1,2,3 over the period of two days
with(epcData, plot(DateTime, as.numeric(Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = ""))
lines(epcData$DateTime, as.numeric(epcData$Sub_metering_2), type = "l", col = "red")
lines(epcData$DateTime, as.numeric(epcData$Sub_metering_3), type = "l", col = "blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

# Third plot: Line graph of the Voltage column over the period of two days
with(epcData, plot(DateTime, as.numeric(Voltage), type = "l", ylab = "Voltage", xlab = "datetime"))

# Fourth plot: Line graph of the Global Reactive Power column over the period of two days
with(epcData, plot(DateTime, as.numeric(Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()