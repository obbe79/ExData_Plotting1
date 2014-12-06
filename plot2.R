data<-read.csv("household_power_consumption.txt", sep = ";",na.strings="?")
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
mydata<-subset(data,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<=as.POSIXct("2007-02-02 23:59:00"),select = Global_active_power:DateTime)
rm(data)

Sys.setlocale("LC_TIME", "English")
png(file = "plot2.png", bg = "transparent", width = 480, height = 480, units = "px")
plot(mydata$DateTime,mydata$Global_active_power,type = "l",
     ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
