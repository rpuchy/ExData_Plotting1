#This script will assist with Course Project 1
#This script produces a chart comparing sub metering to the time and day it was used.

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
png(filename="plot3.png",width=480,height=480)
plot(fdata$myDateTime,fdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(fdata$myDateTime,fdata$Sub_metering_1)
lines(fdata$myDateTime,fdata$Sub_metering_2,col="red")
lines(fdata$myDateTime,fdata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()