## Import to adjust date values
library(lubridate)
library(ggplot2)

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
 
png("./plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar = c(4, 4, 4, 4), omi=c(0.5,0.3,0,0))

## Plot topleft
with(df, plot(DateTime, Global_active_power, type = "l", xlab ="", ylab = "Global Active Power"))

# Plot topright
with(df, plot(DateTime, Voltage, type = "l", xlab ="datetime", ylab = "Voltage"))

# Plot bottomleft
with(df, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(df, lines(DateTime, Sub_metering_2, col = "red"))
with(df, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex = 0.6)

# Plot bottomleft
with(df, plot(DateTime, Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power"))


## Close file
dev.off()
