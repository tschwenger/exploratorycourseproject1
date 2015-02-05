#Plot 2

power1 <- read.csv("~/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec=".") #reads in the text file from the working directory as the symbol power
library(dplyr)
library(lubridate)
power <- power1[66637:69516,] #this is the subset to pull the data

powersubset <- power1[power1$Date %in% c("1/2/2007","2/2/2007"),] # this is equivalent of power above but subsets based on calling. The above means you have to load to the text. This is more efficient

# use strptime to format the dates correctly, this will merge date and time so that you can plot all the graphs
datetime <- strptime(paste(power$Date, power$Time, sep=""), "%d/%m/%Y %H:%M:%S")



activepower <- as.numeric(power$Global_active_power, col.names= "activepower", na.rm = FALSE)


png("plot2.png", width=480, height=480)
plot(datetime, activepower, type = "l", ylab= "Global Active Power (kilowatts)")
dev.off()
