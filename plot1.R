################################################################################

   ## Author:   Giacinto Maggiore
   ## Date:     16 March 2016
   ## Script:   plot1.R

   ## Description: The script makes the plot1 from the data set
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


#Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab= "Global Active Power (kilowatts)")
dev.off()

