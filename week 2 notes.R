#R week 2

#assign value
x <- 99
x <- 5
y <- x*2
x <- 20
y

# we are evaluating and storing output
# we are not creating a link!
# can also use = for assignment, but use the <-
# use = to set arguments within functions

#how R talks back
log_of_word <- log("word")
#error

log_of_word
# there is no object because there was an error
# errors stop the whole process and don't give outputs other than the error

log_of_negative <- log(-2)
log_of_negative
#warning occurred, but an object was created

#r likes tidy data

#store null values as blank or NA
#avoid spaces, numbers, and special characters in column headers
#record metadata in text file

#excel is insane
#windows - days since jan 1 1990 but mac - days since jan 1 1904
#do not touch the raw data 

#data validation in excel

#we love .csv

getwd()
setwd()

# ~ refers to your user name/home directory
# paths are either relative or absolute
# relative file path - "data/portal_data_joined.csv"
# use tab inside "" to search
# "../" go up a level in your directory
