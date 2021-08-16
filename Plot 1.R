library("data.table")
setwd("C:/Users/flemina4/OneDrive - Lincoln University/2021/Rcourse/Explore Data/ExData_Plotting1")
###Read in data and subset for specified dates ##
housedata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?"
)

housedata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
housedata <- housedata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
###plot1 ###
par(mfrow = c (1,1), mar = c(4,4,1,1))
png("plot1.png", width = 480, height = 480)
with(housedata, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")) 
dev.off()
