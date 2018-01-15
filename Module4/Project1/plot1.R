plot1 <- function()
{
  #read data
  data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F)
  
  # format date
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  # get subset of data
  subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  # plot histogram
  png("plot1.png", width = 480, height = 480)
  hist(as.numeric(subset$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}
