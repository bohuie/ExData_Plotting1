if( !exists( "data" ) )
{
  data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")  
  data$Date <- as.Date( data$Date, format="%d/%m/%Y" )
}

# subset the data to only read those in 2007-02-01 and 2007-02-02
sm1Data <- subset( data, Date == "2007-02-01" )
sm2Data <- subset( data, Date == "2007-02-02" )
smData <- merge( sm1Data, sm2Data, all=TRUE )

# create first plot
smData$Global_active_power <- as.numeric(as.character(smData$Global_active_power))
hist( smData$Global_active_power, 
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)",
  col="red",
  ylim=c(0,1200) )
