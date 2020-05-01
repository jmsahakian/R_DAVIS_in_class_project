#Week 9 Notes

#Date Times using 'lubridate' package 


#load packages
library(tidyverse)
library(lubridate)

nyf1 <- read_csv("data/raw_data/2015_NFY_solinst.csv", skip = 12)

sample_dates <- c("07-15-2019", "12-24-2018", "03-07-2013", "04-04-2019")

sample_dates <- as.Date(sample_dates, format = "%m-%d-%Y")

dt <- c("07-15-2019 14:32:09", "12-24-2018 12:40:01")
dt <- as.POSIXct(dt, format = "%m-%d-%Y %H:%M:%OS")
?as.POSIXct
dt

#have to originally rerun dt 
dt <- as.POSIXct(dt, format = "%m-%d-%Y %H:%M:%OS", tz = "GMT")
dt

#sometimes you need to explicit tell R Studio which package to use lubridate::
dates_lub <- mdy(sample_dates)

sample_dates2 <- c("5A06A17 14:22", "8A17A13 06:33")
sample_dates2_lub <- mdy_hm(sample_dates2, tz = "GMT")

sample_dates2_lub

head(nfy1)

#automically converted the date and time varibles
#typically do not want tidyversie to do these conversions 
#want to force tidyverse to see these fields as characters

nyf1 <- read_csv("data/raw_data/2015_NFY_solinst.csv", skip = 12, col_types = "ccidd")
head(nyf1)

#quick way to make a new column
nyf1$Datetime <-  paste(nyf1$Date, nyf1$Time, sep = " ")

head(nyf1)

nyf1$Datetime2 <- ymd_hms(nyf1$Datetime, tz = "GMT")

tz(nyf1$Datetime2)

load("data/raw_data/mauna_loa_met_2001_minute.rda")

#RDS has only one object and RDA has multiple objects

summary(mloa_2001)

#will need to use the paste function to create the dates variables we want

mloa_2001$Datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)

head(mloa_2001)
 
mloa_2001$Datetime <- ymd_hm(mloa_2001$Datetime, tz = "HST")

tz(mloa_2001$Datetime)


