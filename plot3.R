## Reading the data into R and subsetting it; if someone knows how to subset while reading data please mention
read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")->pdata
reqdata<-subset(pdata,pdata$Date=="1/2/2007" | pdata$Date =="2/2/2007")

##converting the Date and Time columns into single data time object of class date
datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(reqdata$Global_active_power)
reqdata$Datetime <- as.POSIXct(datetime)

## Plotting the data using base plotting system 
with(reqdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##copying the plot to a png file
dev.copy(png,file="plot3.png")
dev.off()