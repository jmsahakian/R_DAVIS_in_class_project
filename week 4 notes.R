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

# the $ is for pulling out single columns in a data frame

#Indexing and subsetting dataframes

#brackets have two dimensions for dataframe
#[row, column]

surveys[1,1]

#first row sixth column
surveys[1,6]

surveys[,3]
#if there is a blank space R knows we want everything 

surveys[1:3, 7]

surveys[1:6,]

#exclude the first column

surveys[,-1]
surveys[-c(7:34786),]
#same as the head function

surveys["species_id"]

surveys[1:6, "species_id"]

surveys_200 <- surveys[200,]

nrow(surveys)

surveys[34786,]
tail(surveys)
surveys[nrow(surveys),]

n_rows <-nrow(surveys)

surveys_last <- surveys[nrow(surveys),]

surveys_middle <- surveys[17393,]
surveys_middle <-surveys[nrow(surveys)/2,]
#surveys[n_rows/2,]


head(surveys)
surveys[nrow(surveys)]

surveys_head <- surveys[-c(7:n_rows),]

#TIDYVERSE HUZZAH

#install.packages("tidyverse") --> add to homecomputer

#will have to load the package/library

library(tidyverse)

surveys <- read_csv("data/raw_data/portal_data_joined.csv")

#coming in as characters, not factors
#double --> numeric

surveys
class(surveys)

#dplyr

#select and filter
#select is columns and filter is for rows

surveys_new <- select(surveys, plot_id, species_id, weight)

filter(surveys, plot_id == 3)
#double == because we are recalling information

#pipes

#I want all weights greater than 5 and only the columns, species_id, sex, and weight
surveys2 <-filter(surveys, weight > 5)
surveys_smol <- select(surveys2, species_id, sex, weight)

#can use a pipe to do this in one step

#a pipe looks like this %>%
# %>% (crtl+shift+m or command+shift+m for mac)

surveys_smol <- surveys %>% 
  filter(weight>5) %>% 
  select(species_id, sex, weight)


