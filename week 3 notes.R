#week 3 notes
#whoops same folder is git repository and R project

#files in markdown must be relative to repository


#how does r think about data?
#we want to know because it is foundational - it will often be the reason for issues even if we're not using this code in our scripts

<<<<<<< HEAD
#VECTORS!
=======
#vectors!
>>>>>>> 665e5959dcd6fa8d6132501279211d0b3870aeae

#vectors are comprised of a series of values

x<-5
#5 is a vector of length 1

c(50,60,65,82)
#bind together values into a vector

weight_g <-c(50,60,65,82)
animals <- c("mouse","rat", "dog")

#can use either '' or "" 
#every element in a vector must be the same type 

#class tells us the data type in a vector
class(weight_g)
class(animals)

#str is the structure function
str(weight_g)
str(animals)

#vectors can be modified with c() function

c(weight_g, 90)
#evaluated to content and then 90 is added

weight_g <-c(weight_g, 90)
weight_g <-c(30, weight_g)

weight_g

#these are automic vectors
#there are character, double (numeric), logic, and integer 

#L indicates that it is a integer

# : creates a sequence
x<-1:10
class(x)


#coercion challenge

num_char <- c(1, 2, 3, "a")
class(num_char)
#character

num_logical <- c(1, 2, 3, TRUE)
class(num_logical)
#numeric

char_logical <- c("a", "b", "c", TRUE)
class(char_logical)
#character
#why isn't TRUE = 1

tricky <- c(1, 2, 3, "4")
class(tricky)
#character

#challenge 2

combined_logical <- c(num_logical, char_logical)
combined_logical

class(combined_logical)

#subsetting vectors

animals <- c("mouse", "rat", "dog", "cat")
animals[2]

#when you subset a vector, you get another vector back

animals[c(3,2)]
animals[c(3,2,4,1,2,1)]

#asking a question, not diminishing finite resources from the vector

animals[0]
#R starts at 1

#conditional subsetting

weight_g <-c(21,34,39,54,55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)]
#only returns the values when it is TRUE

weight_g > 50
#returns a logical vector of the same length

weight_g [weight_g > 50]
#returns a logical vector then that vector is being subset

#multiple operations at once
weight_g[weight_g < 30 | weight_g > 50]

weight_g[weight_g >=30 & weight_g == 21]
#this returns nothing


animals[animals == "cat" | animals == "rat"]

animals %in% c("mouse", "rat")

animals[animals %in% c("mouse", "rat")]

"four" > "five"
"six" > "five"

#vector math

x <- 1:10

x+3

x*10

#does each element separately 

y<-100:109

x+y

#adds the first value of x to the first value of y, then the second element etc

z <-1:2
x+z

#vector recycling -> R recycles the values of the shorter one until the two vectors are the same length

z<-1:3
x+z
a <-x+z

a
x
z

#warning message, a partial recycling - we don't want this!
str(x)
str(z)

length(x)
length(z)

#recycling with conditional subsetting

x[c(TRUE, FALSE)]
#this conditional vector gets recycled as well 
x[c(TRUE, FALSE, FALSE)]

<<<<<<< HEAD
#Working with Missing Data

#In R missing are represented as NAs

heights <- c(2,4,4, NA, 6)
mean(heights)
max(heights)

#na.rm = NA Remove
mean(heights, na.rm = TRUE)

max(heights, na.rm = FALSE)

class(heights)

#NA is not a character, but a numeric value

#is.na = is it a NA?

is.na(heights)

#! means not

!is.na(heights)
heights[!is.na(heights)]

#complete.cases = extracting all the elements that are complete cases (are not NAs)

heights[complete.cases(heights)]

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

heights <- heights[complete.cases(heights)]
heights[heights>67]
length(heights[heights>67])

#LISTS
#multiple vectors of different lengths

#DATAFRAME
#similar to excel 
#multiple lists of the same lengths
#that is where NA comes in

#FACTORS
#factors are a bit funky
#categorical data

sex <- factor(c("male", "female", "female", "male"))

class(sex)
typeof(sex)

#goes alphabetically so female is 1, male is 2

levels(sex)

nlevels(sex)

#specify the order of the levels

sex <- factor(sex, levels = c("male", "female"))
sex

#use factor to convert categorical data into numbers for modeling or plotting

#making factors into characters
sex_cha <- as.character(sex)
=======
>>>>>>> 665e5959dcd6fa8d6132501279211d0b3870aeae
