####   Quiz 4  #####

#  1.  Repeat the exercise above but with a small variant.
#      Determine the probability of having at least 3 girls in a family of 5 siblings.  
#   (a)  Simulate the result and provide figures.  
#   (b)  Provide a histogram of probabilities for all scenarios 
#        (at least 0, 1, 2, 3, 4 and 5 girls in a family of five siblings).

# clean variables
rm(list=ls(all=TRUE))

# Simulates the probability of having g girls in a set of 5 children
at_least <- function(g) {
  
  # number of experiments where we pull 5 people from the population
  experiments <- c(10,100,1000,10000)
  
  # multiple plots
  par(mfrow = c(2, 2))
  
  for (j in 1:4) {
    # number of experiments where we pull 5 people from the population
    n = experiments[j]
    
    # vector for storing successes
    success <- mat.or.vec(n,1)
    
    # total number of girls
    tails = 0
    
    # pull five people from the population and see how many are girls
    for (i in 1:n) {
      # toss a coin 5 times, see how many times sum is greater than 3
      if (sum(rbinom(5,1,0.5)) >= g) {
        tails = tails + 1
      } 
      success[i] = tails/i
    }
    
    plot(success,ylim=c(0,1),type="l",xlab="number of tosses",ylab="relative frequency of tails")
    
  }
}

# Simulations for g = 1, 2, 3, 4, 5
at_least(1)
at_least(2)
at_least(3)
at_least(4)
at_least(5)


# quick formula for getting the same number
# dbinom(3, size=5, prob=0.5)
# answer: 0.3125 is the probability of having at least 3 girls in a family of 5 siblings 
actual_prob <- function(g) {
  dbinom(g, size=5, prob=0.5)
}

all_prob = c(actual_prob(0), actual_prob(1), actual_prob(2), actual_prob(3), actual_prob(4), actual_prob(5))

hist(all_prob)
 