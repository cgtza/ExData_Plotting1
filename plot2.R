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
#Construct plot 2, which is a line plot of Global Active Power over two dates, 
#and write it to a png file [480x480 pixels]
#
# First convert the variables Date and Time to a date-time combination with function strptime
#
datetime<-paste(s_hpower$Date,s_hpower$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
#
# Then open the png device, draw the plot, close the device
#                  
png('plot2.png')
plot(datetime,s_hpower$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(datetime,s_hpower$Global_active_power)
dev.off()
#
