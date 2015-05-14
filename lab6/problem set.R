## Question 2 ##
scores = c(90,95,89,71,73,96,87,95,107,89,96,80,97,95,102,97,93,101,82,83,74,91,83,98,95,111,99,120,93,84)

# a)
m = mean(scores) # 92.2

# b) This is the mean of a small sample so it's likely not equal to the population parameter 

# c)
se = sd(scores) / sqrt(length(scores)) # 1.9765
  
# d) The spread of sampling distribution of the sample mean

# e)
m - 2 * se # lower bound of confidence interval: 88.2469
m + 2 * se # upper bound: 96.1531

# f) 95% confidence interval that another sample mean estimate would fall within

## Question 3 ##

male = c(220.1, 218.6, 229.6, 228.8,222.0,224.1, 226.5)
female = c(223.4,221.5,230.2,224.3,223.8,230.8)

# descriptive statisitics
hist(male, main = 'male histogram', breaks=7)
mean(male) # 224.2429
median(male) # 224.1
sd(male) # 4.2548
hist(female, main = 'female histogram', breaks=8)
mean(female) # 225.6667
median(female) # 224.05
sd(female) # 3.8667

# hypothesis testing 
t.test(male, female) # p-value = .5405 can't reject null hypothesis
                     # 95% confidence interval: -6.3868, 3.5391

## Question 4 ##
# a) No because p-values don't say anything about the effect
# b) Yes because the null hypothesis has been rejected
# c) false because the alpha is set before hand 
# d) false becase type two errors are dependant on the size of the effect which isn't known here
# e) true, the p value was greater

## Question 5 ##

person_a2 = c(248, 236, 269, 254, 249, 251, 260, 245, 239, 255) * 1.5
person_b = c(380, 391, 377, 392, 398, 374)

# descriptive statistics
hist(person_a2)
hist(person_b)

# hypothesis testing
wilcox.test(person_a2, person_b) # p-value = .1471 can't reject null hypothesis