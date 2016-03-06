setwd("~/Data Science/4. Exploratory Data Analysis/Week 1/Project")

### Load the packages
library(dplyr)
library(lubridate)
### Read the data
data<-read.csv("household_power_consumption.txt",header = T,sep = ';',na.strings = "?",stringsAsFactors = F)

### Select the data with interesting Date
graphs<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
rm(data)  ### Eliminate the full data

### Histogram: Global Activite Power
hist(graphs$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")

### Save as .png
dev.copy(png,file="Plot1.png")
dev.off()
