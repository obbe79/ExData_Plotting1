data<-read.csv("household_power_consumption.txt", sep = ";",na.strings="?")
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
mydata<-subset(data,DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<=as.POSIXct("2007-02-02 23:59:00"),select = Global_active_power:DateTime)
rm(data)

png(file = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")
hist(mydata$Global_active_power,col="red",main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()