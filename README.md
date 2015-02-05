# exploratorycourseproject1
Coursera Exploratory Data Analysis Course Project 1

I guess I'll walk you through this repository. These plots reflect their respective scripts and solve the problems for the coursera Exploratory data analysis course project 1
Each file represents the corresponding plots for the project, but I will take the grader through the process of completing the project
and outline what each file represents. If you want a detailed outline of the project please visit the following repository I forked:
https://github.com/tschwenger/ExData_Plotting1

# Major pain points in the assignment
There are two aspects of this project that can cause the student a headache if they don't know what to do. The plotting part is relatively straightforward
Key problem: subsetting the right data. There are two ways to do get the correct subset of data after loading the file:
  1. call the vector containing the by the subset as follows:
    powersubset <- power1[power1$Date %in% c("1/2/2007","2/2/2007"),] 
    I made up the vector name to powersubset but this pulls all the rows in the date range
  2. Call the subset based on the rows after loading the data into an excel file (note this would not work if the date
      were later in the data set, because the dataframe had over 200K lines)
    power <- power1[66637:69516,]
    
Key problem 2:
  2. Using the strptime function to get the data merged the date and time into one column. If you don't do this the graphs
    will looked fucked up. 
    datetime <- strptime(paste(power$Date, power$Time, sep=""), "%d/%m/%Y %H:%M:%S")
    With this new function you're able to plot everything based on time. The / above are critical, because if they are not
    included you will get NA values and your plots will be crap. 
    
Key issue
  The strptime will change the datetime variables into the proper class. However make sure you change all the other vectors
    to numeric vectors or else you can forget about getting any plots. For example:
      sub2 <- as.numeric(power$Sub_metering_2, col.names = "sub2", na.rm = FALSE) 
      This changes the sub_metering_2 column into the proper class

That's pretty much it. 
The repository has all the necessary plots. Check out the code! It's solid!
Enjoy!
      
      
    
  
  
  
  
