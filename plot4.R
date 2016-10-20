setwd("e://my learning/coursera/Exploratory analysis/week 4")
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
dir()
head(NEI)
head(SCC)
coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]
coal_Emi <- aggregate(coal$Emissions, list(coal$year), sum)
png("plot4.png", 480, 480, "px")
plot(coal_Emi, type = "l", xlab = "Year", main = "Total emissions from coal combustion related sources\n from 1999 to 2008",
     ylab= expression('Total PM'[2.5]*" emissions"), col = "red")
dev.off()

