#
#  Generate Plot 4 assigned in EDA Project 1
#
#  Data is read from household_power_consuption.txt which is assumed to be
#  available in the working directory.  A subset of the data is made for 
#  1 - 2 February 2007, and the date and time fields cast into POSIXlt and
#  stored back in the Date variable.
#
#  By default, the function will create a 480x480 PNG file named plot4.png.
#  When the parameter preview is set to TRUE then no PNG file is created and
#  the graphic is displayed on the default screen device.  Useful to check if a plot
#  will look correct before making the PNG file.

plot4 <- function(preview=FALSE) {
    
    lineDef <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric")
    hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                    colClasses = lineDef, stringsAsFactors=FALSE)
    hpc2Days <- subset(hpc, (Date=="1/2/2007")|(Date=="2/2/2007"))
    
    hpc2Days$Date <- strptime(paste(hpc2Days$Date,hpc2Days$Time), "%d/%m/%Y %H:%M:%S")

    if (!preview) png("plot4.png", width=480, height=480)

    par(mfrow=c(2,2))  # set up for 2 rows and 2 columns of plots on page
                       # plots will load by row from left to right

# plot 1 - top left position

     plot(hpc2Days$Date, hpc2Days$Global_active_power, type="l", xlab="", 
          ylab="Global Active Power")

# plot 2 - top right position

    plot(hpc2Days$Date, hpc2Days$Voltage, type="l", xlab="datetime", 
            ylab="Voltage")

# plot 3 - bottom left position
 
    plot(x=hpc2Days$Date, y=hpc2Days$Sub_metering_1, type="l", xlab="", 
          ylab="Energy sub metering")
    lines(hpc2Days$Date, hpc2Days$Sub_metering_2, col="red")
    lines(hpc2Days$Date, hpc2Days$Sub_metering_3, col="blue")

    legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n",
           lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))

# plot 4 - bottom right position

    plot(hpc2Days$Date, hpc2Days$Global_reactive_power, type="l", xlab="datetime", 
         ylab="Global_reactive_power")

    if (!preview) dev.off()
}

