#Assume the directory is set and you have the zip file downloaded in this directory

#First we unzip the file

unzip('./exdata%2Fdata%2FNEI_data.zip')

#Second we get the data from the unzipped file

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions, fill='red'))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
