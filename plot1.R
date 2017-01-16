#Read data
household_power_consumption_subset <- read.csv("household_power_consumption_subset.txt", sep=";")
#Plot the figure
png(filename = "plot1.png",width = 480, height = 480)
hist(household_power_consumption_subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()