# Rohan Aras
# Lab 8
# 5/28/15
#
# performs a knn test on urban vs suburban housing prices in the boston area


library(class)

file = read.csv('bhousing.csv')

# indus, rm, age, dis

# Get colums for training and testing for each variable
indus_train = file$INDUS[1:354]
indus_test = file$INDUS[355:506]

rm_train = file$RM[1:354]
rm_test = file$RM[355:506]

age_train = file$AGE[1:354]
age_test = file$AGE[355:506]

dis_train = file$DIS[1:354]
dis_test = file$DIS[355:506]

cat_train = file$CAT[1:354]
cat_test = file$CAT[355:506]

# combine each training and testing variable
train = cbind(indus_train, rm_train, age_train, dis_train)
test = cbind(indus_test, rm_test, age_test, dis_test)


table(cat_test)

# do knn tests
results = knn(train, test, cat_train, k = 1)
summary(results)

results = knn(train, test, cat_train, k = 2)
summary(results)

results = knn(train, test, cat_train, k = 3)
summary(results)

results = knn(train, test, cat_train, k = 4)
summary(results)