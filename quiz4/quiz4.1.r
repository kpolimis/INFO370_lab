# Rohan Aras
# Quiz 4.1
# 5/12/15
#
# This script determines the probability of having at least 3 girls in a family
# of 5 siblings. It simulates the results and provides figures.
# The approximate answer is 0.5. The exact answer was also 0.5
# This script also provides a histogram for probabilities of all scenarios

# clean variables
rm(list=ls(all=TRUE))

# Simulates the probability of having g girls in a set of 5 children
at_least <- function(g) {
  
  # number of experiments where we pull 5 people from the population
  experiments <- c(10,100,1000,10000)
  
  # multiple plots
  par(mfrow = c(4, 2), oma=c(0,0,2,0))
  
  for (j in 1:4) {
    # number of experiments where we pull 5 people from the population
    n = experiments[j]
    
    # vector for storing frequency
    frequency <- mat.or.vec(n,1)
    
    # total number of girls
    tails = 0
    
    # vector for storing successes
    success = vector(mode='numeric', length=n)
    
    # pull five people from the population and see how many are girls
    for (i in 1:n) {
      # toss a coin 5 times, see how many times sum is greater than g
      success[i] = sum(rbinom(5, 1, 0.5))
      if (success[i] >= g) {
        tails = tails + 1
      } 
      frequency[i] = tails / i
    }
    
    hist(success, breaks=c(0,1,2,3,4,5), xlab='number of girls', 
         main=paste(n, 'attempts'))
    plot(frequency, ylim=0:1, type="l", xlab="number of tosses", 
         ylab="relative frequency of tails", main=paste(n, 'attempts'))
  }
  title(paste(g, 'minimum girls'), outer=TRUE)
}

# Simulations for g = 3
at_least(3)

## Part B ## 
par(mfrow = c(1,1))
actual_prob <- function(g) {
  sum = 0
  for (i in g:5) {
    sum = sum + dbinom(i, size=5, prob=0.5)
  }
  return(sum)
}

all_prob = c(actual_prob(0), actual_prob(1), actual_prob(2), actual_prob(3), actual_prob(4), actual_prob(5))

hist(all_prob, xlab='Probability of a certain number of girls being in a family')
