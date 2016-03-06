setwd("~/Data Science/4. Exploratory Data Analysis/Week 1/Project")

### Load the packages
library(dplyr)
library(lubridate)

### Read the data
data<-read.csv("household_power_consumption.txt",header = T,sep = ';',na.strings = "?",stringsAsFactors = F)

### Select the data with interesting Date
graphs<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
rm(data)  ### Eliminate the full data

### Format to Date and Time
graphs$Date<-as.Date(graphs$Date,format="%d/%m/%Y")
graphs<-mutate(graphs,TimeDay=paste(graphs$Date, graphs$Time))
graphs$TimeDay <- as.POSIXct(graphs$TimeDay)

### Plot: All Graphs
par(mfrow = c(2,2))

## Plot (1,1)
hist(graphs$Global_active_power,col="red",main="",xlab="Global Active Power (Kilowatts)")

## Plot (1,2)
plot(graphs$Voltage~graphs$TimeDay,type="l",col="black",ylab="Voltage",xlab="datatime")

## Plot (2,1)
plot(graphs$Sub_metering_1~graphs$TimeDay,type="l",col="black",ylab="Global Active Power",xlab="")
lines(graphs$Sub_metering_2~graphs$TimeDay,type="l",col="red")
lines(graphs$Sub_metering_3~graphs$TimeDay,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,bty="n",cex=0.6)

## Plot (2,2)
plot(graphs$Global_reactive_power~graphs$TimeDay,type="l",col="black",ylab="Global_reactive_Power",xlab="datime")

### Save as .png
dev.copy(png,file="Plot4.png")
dev.off()
