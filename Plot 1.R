#Project 1

power1 <- read.csv("~/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE) #reads in the text file from the working directory as the symbol power
library(dplyr)
library(lubridate)
power <- power1[66637:69516,] #this is the subset to pull the data

activepower <- as.numeric(power$Global_active_power, col.names= "activepower", na.rm = FALSE)


png("plot1.png", width=480, height=480)
hist(activepower, col = "red", xlab="Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()
