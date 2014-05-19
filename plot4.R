if( !exists( "data" ) )
{
  data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")  
  data$Date <- as.Date( data$Date, format="%d/%m/%Y" )
}

# subset the data to only read those in 2007-02-01 and 2007-02-02
sm1Data <- subset( data, Date == "2007-02-01" )
sm2Data <- subset( data, Date == "2007-02-02" )
smData <- merge( sm1Data, sm2Data, all=TRUE )

# convert times to decimal
x <- paste( smData$Date, smData$Time )
smData$times <- as.POSIXct( x )

# create 2x2 panels
par( mfrow=c(2,2) )

# create first plot
smData$Global_active_power <- as.numeric(as.character(smData$Global_active_power))
plot(smData$times, smData$Global_active_power, type="n", main="", ylab="Global Active Power (kilowatts)", xlab="" ) 
lines( smData$times, smData$Global_active_power )

# create second plot -- NO IDEA WHAT THIS SHOULD BE
smData$Voltage <- as.numeric(as.character(smData$Voltage))
plot(smData$times, smData$Voltage, type="n", main="", ylab="Voltage", xlab="datetime" ) 
lines( smData$times, smData$Global_active_power )

# create third plot
smData$Sub_metering_1 <- as.numeric(as.character(smData$Sub_metering_1))
smData$Sub_metering_2 <- as.numeric(as.character(smData$Sub_metering_2))
smData$Sub_metering_3 <- as.numeric(as.character(smData$Sub_metering_3))
plot(smData$times, smData$Sub_metering_1, type="n", main="", ylab="Energy sub metering", xlab="" ) 
lines( smData$times, smData$Sub_metering_1, col="black" )
lines( smData$times, smData$Sub_metering_2, col="red" )
lines( smData$times, smData$Sub_metering_3, col="blue" )
legend( "topright", 
  lty=c(1,1),
  col=c( "black", "red", "blue" ),
  c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

# create fourth plot -- NO IDEA WHAT THIS SHOULD BE
smData$Global_active_power <- as.numeric(as.character(smData$Global_active_power))
plot(smData$times, smData$Global_active_power, type="n", main="", ylab="Global Active Power", xlab="datetime" ) 
lines( smData$times, smData$Global_active_power )
