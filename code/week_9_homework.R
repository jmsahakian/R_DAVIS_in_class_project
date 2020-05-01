#Week 9 R Homework

#Let’s plot some of the Mauna Loa data we downloaded last class. 
#First, remove the NAs (here designated with -99.9 and -999.9) in rel_humid, temp_C_2m, and windSpeed_m_s. 
#Next, use dplyr to calculate the mean monthly temperature using the temp_C_2m column and the datetime column. 
#(*HINT: Look at the lubridate function called month()). 
#Finally, make a ggplot of the mean monthly temperature.

library(tidyverse)
library(lubridate)
library(dplyr)