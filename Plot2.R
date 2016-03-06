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

### Plot: Global Reactive Power vs Time
plot(graphs$Global_active_power~graphs$TimeDay,type="l",ylab="Global Active Power (kilowatts)",xlab = "")

### Save as .png
dev.copy(png,file="Plot2.png")
dev.off()
