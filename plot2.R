#set working directory
setwd("C:/Users/Maryam 'Aqilah/Documents/WIE 2003 (DS)/lab7")

library(data.table)

#read data
dat<-fread("./household_power_consumption 2.txt", na.strings="?")

dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#subset data
dat.filter <- subset(dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat)

#convert date
datetime <- paste(as.Date(dat.filter$Date), dat.filter$Time)
dat.filter$Datetime <- as.POSIXct(datetime)

#output histogram
plot(dat.filter$Global_active_power~dat.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
