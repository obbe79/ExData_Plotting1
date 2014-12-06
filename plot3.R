data<-read.csv("household_power_consumption.txt", sep = ";",na.strings="?")
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
mydata<-subset(data,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<=as.POSIXct("2007-02-02 23:59:00"),select = Global_active_power:DateTime)
rm(data)

Sys.setlocale("LC_TIME", "English")
png(file = "plot3.png", bg = "transparent", width = 480, height = 480, units = "px")
plot(mydata$DateTime,mydata$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
lines(mydata$DateTime,mydata$Sub_metering_2,type = "l",col = "red")
lines(mydata$DateTime,mydata$Sub_metering_3,type = "l",col = "blue")
legend("topright", lty = 1,col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
