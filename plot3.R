
library(lubridate)
library(dplyr)


# import data to dataframe hpc
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# using package lubridate for dates
hpc$new_date_col <- paste(hpc$Date, hpc$Time, sep = " ")
hpc$datetime <- dmy_hms(hpc$new_date_col)
hpc$date <- date(hpc$datetime)

# filter dates 2007-02-01 and 2007-02-02
hpc <- hpc %>% filter(date >= ("2007-02-01") & date <= ("2007-02-02"))

#changing factors to numerics
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))

# plot 3
png("plot3.png")
plot(hpc$datetime, hpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc$datetime, hpc$Sub_metering_2, col="red")
lines(hpc$datetime, hpc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1))
dev.off()
