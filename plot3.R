## Exploratory Data Analysis - Course Project 1
## Electric Power Consumption Plot Exercise
## Environment specs for this experiment:
## platform       x86_64-apple-darwin10.8.0   
## arch           x86_64                      
## os             darwin10.8.0                
## system         x86_64, darwin10.8.0        
## status                                     
## major          3                           
## minor          1.0                         
## year           2014                        
## month          04                          
## day            10                          
## svn rev        65387                       
## language       R                           
## version.string R version 3.1.0 (2014-04-10)
## nickname       Spring Dance
## RStudio 0.98.953

## Download (with "curl" as it was done in a Mac)
TempZip <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",TempZip,method="curl")

## Records the date it was downloaded
DownloadDate <- date()

## Unzips the file to temporary file 
TempFileName = unzip(TempZip, list=TRUE)$Name[1] ## simple routine to find the first (or only) file in the ZIP container
TempFile <- tempfile() ## will hold the unziped file temporarily
TempDFrame <- data.frame(read.csv(unzip(TempZip, files=TempFileName, overwrite=TRUE), sep=";", header=TRUE)) ## unzipping and creating a data frame ## unzipping and creating a data frame

## Subset the temporary file
InitialDate <- "1/2/2007"
EndDate <- "2/2/2007"
SubsetDFrame <- subset(TempDFrame, Date==InitialDate|Date==EndDate)
for (NumCol in 3:9) ## Put columns in numeric format as it will be needed for plots
{
  SubsetDFrame[,NumCol]=as.numeric(as.character(SubsetDFrame[,NumCol]))
}

## Cleaning
TempFileName <- NULL ## cleaning
unlink(TempFile) ## cleaning
TempDFrame <- NULL

## Plot 3
png("plot3.png", bng="white")
plot(SubsetDFrame$Time, SubsetDFrame$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(SubsetDFrame$Time, SubsetDFrame$Sub_metering_2, col="red")
lines(SubsetDFrame$Time, SubsetDFrame$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
dev.off()