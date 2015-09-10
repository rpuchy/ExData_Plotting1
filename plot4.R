#This script will assist with Course Project 1
#This script produces a four charts
#comparing Active power over time and days.

#fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#dest<-"household_power_consumption.zip"
#oldwd<-getwd()
#load and filter data
setwd("C:\\CourseWork\\ExData_Plotting1\\")
#download.file(fileURL,dest,method="libcurl",mode="wb")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
fdata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
fdata$myDateTime<-as.POSIXct(paste(fdata$Date," ",fdata$Time),format="%d/%m/%Y %H:%M:%S")
#Open png device and plot chart
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#chart1
plot(fdata$myDateTime,fdata$Global_active_power,type="n",xlab="",ylab="Global Active Power",cex.axis=0.8 )
lines(fdata$myDateTime,fdata$Global_active_power)

#chart 2
plot(fdata$myDateTime,fdata$Voltage,type="n",xlab="datetime",ylab="Voltage",cex.axis=0.8 )
lines(fdata$myDateTime,fdata$Voltage)

#chart3
plot(fdata$myDateTime,fdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",cex.axis=0.8)
lines(fdata$myDateTime,fdata$Sub_metering_1)
lines(fdata$myDateTime,fdata$Sub_metering_2,col="red")
lines(fdata$myDateTime,fdata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8,bty="n")

#chart 4
plot(fdata$myDateTime,fdata$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power",cex.axis=0.8 )
lines(fdata$myDateTime,fdata$Global_reactive_power)

dev.off()