## Import to adjust date values
library(lubridate)

## Adjust settings to avoid scientific notation
options(scipen=5)


## Read dataframe
setwd("./02. Courses/Coursera_DataScience/04. Exploratory Data Analysis/project_week1/")
df = read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

## Filter dataframe
df = subset(df, Date == "1/2/2007" | Date == "2/2/2007" )

## Adjust columns types
df$Global_active_power <- as.numeric(df$Global_active_power)
df$DateTime <- dmy_hms(paste(df$Date, df$Time))
df$Date <- dmy(df$Date)
 
#png("./plot2.png", width=480, height=480)

## Plot
with(df, plot(DateTime, Global_active_power, type = "l"))
#plot(df$Global_active_power , col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close file
dev.off()
