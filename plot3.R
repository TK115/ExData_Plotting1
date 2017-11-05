rm(list=ls())

library(dplyr)
library(data.table)

##############################################################################################

# data
setwd("/Users/tillkischkat/Desktop/AXA/Coursera - Data Science Specialization/Explanatory Data Analysis/Week 1/Assignment_Exploratory_Data_Analysis")
data<-fread("household_power_consumption.txt",stringsAsFactors=FALSE,na.strings="?")
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data_subset=data[data$Date %between% c("2007-02-01","2007-02-02"),]
data_subset$datetime=as.POSIXct(paste(data_subset$Date,data_subset$Time),tz="UCT")

# plot 3
plot(data_subset$datetime,data_subset$Sub_metering_1,type="l",
     ylab="Energy sub meetering",xlab="")
lines(data_subset$datetime,data_subset$Sub_metering_2,col="red")
lines(data_subset$datetime,data_subset$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, cex=0.8)

dev.copy(png,'plot3.png')
dev.off()

