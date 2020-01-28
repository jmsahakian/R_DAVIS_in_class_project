#Week 4 notes

#Factors as data
sex <- as.factor(c("male", "female", "male", "male"))
sex
class(sex)
typeof(sex)

#integer vectors with character labels attached to it

#reordering factor
sex<- factor(sex,levels = c("male", "female"))
sex

#converting factors to characters

as.character(sex)

year_fct <- as.factor(c(1990, 1983, 1977, 1998, 1990))

as.numeric(year_fct)
#ordering chronologically and assigning them that value

#must convert to characters then numeric

as.numeric(as.character(year_fct))

year_fct <- as.numeric(as.character(year_fct))

levels(sex)

#use square brackets to pull out information

levels(sex)[1] <- "MALE"
levels(sex)

#CHALLENGE

sex<- factor(sex,levels = c("female", "MALE"))

levels(sex)[1] <- "F"
levels(sex)[2] <- "M"
# can also do levels(sex) <- c("M", "F")

#Starting with Data
surveys <- read.csv("data/raw_data/portal_data_joined.csv")
#this is a data.frame

#many vectors that are the same length

class(surveys)

#shows the number of rows
nrow(surveys) 
#shows the first six rows
head(surveys)

#names of all the columns
colnames(surveys)

summary(surveys)

str(surveys)

surveys$species_id <- (as.character(surveys$species_id))

#pulling out unique identifiers in a column
unique(surveys$species_id)
unique(surveys$species)

