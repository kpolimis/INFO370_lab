# number of dice rolls 
d = 1000

# roll two dice 10 times
dice1 = sample(6, d, replace = TRUE)
dice2 = sample(6, d, replace = TRUE)

dice_roll = dice1 + dice2

hist(dice_roll)
hist(dice_roll, freq = FALSE)
# note that the histogram function does not plot the probablility distribution

prob_plot = hist(dice_roll, breaks = 100, plot = FALSE)
prob_plot$counts = prob_plot$counts / sum(prob_plot$counts)
plot(prob_plot)

prob_plot$counts[50]