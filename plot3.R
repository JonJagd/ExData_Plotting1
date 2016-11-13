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

# Plot3 - Create the plot and save it to a png file

png("ExData_Plotting1/plot3.png", width = 480, height = 480, res = 72)

plot(powerconsumption$Datetime, powerconsumption$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(powerconsumption$Datetime, powerconsumption$Sub_metering_2, type = "l", col = "red")
lines(powerconsumption$Datetime, powerconsumption$Sub_metering_3, type = "l", col = "blue")

legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend
lty = 1, # gives the legend appropriate symbols (lines)
lwd = 1, col = c("black", "red", "blue")) # gives the legend lines the correct color and width

dev.off()