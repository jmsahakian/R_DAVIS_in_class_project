#Week 8 Notes

#homework review
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(scales)

gapminder <- read_csv("data/raw_data/gapminder.csv")

pg <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  filter(year %in% c(2002,2007)) %>% 
  #filter(year > 2000) %>% 
  #filter(year %in% c(2002, 2007)) %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  mutate(pop_growth_0207 = (`2007` - `2002`))

gapminder %>%
  filter (year %in% c(2002, 2007), continent != "Oceania") %>% 
  group_by(country) %>% 
  mutate (pop_diff = diff(pop)) %>% 
  select (country, continent, pop_diff) %>% 
  distinct()

pg %>% 
  filter(continent != "Oceania")
  ggplot (aes(x = reorder(country, pop_growth_0207)), y = pop_growth_0207) +
    #first argument is x, then second is what you want to reorder
  geom_col(aes(fill_continent)) + 
  facet_wrap(vars(continent), scales = "free") +
  theme_bw()+
  scale_fill_viridis_d() + 
  theme (axis.text.x = element_text(angle = 45, hjust = 1),
    legend_position = "none") +
  xlab ("Country") + 
  ylab ("Pop Growth Between 2002 and 2007")

#can use the following ?function to search for information
  ?theme

library(wesanderson)
  
#Importing and Exporting Data
  
library(tidyverse)
  
species.dot <-  read.csv("data/raw_data/species.csv")

species_underscore <- read_csv("data/raw_data/species.csv")

species_underscore
str(species.dot)

surveys.dot2 <- read.csv("data/raw_data/species.csv", stringsAsFactors =  FALSE)
str(surveys.dot2)

#other ways to import data
#read.delim(, sep = ";")
#read.csv2() sep is ;
#read_table
#read.table
#the two above are general versus the more specific csv stuff

read_csv("data/raw_data/wide_eg.csv")
read_csv("data/raw_data/wide_eg.csv", skip = 1)
read_csv("data/raw_data/wide_eg.csv", skip = 2)

#can use read_csv to read in files directly from a website if address ends in .csv

#Exporting a CSV

write_csv(x = species.dot, path = "data/cleaned_data/species_dot_written.csv")

#use highly compressed files endings
#.rda and .rds files
#.rda can store multiple data objects in it - multiple data frames, plots

save(species.dot, species_underscore, file = "data/cleaned_data/species_dataframes.rda")

load(file = "data/cleaned_data/species_dataframes.rda")  
#the objects exist separately 

#.rds uses the following functions - only stores a single frame/object
saveRDS(species_underscore, file = "data/cleaned_data/species_underscore.rds")
new_species_underscore <- readRDS(file = "data/cleaned_data/species_underscore.rds")
# have to assign this to an object
# can save a whole model under an RDS file

surveys <- read_csv("data/raw_data/portal_data_joined.csv")

surveys %>% 
  ggplot(year, y = hindfoot_length, color = genus)) + 
  geom_jitter() 

ggsave (filename = "images/surveys_hindfoot_year_species.jpg", width = 6, height = 6)
# plot = last plot made by default

#some cool packages
# readxl , reads in excel workbooks by tab
# googlesheets4
# foreign - reads strange data formats 
# rio - will read in a variety of formats


library(readxl)

#Datetimes in R!

#Three basic classes in R
# 1. Date: just for dates (2/25/2019)
# 2. Datetime: POSIXct best for dates with times
# 3. POSIXlt

#lubridate uses the first two

#Enter data into excel - use separate columns for year, month, day, time (hours, minutes, etc)


samples_dates_1 <- c("2018-02-01", "2018-03-21", "2020-02-25", "2019-04-04")
#r reads these in as characters

samples_dates_1 <- as.Date(samples_dates_1)
#This works nicely because R is looking for the format that we entered our dates as
# YYYY MM DD

sample_date_2 <- c("02-25-2020", "04-04-1988", "10-05-2019", "10-01-2010")

sample_date_2 <- as.Date(sample_date_2)  
#get an error, R does not like this format

sample_date_2 <- as.Date(sample_date_2, format = "%m-%d-%Y")
#see stat.berkeley.edu/~s133/dates.html for a list of the codes

#05A21A1998

#format="%mA%dA%Y"

#Challenge
#Jul 04, 2019
#format = "%b %d, %Y"

july <- c("July 04, 2019", "July 08, 2019", "July  17, 2019")

july <- as.Date(july, format = "%B %d, %Y")
#any character must be included in this format call

time <- c("2016-07-24 22:55:01", "2013-04-12 18:50:11")
#R format for time is YYYY MM DD, HH:MM:SS
time <- as.POSIXct(time)
#time zone is set to the time of the computer

time <- as.POSIXct(time, tz = "GMT")



