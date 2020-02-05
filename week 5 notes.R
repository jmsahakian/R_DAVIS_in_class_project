#Week 5 Notes

#can use , and & when combining filtering on more than one condition

#Mutate function

library(tidyverse)

surveys <- read_csv("data/raw_data/portal_data_joined.csv")

#making new columns based of columns already in the data frame

surveys_mut <- surveys %>% 
  mutate(weight_kg = weight/1000)

surveys_mut <- surveys %>% 
  mutate(weight_kg = weight/1000, weight_kg2 = weight_kg*2)

# == recalling information, = setting new information

surveys_mut2 <-surveys %>% 
  filter(!is.na(weight)) %>% 
  filter(species_id != "NL") %>% 
  mutate(weight_kg = weight/1000)

unique(surveys_mut2$species_id)

surveys_hindfoot_half <- surveys %>%
  mutate (hindfoot_half = hindfoot_length/2) %>% 
  select (species_id, hindfoot_half) %>% 
  filter (!is.na(hindfoot_half) & hindfoot_half < 30)

#Spilt, apply, combine
#Using two different functions: group_by and summarize

#want to find the mean weight for each sex
surveys_group <- surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

#we can group by things at onc
surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE), min_weigh = min(weight, na.rm = TRUE))


#What's the difference between summarize and mutate?

sum_surveys <- surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))
#narrows the variables --> just 92 rows and 3 variables
#we get just the grouping columns and just the columns we create
  
mut_surveys <- surveys %>%
  group_by(sex, species_id) %>% 
  mutate(mean_weight = mean(weight, na.rm = TRUE))
#adds the new column to the dataframe

#you can summarize, creating multiple different new fields

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(min_weight = min(weight), 
            max_weight = max(weight)) %>% 
  ungroup()

#if using summarize and group_by, the same group will be present for the new fields
#group stays with the data frame created 
#pipe it into ungroup() to remove the group

#joins
#may have data from multiple different sources 

tail <- read_csv("data/raw_data/tail_length.csv")
tail

summary(surveys$record_id)
summary(tail$record_id)

#basic structure of a join
#join_function (first_data, second_data, by = column_to_join_by)
#here are the two data_frames and here is the column that they have in common
#column must have the same name

#we'll be doing a left join which returns the rows from the first dataframe and the columns from both

left_join(surveys, tail, by = "record_id")

NL_data <- surveys %>% 
  filter(species_id == "NL")

NL_data_tail <- left_join(NL_data, tail, by = "record_id")

#join by multiple columns
#join_function (frist_data, second_data, by c("year", "month", "day"))


#pivot_longer and pivot_wider
surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

str(surveys_mz)


#goal here is a column for every genus
#retain plot_id with values for mean weights for in the new column

unique(surveys_mz$genus)

#n_distinct(surveys_mz$genus)
#n_distinct(surveys_mz$plot_id)

surveys_mz_wide <- surveys_mz %>% 
  pivot_wider(names_from = "genus", values_from = "mean_weight")

surveys_mz_long <- surveys_mz_wide %>% 
  pivot_longer(cols = -plot_id, names_to = "genus", values_to = "mean_weight")

#the difference between the two is the NAs





