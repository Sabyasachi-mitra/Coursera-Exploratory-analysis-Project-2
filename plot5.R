setwd("e://my learning/coursera/Exploratory analysis/week 4")
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
dir()
head(NEI)
head(SCC)
Baltimore <- subset(NEI, subset=(fips=="24510"))
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor <- Baltimore[Baltimore$SCC %in% motor$SCC, ]
vehicle_Emi <- aggregate(motor$Emissions, list(motor$year), sum)
png("plot5.png", 480, 480, "px")
plot(vehicle_Emi, type = "l", xlab = "Year", main = "Total emissions from motor vehicles related sources\n from 1999 to 2008",
     ylab= expression('Tons of PM'[2.5]*" emissions"), col = "red")
dev.off()

