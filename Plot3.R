library("data.table")
setwd("C:/Users/flemina4/OneDrive - Lincoln University/2021/Rcourse/Explore Data/ExData_Plotting1")
###Read in data and subset for specified dates ##
housedata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?"
)

housedata[,dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
housedata <- housedata[(dateTime >= "2007-02-01") & (dateTime <"2007-02-03")]
######Plot 3#####
png("Plot3.png", width = 480, height = 480) ##save as png

plot(housedata$dateTime, housedata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(housedata$dateTime, housedata$Sub_metering_2, type = "l", col = "red")
lines(housedata$dateTime, housedata$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_meetering_1", "Sub_metering_2", "Sub_meetering_3"),
       lty = c(1,1), lwd = c(1,1))
dev.off()
