#cloning
#loading my data into a table form
household_power_consumption <- read.table("C://Users/eleft/Desktop/teamusic/statistics/household_power_consumption.txt", header=TRUE, sep=";")
View(household_power_consumption)
#let's change form on time/date
library(dplyr)
hpc <- mutate(household_power_consumption,Date.Time=paste(household_power_consumption$Date,household_power_consumption$Time)) 
hpc
head(hpc)

data$Date.Time <- strptime(data$Date.Time,"%d/%m/%Y %T")
strptime(household_power_consumption$Time, "%H:%M:%S")
as.Date(household_power_consumption$Date, "%y/%m/%d")
#OR strptime(paste(household_power_consumption$Date, household_power_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
#now let's choose the wanted dates
hpc<-subset(hpc, hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
hpc
head(hpc)
#let's create our first plot
gap<- select(hpc,Date.Time,Global_active_power:Sub_metering_3,-Date,-Time) 
gap<-gap$Global_active_power
class(gap)
gap<-as.numeric(as.character(gap))
#error but useful for other timegap<-as.numeric(as.character(sub("," , ".",gap)))
class(gap)
gap
summary(gap)
plot1<-hist(gap, col="red", main= "Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", xlim=c(0,6), ylim=c(0,1200))
#now let's create our png and remember to dev.off
dev.copy(png,"Plot1")
dev.off()
