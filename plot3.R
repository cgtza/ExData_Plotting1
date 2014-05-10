#This script reads a data file of electricity consumption from a local text file
#assuming
# 1) values are separated by a ";"
# 2) missing values are indicated by "?"
# 3) and the classes of variable read are Date, Time, 7xNumeric
# 4) the data file has been downloaded from the url to a local compressed file in the R pwd
#
hpower<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")  ##reads in data file
s_hpower<-subset(hpower,hpower$Date=="2/2/2007"|hpower$Date=="1/2/2007")
#
#
#Construct plot 3, which is a line plot of Sub-metering over two days in 2007, 
#and write it to a png file [480x480 pixels]
#
# Open the png device, draw the plot, close the device
#                  
png('plot3.png')
plot(datetime,s_hpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(datetime,s_hpower$Sub_metering_1,col="Black")
lines(datetime,s_hpower$Sub_metering_2,col="Red")
lines(datetime,s_hpower$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub-metering_2","Sub-metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(1,1,1))
dev.off()
#
