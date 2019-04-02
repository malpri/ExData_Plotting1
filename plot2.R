# loading data
setwd("/Users/pritikamalik/Documents/R Programming")
eda_week1_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
eda_week1_data1 <- subset(eda_week1_data, Date %in% c("1/2/2007","2/2/2007"))
eda_week1_data1$Date <- as.Date(eda_week1_data1$Date, format="%d/%m/%Y")

# plot 2
TimeDate <- paste(as.Date(eda_week1_data1$Date), eda_week1_data1$Time)
eda_week1_data1$Datetime <- as.POSIXct(TimeDate)
with(eda_week1_data1, {plot(Global_active_power~Datetime, type="l",ylab="Global Active Power(kilowatts)", xlab="")})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()