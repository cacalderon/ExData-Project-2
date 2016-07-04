#Assume the directory is set and you have the zip file downloaded in this directory

#First we unzip the file

unzip('./exdata%2Fdata%2FNEI_data.zip')

#Second we get the data from the unzipped file

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('Plot1.png')
barplot(col=c("red"), height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions per Year'))
dev.off()
