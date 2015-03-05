#
#  Generate Plot 1 assigned in EDA Project 1
#
#  Data is read from household_power_consuption.txt which is assumed to be
#  available in the working directory.  A subset of the data is made for 
#  1 - 2 February 2007, and the date and time fields cast into POSIXlt and
#  stored back in the Date variable.
#
#  By default, the function will create a 480x480 PNG file named plot3.png.
#  When the parameter preview is set to TRUE then no PNG file is created and
#  the graphic is displayed on the default screen device.  Useful to check if a plot
#  will look correct before making the PNG file.

plot3 <- function(preview=FALSE) {
    
    lineDef <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric")
    hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                    colClasses = lineDef, stringsAsFactors=FALSE)
    hpc2Days <- subset(hpc, (Date=="1/2/2007")|(Date=="2/2/2007"))
    
    hpc2Days$Date <- strptime(paste(hpc2Days$Date,hpc2Days$Time), "%d/%m/%Y %H:%M:%S")

    if (!preview) png("plot3.png", width=480, height=480)

    # construct and plot with multiples lines in different colours.
    # include a legend with the plot, top right corner.
    
    plot(x=hpc2Days$Date, y=hpc2Days$Sub_metering_1, type="l", xlab="", 
          ylab="Energy sub metering")
    lines(hpc2Days$Date, hpc2Days$Sub_metering_2, col="red")
    lines(hpc2Days$Date, hpc2Days$Sub_metering_3, col="blue")

    legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))

    if (!preview) dev.off()
}

