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

#plot the graph w legends
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})
#save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
