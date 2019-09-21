## Read the text file with first row as column headers

dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Convert first column as date to create appropriate subsets
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

## Subset 2 datasets with date equal to 2007-02-01 and 2007-02-02
dat1<-subset(dat, dat$Date=="2007-02-01")
dat2<-subset(dat, dat$Date=="2007-02-02")

## combine the 2 subsets 
datx<-rbind(dat1,dat2)

## Convert date and time using POSIXlt
datx$weekday<-as.POSIXlt(paste(datx$Date, datx$Time))

## Setup the layout with margins
par(mfrow=c(2,2), mar=c(5,5,1,1))

## Plot top left Global Active Power, revised axis and label font size
plot(datx$weekday, as.numeric(as.character(datx$Global_active_power)), type="l", ylab="Global Active Power",xlab="", cex.axis=1, cex.lab=1)

## Plot top right Voltage, revised axis and label font size
plot(datx$weekday, as.numeric(as.character(datx$Voltage)), type="l", ylab="Voltage",xlab="datetime", cex.axis=1, cex.lab=1)

## Plot bottom left, revised axis, label and legend font size (legend without a box around it)
plot(datx$weekday, as.numeric(as.character(datx$Sub_metering_1)), type="l", ylab="Energy sub metering",xlab="")
        lines(datx$weekday, as.numeric(as.character(datx$Sub_metering_2)), col="red")
        lines(datx$weekday, as.numeric(as.character(datx$Sub_metering_3)), col="blue")
## legend position of topright gets cut off when it is saved as png so it is positioned as top and not topright
        legend("top",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n", cex=1)
      
## Plot bottom right, revised axis and label font size
plot(datx$weekday, as.numeric(as.character(datx$Global_reactive_power)), type="l", ylab="Global_reactive_power",xlab="datetime", cex.axis=1, cex.lab=1)

## Copy plot to png
dev.copy(png,width = 480, height = 480,'plot4.png')
dev.off()

