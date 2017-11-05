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

# plot 2
plot(data_subset$datetime,data_subset$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
# alternative
#datetime=paste(data_subset$Date,data_subset$Time)
#dateTime=strptime(data_subset$datetime, "%Y-%m-%d %H:%M:%S",tz="UCT")
#plot(dateTime,data_subset$Global_active_power,type="l",
#    ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,'plot2.png')
dev.off()

