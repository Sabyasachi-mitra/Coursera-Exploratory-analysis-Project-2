setwd("e://my learning/coursera/Exploratory analysis/week 4")
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
dir()
head(NEI)
head(SCC)
Baltimore <- subset(NEI, subset=(fips=="24510"))
LA <- subset(NEI, subset=(fips=="06037"))
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor_Baltimore <- Baltimore[Baltimore$SCC %in% motor$SCC, ]
motor_LA <- LA[LA$SCC %in% motor$SCC, ]
vehicle_Baltimore <- aggregate(motor_Baltimore$Emissions, list(motor_Baltimore$year), sum)
vehicle_LA <- aggregate(motor_LA$Emissions, list(motor_LA$year), sum)
png("plot6.png", 480, 480, "px")
par(mfrow = c(2,1),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(vehicle_Baltimore, type = "l", xlab = "Year", main = "Baltimore",
     ylab= expression('Total PM'[2.5]*" emissions"), col = "red")
plot(vehicle_LA, type = "l", xlab = "Year", main = "Los Angels",
     ylab= expression('Total PM'[2.5]*" emissions"), col = "red")
mtext("Comparisons of emissions by motor vehicles", outer = TRUE)
dev.off()