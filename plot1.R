##      Coursera - Exploratory Data Analysis  ###
##          Plotting Course Project 1         ###
#############    PREPARARTION     ###############
# 1. set work directory
# 2. include all necessary packages
# 3. download all files and dataset
# 4. Unzip data files

  setwd("/Users/xinsui/Desktop/Rtraining/ExData_Plotting")
  path <- getwd()
  library(data.table)
  
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  destfile <- "exdata-data-household_power_consumption.zip"
  download.file(fileURL, file.path(path, destfile))
  unzip(file.path(path,destfile), files = NULL, list = FALSE, overwrite = TRUE,junkpaths = FALSE, exdir = ".", unzip = "internal",
        setTimes = FALSE )
  
  ####     list.files(path, recursive = TRUE)
  
  
######     Reading Data into data.frame  ##############################################################
  
  
  power.data <- fread(file.path(path, "household_power_consumption.txt")
                      , sep = ";", na.strings = c("?"), stringsAsFactors = FALSE, header = TRUE)
  
  ### filter only two days data
    Needed.data <- subset(power.data, Date=="1/2/2007"|Date=="2/2/2007")
    Needed.data <- data.frame(Needed.data)
  ### convert string to datetime  (Needed.data is data.frame and data.table,  strptime will now work with data.table. So have to convert to data.frame first)
    Needed.data$datatime <- strptime(paste(Needed.data$Date, Needed.data$Time, sep = ","), "%d/%m/%Y,%H:%M:%S") 
  

### Generate Plot 1  
  png(filename="plot1.png", width=480, height=480)
  hist(Needed.data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
  dev.off()

  
  