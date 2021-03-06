##      Coursera - Exploratory Data Analysis  ###
##          Plotting Course Project 1         ###
#############    PREPARARTION     ###############
# 1. set work directory
# 2. include all necessary packages


setwd("/Users/xinsui/Desktop/Rtraining/ExData_Plotting")
path <- getwd()
library(data.table)

######     Reading Data into data.frame  ##############################################################
    
    
    power.data <- fread(file.path(path, "household_power_consumption.txt")
                        , sep = ";", na.strings = c("?"), stringsAsFactors = FALSE, header = TRUE)
    
    ### filter only two days data
    Needed.data <- subset(power.data, Date=="1/2/2007"|Date=="2/2/2007")
    Needed.data <- data.frame(Needed.data)
    ### convert string to datetime  (Needed.data is data.frame and data.table,  strptime will now work with data.table. So have to convert to data.frame first)
    Needed.data$datatime <- strptime(paste(Needed.data$Date, Needed.data$Time, sep = ","), "%d/%m/%Y,%H:%M:%S") 
    
    
    #### Generate Plot 4
    png(filename="plot4.png", width=480, height=480)
    par(mfrow = c(2,2))
    plot(Needed.data$datatime, Needed.data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power" )
    plot(Needed.data$datatime, Needed.data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(Needed.data$datatime, Needed.data$Sub_metering_1, type = "l", ylab = "Energy sub meeting", xlab = "")
    lines(Needed.data$datatime, Needed.data$Sub_metering_2, col = "red")
    lines(Needed.data$datatime, Needed.data$Sub_metering_3, col = "blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"), lwd=par("lwd"))
    plot(Needed.data$datatime, Needed.data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    dev.off()




