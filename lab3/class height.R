data = read.csv('info370heightdata.csv')

# create frequency distrubution
hist(data$Group.A, main = "Frequency Dist of A", xlab = "height")
hist(data$Group.B, main = "Frequency Dist of B", xlab = "height")