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

# plot 1
hist(data_subset$Global_active_power,col="red",
        xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.copy(png,'plot1.png')
dev.off()
