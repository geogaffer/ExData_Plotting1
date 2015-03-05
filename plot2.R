#
#  Generate Plot 2 assigned in EDA Project 1
#
#  Data is read from household_power_consuption.txt which is assumed to be
#  available in the working directory.  A subset of the data is made for 
#  1 - 2 February 2007, and the date and time fields cast into POSIXlt and
#  stored back in the Date variable.
#
#  By default, the function will create a 480x480 PNG file named plot2.png.
#  When the parameter preview is set to TRUE then no PNG file is created and
#  the graphic is displayed on the default screen device.  Useful to check if a plot
#  will look correct before making the PNG file.

plot2 <- function(preview=FALSE) {
    
    lineDef <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric")
    hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                    colClasses = lineDef, stringsAsFactors=FALSE)
    hpc2Days <- subset(hpc, (Date=="1/2/2007")|(Date=="2/2/2007"))
    
    hpc2Days$Date <- strptime(paste(hpc2Days$Date,hpc2Days$Time), "%d/%m/%Y %H:%M:%S")

    if (!preview) png("plot2.png", width=480, height=480)

    # construct a basic line plot
    
    with(hpc2Days, 
         plot(Date, Global_active_power, type="l", xlab="", 
              ylab="Global Active Power (kilowatts)")
    )

    if (!preview) dev.off()
}

