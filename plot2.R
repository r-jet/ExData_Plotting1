## Reading the data into R and subsetting it; if someone knows how to subset while reading data please mention
read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")->pdata
reqdata<-subset(pdata,pdata$Date=="1/2/2007" | pdata$Date =="2/2/2007")

##converting the Date and Time columns into single data time object of class date
datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(reqdata$Global_active_power)
reqdata$Datetime <- as.POSIXct(datetime)

## Plotting the data using base plotting system 
with(reqdata, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

##copying the plot to a png file
dev.copy(png,file="plot2.png")
dev.off()