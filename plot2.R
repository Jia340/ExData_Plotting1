#Read data
household_power_consumption_subset <- read.csv("household_power_consumption_subset.txt", sep=";")
#Convert the data and time string to POSIX format
formated_d=strptime(paste(household_power_consumption_subset$Date,household_power_consumption_subset$Time),format="%d/%m/%Y %H:%M:%S")
dw=format(formated_d,"%a")
#Plot the figure
png(filename = "plot2.png",width = 480, height = 480)
plot(household_power_consumption_subset$Global_active_power,type="n",xaxt='n', xlab="", ylab="Global Active Power (kilowatts)")
lines(household_power_consumption_subset$Global_active_power,xlim=c(1,length(dw)+1))
axis(1,at=c(1,grep(unique(dw)[2],dw)[1],length(dw)+1),labels=c(unique(dw),format(formated_d[2880]+60,"%a")))
dev.off()