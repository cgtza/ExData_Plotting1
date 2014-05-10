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
#Construct plot 1, which is a histogram of Global Active Power, and write it to a png file [480x480 pixels]
#
png('plot1.png')
with(s_hpower, hist(Global_active_power,breaks=12,col="Red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency"))
dev.off()
#
#
