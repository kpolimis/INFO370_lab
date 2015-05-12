# Rohan Aras
# Quiz 4.1
# 5/12/15
#
# This script simulates the probability of winning a lottery that requires
# to pick 6 numbers from 1-49 (1 and 49 are included). Winning is defined
# as getting three or more balls correct.
# The simulated result was slightly under .02

# simulates the scenario n times
simulation <- function(n) {
  # stores the number of balls successful each trial
  success = vector(mode='numeric', length=n)
  
  # for debugging
  success_type= vector(mode='numeric', length=6)
  
  # the number of times success[i] > 3 this sim
  win = 0
  
  # the frequency at which there has been a win
  frequency = vector(mode='numeric', length=n)
  
  for (i in 1:n) {
    
    # the balls chosen
    s = sample(1:49, 6, replace=F)
    
    # the number of balls that are correct
    number_correct = 0
    
    for (j in 1:6) {
      # correct is an arbitrary set of 6 numbers
      if (s[j] < 7 && s[j] > 0)
        number_correct = number_correct + 1
    }
    
    # debug
    if (number_correct > 0)
      success_type[number_correct] = success_type[number_correct] + 1
    
    # modify variables based on result
    if (number_correct >= 3)
      win = win + 1
    success[i] = number_correct
    frequency[i] = win / i
  }
  hist(success, breaks=c(0,1,2,3,4,5,6), xlab='number of balls correct', 
       main=paste(n, 'attempts'))
  plot(frequency, type='l', ylab='win frequency', 
       xlab='number of attempts', main=paste(n, 'attempts'))

  return(success_type)
}

# creates a document with the histograms and frequency plots 
# where n = 100, 1000, 10000, 100000
par(mfrow = c(4, 2))
success_type1 = simulation(100)
success_type1 = simulation(1000)
success_type1 = simulation(10000)
success_type1 = simulation(100000)

