## Reading the data into R and subsetting it; if someone knows how to subset while reading data please mention
read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")->pdata
reqdata<-subset(pdata,pdata$Date=="1/2/2007" | pdata$Date =="2/2/2007")

## Plotting the data using base plotting system 
with(reqdata,hist(Global_active_power,main = "Global Active Power",col="red", xlab="Global Active Power(kilowatts)"))

##copying the plot to a png file
dev.copy(png,file="plot1.png")
dev.off()