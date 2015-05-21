# Rohan Aras
# Problem set 3
# 5/21/15

## Question 1 ##
# http://www.nature.com/nature/journal/v259/n5544/pdf/259557a0.pdf
# velocity of walking is correlated to size of local population with r = .91
# This suggests that as cities grow bigger, people tend to walk faster

## Question 2 ##
trip1 = c(20,32,35,34,40,51,52,56,57,68)
trip2 = c(23,34,36,44,42,51,54,57,54,62)

# a)
plot(trip1, trip2, xlab = 'first vist spending', ylab = 'second visit spending')


# b) there is a positive relationship

# c) 0.969
cor.test(trip1, trip2)

# d) 
sqrt((1-cor(trip1,trip2)^2)/(length(trip1)-2)) # 0.087
# the standard error is the standard deviation of the sample distribution of r

# e) 0.871  0.993

## Question 3 ##
# a)
trip2b = trip2+30
cor(trip1, trip2b)
# 0.969 doesn't change

# b)
trip1b = trip1*100 
cor(trip1b, trip2)
# 0.969 doesn't change

## Question 4 ##
# a) 
c1 = c(-1.3, -0.5, -.3, 0.2, 0.1, 0.5, 1.0, 0.3, 0.4, 0.5, 0.1, 0.2, 0.4, 1.3, 1.2, 1.4, 1.6, 1.6, 1.8, 3.1)
c2 = c(4, 22, 0, 0, 11, 13, 17, 25, 24, 27, 29, 33, 33, 42, 33, 20, 19, 19, 25, 65)

plot(c1, c2, xlab = 'home range', ylab = 'mortality percentage')
# There is a slight positive linear relationship

# b) 
mortality = lm(c2~c1)
abline(mortality)

# c) 
# Ho: home range size does not predict infant mortality (beta = 0)
# Ha: home range size does predict infant mortality (beta != 0)

summary(mortality)
# Ho is rejected, so home range size does predict infant mortality

# d) 
d1 = c(-1.3, -0.5, -.3, 0.2, 0.1, 0.5, 1.0, 0.3, 0.4, 0.5, 0.1, 0.2, 0.4, 1.3, 1.2, 1.4, 1.6, 1.6, 1.8)
d2 = c(4, 22, 0, 0, 11, 13, 17, 25, 24, 27, 29, 33, 33, 42, 33, 20, 19, 19, 25)
mortality2 = lm(d2~d1)
abline(mortality2)
summary(mortality)
# the removal decreases the slope by close to 4

## Question 5 ##
# http://boingboing.net/2013/01/01/correlation-between-autism-dia.html
# http://tylervigen.com/discover?type_select=trip_fall&var_select=Females%2Bin%2BCalifornia%2Bwho%2Bslipped%2Bor%2Btripped%2Bto%2Btheir%2Bdeath&exclude_county=on