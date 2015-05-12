# Rohan Aras
# Lab 4
# 5/7/15
# graphs the frequency of generating heads vs the total number of tosses
# I learned that for loops require brackets in R. I also learned that RStudio doesn't have the 
# nicest of debug tools. Generally, I improved my knowledge of syntax in R.


# simulate the coin tosses
experiment1 = sample(0:1, 10, replace=T)
experiment2 = sample(0:1, 100, replace=T)
experiment3 = sample(0:1, 1000, replace=T)
experiment4 = sample(0:1, 10000, replace=T)

par(mfrow=c(2,2))

# plot experiment 1 
total_heads = 0
frequency1 = vector(mode='numeric', length=10)
for (i in 1:10) {
  total_heads = total_heads + experiment1[i]
  frequency1[i] = total_heads / i 
}
plot(frequency1, ylim=0:1, type='l', col='yellow', ylab='frequency', xlab='number of tosses', main='10 tosses')

# plot experiment 2 
total_heads = 0
frequency2 = vector(mode='numeric', length=100)
for (i in 1:100) {
  total_heads = total_heads + experiment2[i]
  frequency2[i] = total_heads / i 
}
plot(frequency2, ylim=0:1, type='l', col='green', ylab='frequency', xlab='number of tosses', main='100 tosses')

# plot experiment 3 
total_heads = 0
frequency3 = vector(mode='numeric', length=1000)
for (i in 1:1000) {
  total_heads = total_heads + experiment3[i]
  frequency3[i] = total_heads / i 
}
plot(frequency3, ylim=0:1, type='l', col='blue', ylab='frequency', xlab='number of tosses', main='1000 tosses')

# plot experiment 4 
total_heads = 0
frequency4 = vector(mode='numeric', length=10000)
for (i in 1:10000) {
  total_heads = total_heads + experiment4[i]
  frequency4[i] = total_heads / i 
}
plot(frequency4, ylim=0:1, type='l', col='red', ylab='frequency', xlab='number of tosses', main='10000 tosses')




