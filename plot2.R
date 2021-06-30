# Plot 2: Line graph of the Global Active Power column over the period of two days
library(data.table)
dt <- fread("curl https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip | funzip")

# Adding a new column where Date and Time values are combined: to be used as the plotting indexes. 
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())

# Setting Date column to "Date" format for filtering purposes
dt$Date <- as.Date(dt$Date,  "%d/%m/%Y")
epcData <- dt[dt$Date > as.Date("2007-01-31") & dt$Date < as.Date("2007-02-03"),]

# Plotting a line graph with the required annotations (type = "l" set so that only lines are displayed)
with(epcData, plot(DateTime, as.numeric(Global_active_power), type = "l", ylab = "Global Active power (kilowatts)", xlab = ""))

# By default set to 480x480 size
dev.copy(png,'plot2.png')
dev.off()