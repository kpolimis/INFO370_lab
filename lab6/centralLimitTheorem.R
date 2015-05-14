# Rohan Aras
# Lab 6
# 5/14/15
# This project demonstrates the central limit theorem on a uniform and poisson distribution. It
# divides each distribution into samples of 20 and takes the mean of each. It then provides a 
# histogram of these means

# Generates histogram of before and after the central limit theorem has been applied
# (distribution, string name of distribution)
clm <- function(initial_dist, type) {
  hist(initial_dist, breaks = 0:max(initial_dist), main = paste('Histogram of a', type))
  
  # list of 50 samples that comprised the original distribution vector
  x = split(initial_dist, ceiling(seq_along(initial_dist)/20))
  
  # the vector that will contain the means of each sample
  mean_dist = vector(mode = 'numeric', length = length(initial_dist)/20)
  
  # to keep track of place in mean_dist vector
  count = 1
  
  # calculates mean of each sample and puts it in mean_dist
  for (i in x) {
    mean_dist[count] = mean(i)
    count = count + 1
  }
  
  # generates second histogram
  hist(mean_dist, breaks = 50, main = paste('Central Limit Threorem', type), xlab = "sample means")
}

# number of elements in each distribution
size = 1000000

# generates Poisson Distribution
clm(rpois(size, 1), 'Poisson Distribution')

# generates Uniform Distribution (6 sided die)
clm(sample(6, size, replace=T), 'Uniform Distribution')
