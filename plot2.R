## Plot 2

## Task 1: Set working directory
setwd("~/R/Exploratory_DataAnalysis")

## Task 2: Read in the data
mydata<-read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

## Task 3: Subset
sub_data <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

## Task 4: Fix dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## Task 5: Plot and Save
png("plot2.png", width=480, height=480)
plot(sub_data$Global_active_power~sub_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()