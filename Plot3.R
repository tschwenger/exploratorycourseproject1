#Plot 2

power1 <- read.csv("~/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec=".") #reads in the text file from the working directory as the symbol power
library(dplyr)
library(lubridate)
power <- power1[66637:69516,] #this is the subset to pull the data

powersubset <- power1[power1$Date %in% c("1/2/2007","2/2/2007"),] # this is equivalent of power above but subsets based on calling. The above means you have to load to the text. This is more efficient

# use strptime to format the dates correctly, this will merge date and time so that you can plot all the graphs
datetime <- strptime(paste(power$Date, power$Time, sep=""), "%d/%m/%Y %H:%M:%S")

sub1 <- as.numeric(power$Sub_metering_1, col.names = "sub1", na.rm = FALSE)
sub2 <- as.numeric(power$Sub_metering_2, col.names = "sub2", na.rm = FALSE)
sub3 <- as.numeric(power$Sub_metering_3, col.names = "sub3", na.rm = FALSE)

png("plot3.png", width=480, height=480)
plot(datetime, sub1, type = "l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type = "l", col="red")
lines(datetime, sub3, type = "l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off()