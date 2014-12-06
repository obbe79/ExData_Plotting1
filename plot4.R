data<-read.csv("household_power_consumption.txt", sep = ";",na.strings="?")
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
mydata<-subset(data,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<=as.POSIXct("2007-02-02 23:59:00"),select = Global_active_power:DateTime)
rm(data)

Sys.setlocale("LC_TIME", "English")
png(file = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(mydata, {
        plot(DateTime,Global_active_power,type = "l",ylab="Global Active Power ",xlab="")
        plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
        
        plot(DateTime,Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
        lines(DateTime,Sub_metering_2,type = "l",col = "red")
        lines(DateTime,Sub_metering_3,type = "l",col = "blue")
        legend("topright", lty = 1,bty = "n", col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(DateTime,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.off()
