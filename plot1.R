# Plot 1: Histogram of the Global Active Power column
library(data.table)
dt <- fread("curl https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip | funzip")

# Setting Date column to "Date" format for filtering purposes
dt$Date <- as.Date(dt$Date,  "%d/%m/%Y")
epcData <- dt[dt$Date > as.Date("2007-01-31") & dt$Date < as.Date("2007-02-03"),]

# Plotting a histogram of the "Global Active Power" column: color = red, label on x-axis = "Global Active Power (kilowatts)" and graph title = "Global Active Power"
hist(as.numeric(epcData$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# By default set to 480x480 size
dev.copy(png,'plot1.png')
dev.off()