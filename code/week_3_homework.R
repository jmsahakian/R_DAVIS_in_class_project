#Homework 3

set.seed(15)
hw3 <- runif(50, 4, 50)
hw3 <- replace(hw3, c(4,12,22,27), NA)
hw3

prob1<- hw3[hw3>14 & hw3<38]
prob1<- prob1[complete.cases(prob1)]

times3<-prob1*3
plus10<-times3+10

length(plus10)
plus10<-plus10[c(TRUE, FALSE)]
plus10