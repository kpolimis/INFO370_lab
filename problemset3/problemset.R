## Question 2 ##
trip1 = c(20,32,35,34,40,51,52,56,57,68)
trip2 = c(23,34,36,44,42,51,54,57,54,62)

# a)
plot(trip1, type = 'l')
lines(trip2)

# b)

# c) 
cor(trip1, trip2)

## Question 3 ##
trip2b = trip2+30
cor(trip1, trip2b)

trip1b = trip1*100 
cor(trip1b, trip2)

## Question 4 ##

