## Set the working directory
setwd('C:/Git/R/ExploratoryDataAnalysis/CourseProject1')

## Read only the relevant lines from the data file into our data frame using sqldf
##install.packages("sqldf")
library(sqldf)
powerconsumption <- read.csv.sql("data/household_power_consumption.csv", 
    sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";", eol = "\n")

# Plot1 - Create the plot and save it to a png file

png("ExData_Plotting1/plot1.png", width = 480, height = 480, res = 72)

hist(powerconsumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
