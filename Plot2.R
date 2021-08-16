library("data.table")
setwd("C:/Users/flemina4/OneDrive - Lincoln University/2021/Rcourse/Explore Data/ExData_Plotting1")
###Read in data and subset for specified dates ##
housedata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?"
)
housedata[,dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
housedata <- housedata[(dateTime >= "2007-02-01") & (dateTime <"2007-02-03")]

###Plot 2####

png("plot2.png", width = 480, height = 480)

with(housedata, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
