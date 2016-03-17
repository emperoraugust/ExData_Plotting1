################################################################################

## Author:   Giacinto Maggiore
## Date:     16 March 2016
## Script:   plot4.R

## Description: The script makes the plot4 from the data set
#              and save it in PNG file

################################################################################


#If the data set does not exist, download and store it in the directory "./Data"
dataUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataPath<-"Data/data.zip"
if(!dir.exists("Data")){
      dir.create("Data")
}
if(!file.exists(dataPath) && !file.exists("Data/household_power_consumption.txt")){
      
      download.file(dataUrl,dataPath)
      unzip("Data/data.zip")
}

#Load the data set (142 Mb) and extract the rows of my interest
data<-read.table("Data/household_power_consumption.txt",sep=";",header=TRUE,
                 colClasses = c( "character", "character", rep("numeric", 7)),
                 na.strings ="?" )
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$dateTime<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")   #This is for the name of the days in English.
#It in not necessary if you are in USA.
# This command work only in Windows

#Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
             plot(dateTime,Global_active_power, type="l",xlab="",
                   ylab="Global Active Power")
             plot(dateTime,Voltage, type="l",xlab="datetime",
                   ylab="Voltage")
             plot(dateTime,Sub_metering_1, type="l",xlab="",
                  ylab="Energy sub metering")
             lines(dateTime,Sub_metering_2,col="red")
             lines(dateTime,Sub_metering_3,col="blue")
             legend("topright", lty=1,col=c("black", "red","blue"),bty = "n",
                    legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
             plot(dateTime,Global_reactive_power, type="l",xlab="datetime")
      })

dev.off()