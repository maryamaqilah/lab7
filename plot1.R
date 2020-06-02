#set working directory
setwd("C:/Users/Maryam 'Aqilah/Documents/WIE 2003 (DS)/lab7")

#load library
library(data.table)
library(dplyr)

#read data
dat <- fread("./household_power_consumption 2.txt", na.strings = "?")

#set date as Date
d <- as.Date(dat$Date, "%d/%m/%Y")

#filter data
dat.filter <- filter(dat, d=="2007-02-01" | d=="2007-02-02")
dat.filter$Global_active_power <- as.numeric(dat.filter$Global_active_power)

#output histogram
png(filename="plot1.png", width=480, height=480)
hist(dat.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
