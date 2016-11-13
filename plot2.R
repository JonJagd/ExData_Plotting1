## Set the working directory
setwd('C:/Git/R/ExploratoryDataAnalysis/CourseProject1')

## Set the locale to english in order to produce an x-axis with english week days
Sys.setlocale(category = "LC_ALL", locale = "english")

## Read only the relevant lines from the data file into our data frame using sqldf
##install.packages("sqldf")
library(sqldf)
powerconsumption <- read.csv.sql("data/household_power_consumption.csv", 
    sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";", eol = "\n")

## Create a datetime column
dates <- powerconsumption$Date
times <- powerconsumption$Time
datetime <- paste(dates, times)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

powerconsumption$Datetime <- datetime


# Plot2 - Create the plot and save it to a png file

png("ExData_Plotting1/plot2.png", width = 480, height = 480, res = 72)

plot(powerconsumption$Datetime, powerconsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()