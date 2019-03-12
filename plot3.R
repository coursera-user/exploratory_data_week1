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
 
png("./plot3.png", width=480, height=480)

## Plot
with(df, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(df, lines(DateTime, Sub_metering_2, col = "red"))
with(df, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=2)

## Close file
dev.off()
