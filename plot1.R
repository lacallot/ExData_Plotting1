## Making Plot 1

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

## Create plot1.png file into workspace
png(filename ="plot1.png",width=480,height=480)

## Generate Histogramm
hist(dataSubSet$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")

## Close Device
dev.off()
