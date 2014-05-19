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
smData$times <- as.POSIXct( x ) # strptime(x, "%m-%d-%y %H:%M:%S")


# add another column for weekdays
# smData$wday <- weekdays( smData$Date )

# create second plot
smData$Global_active_power <- as.numeric(as.character(smData$Global_active_power))
plot(smData$times, smData$Global_active_power, type="n", main="", ylab="Global Active Power (kilowatts)", xlab="" ) 
lines( smData$times, smData$Global_active_power )