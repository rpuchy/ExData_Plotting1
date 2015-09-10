#This script will assist with Course Project 1
#This script produces a chart comparing Global active power to the time and day it was used.
#The data is filtered so that only "1/2/2007" and "2/2/2007"
#fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#dest<-"household_power_consumption.zip"
#oldwd<-getwd()
setwd("C:\\CourseWork\\ExData_Plotting1\\")
#download.file(fileURL,dest,method="libcurl",mode="wb")
#load and filter data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
fdata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
fdata$myDateTime<-as.POSIXct(paste(fdata$Date," ",fdata$Time),format="%d/%m/%Y %H:%M:%S")
#Open png device and plot chart
png(filename="plot1.png",width=480,height=480)
hist(fdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()