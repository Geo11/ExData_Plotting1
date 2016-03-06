setwd("~/Data Science/4. Exploratory Data Analysis/Week 1/Project")

### Load the packages
library(dplyr)
library(lubridate)
Sys.setlocale("LC_ALL","English")

### Read the data
data<-read.csv("household_power_consumption.txt",header = T,sep = ';',na.strings = "?",stringsAsFactors = F)

### Select the data with interesting Date
graphs<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
rm(data)  ### Eliminate the full data

### Format to Date and Time
graphs$Date<-as.Date(graphs$Date,format="%d/%m/%Y")
graphs<-mutate(graphs,TimeDay=paste(graphs$Date, graphs$Time))
graphs$TimeDay <- as.POSIXct(graphs$TimeDay)

### Plot: Global Reactive 
plot(graphs$Sub_metering_1~graphs$TimeDay,type="l",col="black",ylab="Global Active Power (kilowatts)",xlab="")
lines(graphs$Sub_metering_2~graphs$TimeDay,type="l",col="red")
lines(graphs$Sub_metering_3~graphs$TimeDay,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

### Save as .png
dev.copy(png,file="Plot3.png")
dev.off()
