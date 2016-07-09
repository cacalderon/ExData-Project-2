#Assume the directory is set and you have the zip file downloaded in this directory

#First we unzip the file

unzip('./exdata%2Fdata%2FNEI_data.zip')

#Second we get the data from the unzipped file

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Searching for ON-ROAD type in NEI
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("Plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions, fill = 'red'))
g <- g + geom_bar(stat="identity") + 
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from ROAD motor vehicle in Baltimore City (fips = "24510") from 1999 to 2008')
print(g)
dev.off()