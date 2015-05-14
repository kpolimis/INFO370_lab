male = c(220.1, 218.6, 229.6, 228.8,222.0,224.1, 226.5)
female = c(223.4,221.5,230.2,224.3,223.8,230.8)

hist(male, main = 'male histogram', breaks=7)
mean(male) # 224.2
median(male) # 224.1
sd(male) # 4.3
hist(female, main = 'female histogram', breaks=8)
mean(female) # 225.7
median(female) # 224.1
sd(female) # 3.9

t.test(male, female)