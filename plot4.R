#Read data
household_power_consumption_subset <- read.csv("household_power_consumption_subset.txt", sep=";")
#Convert the date and time strings to POSIX format
formated_d=strptime(paste(household_power_consumption_subset$Date,household_power_consumption_subset$Time),format="%d/%m/%Y %H:%M:%S")
dw=format(formated_d,"%a")
#Plot the figure
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
##plot1
plot(household_power_consumption_subset$Global_active_power,type="n",xaxt='n', xlab="", ylab="Global Active Power")
lines(household_power_consumption_subset$Global_active_power,xlim=c(1,length(dw)+1))
axis(1,at=c(1,grep(unique(dw)[2],dw)[1],length(dw)+1),labels=c(unique(dw),format(formated_d[2880]+60,"%a")))
##plot2
plot(household_power_consumption_subset$Voltage,type="n",xaxt='n', xlab="datetime", ylab="Voltage")
lines(household_power_consumption_subset$Voltage,xlim=c(1,length(dw)+1))
axis(1,at=c(1,grep(unique(dw)[2],dw)[1],length(dw)+1),labels=c(unique(dw),format(formated_d[2880]+60,"%a")))
##plot3
plot(household_power_consumption_subset$Sub_metering_1,type="n",xaxt='n', xlab="", ylab="Energy sub metering")
lines(household_power_consumption_subset$Sub_metering_1,xlim=c(1,length(dw)+1),col="black")
lines(household_power_consumption_subset$Sub_metering_2,xlim=c(1,length(dw)+1),col="red")
lines(household_power_consumption_subset$Sub_metering_3,xlim=c(1,length(dw)+1),col="blue")
axis(1,at=c(1,grep(unique(dw)[2],dw)[1],length(dw)+1),labels=c(unique(dw),format(formated_d[2880]+60,"%a")))
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
##plot4
plot(household_power_consumption_subset$Global_reactive_power,type="n",xaxt='n', xlab="datetime", ylab="Global_reactive_power")
lines(household_power_consumption_subset$Global_reactive_power,xlim=c(1,length(dw)+1))
axis(1,at=c(1,grep(unique(dw)[2],dw)[1],length(dw)+1),labels=c(unique(dw),format(formated_d[2880]+60,"%a")))
dev.off()