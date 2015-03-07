## Making Plot 4

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

## Create plot4.png file into workspace
png(filename ="plot4.png",width=480,height=480)

par(mfrow=c(2, 2))

## Generate Plot
plot(dataSubSet$DateTime,dataSubSet$Global_active_power, type="l",xlab="",ylab="Global Active Power")
plot(dataSubSet$DateTime,dataSubSet$Voltage, type="l",xlab="datetime",ylab="Voltage")
plot(dataSubSet$DateTime,dataSubSet$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
points(dataSubSet$DateTime,dataSubSet$Sub_metering_2,type="l",col="Red")
points(dataSubSet$DateTime,dataSubSet$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",lty=c(1, 1),lwd=c(1, 1, 1),col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dataSubSet$DateTime,dataSubSet$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## Close Device
dev.off()