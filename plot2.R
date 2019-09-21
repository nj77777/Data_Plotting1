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

## Create plot2 as line chart
plot(datx$weekday, as.numeric(as.character(datx$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)",xlab="")

## Copy plot to png
dev.copy(png,width = 480, height = 480,'plot2.png')
dev.off()