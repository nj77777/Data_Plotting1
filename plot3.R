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

## Create plot3 as line chart
plot(datx$weekday, as.numeric(as.character(datx$Sub_metering_1)), type="l", ylab="Energy sub metering",xlab="")

## Add Sub_metering 2 and 3 to the plot
lines(datx$weekday, as.numeric(as.character(datx$Sub_metering_2)), col="red")
lines(datx$weekday, as.numeric(as.character(datx$Sub_metering_3)), col="blue")

## Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

## Copy plot to png
dev.copy(png,width = 480, height = 480,'plot3.png')
dev.off()