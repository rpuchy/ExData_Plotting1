#This script will assist with Course Project 1
#This script produces a chart comparing Global active power to the time and day it was used.
#fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#dest<-"household_power_consumption.zip"
#oldwd<-getwd()
setwd("C:\\CourseWork\\ExData_Plotting1\\")
#download.file(fileURL,dest,method="libcurl",mode="wb")
#load and filter data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
fdata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
fdata$myDateTime<-as.POSIXct(paste(fdata$Date," ",fdata$Time),format="%d/%m/%Y %H:%M:%S")
#Open png device and output the plot
png(filename="plot2.png",width=480,height=480)
plot(fdata$myDateTime,fdata$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(fdata$myDateTime,fdata$Global_active_power)
dev.off()