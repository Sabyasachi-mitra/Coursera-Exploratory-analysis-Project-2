setwd("e://my learning/coursera/Exploratory analysis/week 4")
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
dir()
head(NEI)
head(SCC)
Baltimore <- subset(NEI, subset=(fips=="24510"))
head(Baltimore)
Emi <- aggregate(Baltimore$Emissions, list(Baltimore$year), sum)
png("plot2.png", 480, 480, "px")
plot(Emi, type = "l", xlab = "Year", main = "Baltimore city, Maryland PM2.5 total emissions",
     ylab= expression('Total PM'[2.5]*" emissions"), col = "red")
dev.off()

