plot2 <- function()
{
  #read data
  data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F)
  
  # format date
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  # get subset of data
  subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

  # plot histogram
  png("plot2.png", width = 480, height = 480)
  plot(as.numeric(subset$Global_active_power), ylab="Global Active Power (kilowatts)", type="l", xaxt='n')
  axis(side=1, at= c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
  dev.off()
}
