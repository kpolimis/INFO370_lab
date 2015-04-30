data = read.csv('info370heightdata.csv')

# create frequency distrubution
hist(data$Group.A, main = "Frequency Dist of A", xlab = "height")
hist(data$Group.B, main = "Frequency Dist of B", xlab = "height")

# create probability distribution for a
group_a = data$Group.A
count_a = length(group_a)
probability_a = data$Group.A / count_a
barplot(probability_a)

# create probability distribution for b
group_b = data$Group.B
count_b = length(group_b)
probability_b = data$Group.B / count_b
barplot(probability_b)