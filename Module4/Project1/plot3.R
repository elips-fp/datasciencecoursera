plot3 <- function()
{
  #read data
  data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F)
  
  # format date
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  # get subset of data
  subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  # plot histogram
  png("plot3.png", width = 480, height = 480)
  plot(as.numeric(subset$Sub_metering_1), ylab="Energy sub metering", xlab="", type="l", xaxt='n')
  lines(as.numeric(subset$Sub_metering_2), col='red')
  lines(as.numeric(subset$Sub_metering_3), col='blue')
  axis(side=1, at= c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  dev.off()
}
