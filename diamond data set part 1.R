#install ggplot2 package
install.packages(ggplot2)

#load the diamonds data set
library(ggplot2)
data(diamonds)

summary(diamonds)

#How many observtions are in diamonds data set?
# 53,940 observations
#How many variables are in the diamonds data set?
#10 variables

?diamonds

diamonds$color

#What letter represents the best color for a diamond?
#D


str(diamonds)

#Create a histogram of the price of all diamonds in the diamond data set
qplot(x = price, data = diamonds)

#What is the mean and medican of price in diamonds data set
mean(diamonds$price)
median(diamonds$price)

#mean is 3932.8 and median is 2401

 #cost of diamonds less that 500
under_500<- diamonds$price [diamonds$price < 500]
str(under_500)
length(under_500)

#cost of diamonds under 250
under_250<- diamonds$priceb[diamonds$price < 250]
length(under_250)

#cost of diamonds >= to 15000
greater_15000<- diamonds$price [diamonds$price >= 15000]
length(greater_15000)

#exploring the highest peak of price in histogram
qplot(x = price, data = na.omit(diamonds), binwidth = 30, 
)+
  scale_x_continuous(limits = c(250, 1000), breaks = seq(0, 1000, 50))
  

#break out histogram of diamond prices by cut
install.packages('gridExtra')
library(gridExtra)

qplot(x = cut, y = price, data = diamonds, geom = "boxplot")
qplot(x = price, data = diamonds) + facet_wrap(~cut)
  


#using facet_wrap have y axi different for each histogram
qplot(x = price, data = diamonds) + facet_grid(~cut, scales = 'free', space = 'free')

#histogram price per carat facet by cut
qplot(x = carat, y =price, data = diamonds)+
  facet_wrap(~cut)

#Adjust bin width and use log10 for x-axis
qplot(x = carat/price, data = diamonds, binwidth = 100)+
  facet_wrap(~cut)+
  scale_x_log10()


#investigate the price of diamonds using boxplots
#variables to use: cut, clarity or color
P1<- qplot(x = cut/price, data = diamonds, geom = 'boxplot', color = 'orange')
P2<- qplot(x = clarity, data = diamonds, color = 'blue')
P3<- qplot(x = color, data = diamonds)
grid.arrange(P1, P2, P3)


#1st and 3rd quartile for different colors
qplot(x = color, y = price, data = diamonds, fill = color, geom = 'boxplot')+
  coord_cartesian(ylim = c(0,8000)) 
by(diamonds$price, diamonds$color,summary)


#IQR for diamonds with best and worst color
IQR(subset(diamonds, color = D)$color)
IQR(subset(diamonds, color = J)$color)

#The price per carat across the different colors of diamonds using bloxplot
qplot(x = color, y = price/carat, data = diamonds, fill = color, geom = 'boxplot')+
  coord_cartesian(ylim = c(0, 8000))

#Investigate the weight of the diamonds using a grequency polygon
qplot(x = carat, data = diamonds, binwidth = 0.01, geom = 'freqpoly')+
scale_x_continuous(limits = c(0, 5), breaks = seq(0, 5, 0.2))









     




 



