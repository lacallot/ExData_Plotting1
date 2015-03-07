## Making Plot 3

## Read household_power_consumption.txt file
## Missing values are coded as ?

dataFile<-read.csv("household_power_consumption.txt",header=T,sep=';',
                   check.names=F,stringsAsFactors=F,comment.char="",quote='\"',na.strings="?")

## Change format of Date variable
dataFile$Date<-as.Date(dataFile$Date,format="%d/%m/%Y")

## Only using data from the dates 2007-02-01 and 2007-02-02
dataSubSet<-subset(dataFile,subset=(Date>="2007-02-01" & Date<="2007-02-02"))

## Create DateTime variable
dataSubSet$DateTime<-paste(dataSubSet$Date, dataSubSet$Time)

## Change DataTimeFormat
dataSubSet$DateTime<-strptime(dataSubSet$DateTime,format="%Y-%m-%d %H:%M:%S")

## Create plot3.png file into workspace
png(filename ="plot3.png",width=480,height=480)

## Generate Plot
plot(dataSubSet$DateTime,dataSubSet$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(dataSubSet$DateTime,dataSubSet$Sub_metering_2, type="l", col="red")
points(dataSubSet$DateTime,dataSubSet$Sub_metering_3, type="l", col="blue")

## Adds legend
legend("topright",lty=c(1, 1),lwd=c(1, 1, 1), col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close Device
dev.off()