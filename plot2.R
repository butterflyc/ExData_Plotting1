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
  
  
  #### Generate Plot 2
  png(filename="plot2.png", width=480, height=480)
  plot(Needed.data$datatime, Needed.data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
  dev.off()
