# loading data
> setwd("/Users/pritikamalik/Documents/R Programming")
> eda_week1_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
> eda_week1_data1 <- subset(eda_week1_data, Date %in% c("1/2/2007","2/2/2007"))
> eda_week1_data1$Date <- as.Date(eda_week1_data1$Date, format="%d/%m/%Y")

# plot 1
> hist(eda_week1_data1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
> png("plot1.png", width=480, height=480)
> dev.off()

# plot 2
> TimeDate <- paste(as.Date(eda_week1_data1$Date), eda_week1_data1$Time)
> eda_week1_data1$Datetime <- as.POSIXct(TimeDate)
> with(eda_week1_data1, {plot(Global_active_power~Datetime, type="l",ylab="Global Active Power(kilowatts)", xlab="")})
> dev.copy(png, file="plot2.png", height=480, width=480)
> dev.off()

# plot 3
> with(eda_week1_data1, {
  +     plot(Sub_metering_1~Datetime, type="l",
             +          ylab="Global Active Power (kilowatts)", xlab="")
  +     lines(Sub_metering_2~Datetime,col='Red')
  +     lines(Sub_metering_3~Datetime,col='Blue')
  + })
> legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         +        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
> dev.copy(png, file="plot3.png", height=480, width=480)
> dev.off()

# plot 4
> par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
> with(eda_week1_data1, {
  +     plot(Global_active_power~Datetime, type="l", 
             +          ylab="Global Active Power (kilowatts)", xlab="")
  +     plot(Voltage~Datetime, type="l", 
             +          ylab="Voltage (volt)", xlab="")
  +     plot(Sub_metering_1~Datetime, type="l", 
             +          ylab="Global Active Power (kilowatts)", xlab="")
  +     lines(Sub_metering_2~Datetime,col='Red')
  +     lines(Sub_metering_3~Datetime,col='Blue')
  +     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               +            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  +     plot(Global_reactive_power~Datetime, type="l", 
             +          ylab="Global Rective Power (kilowatts)",xlab="")
  + })
> dev.copy(png, file="plot4.png", height=480, width=480)
> dev.off()
