# loading data
setwd("/Users/pritikamalik/Documents/R Programming")
eda_week1_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
eda_week1_data1 <- subset(eda_week1_data, Date %in% c("1/2/2007","2/2/2007"))
eda_week1_data1$Date <- as.Date(eda_week1_data1$Date, format="%d/%m/%Y")

# plot 1
hist(eda_week1_data1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
dev.off()