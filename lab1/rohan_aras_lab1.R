# Lab 1
# Rohan Aras
# 4/9/15

# Notes: Calculates the mean and variance of the temperature of various cities contained in pollution.csv. Also produces a histogram of the wind speeds in the same cities. 

# import csv file
pollution <- read.csv("pollution.csv")

# grab temperature data
temperature <- pollution$TEMP

# calculate the mean of temperature (mean = 55.8)
mean(temperature)

# calculate varience of temperature (variance = 52.2)
var(temperature)

# grab the wind data
wind <- pollution$WIND

# plot a histogram of wind
hist(wind)