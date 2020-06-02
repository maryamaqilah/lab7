#set working directory
setwd("C:/Users/Maryam 'Aqilah/Documents/WIE 2003 (DS)/lab7")

library(data.table)

#read data
dat<-fread("./household_power_consumption 2.txt", na.strings="?")

dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#subset data
dat.filter <- subset(dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat)

#Convert date
datetime <- paste(as.Date(dat.filter$Date), dat.filter$Time)
dat.filter$Datetime <- as.POSIXct(datetime)

#plot graph w legends
with(dat.filter, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

#output histogram
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
