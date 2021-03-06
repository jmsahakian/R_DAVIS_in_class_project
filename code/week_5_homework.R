#Week 5 Homework

library(tidyverse)

#1.Create a tibble named surveys from the portal_data_joined.csv file
surveys <- read_csv("data/raw_data/portal_data_joined.csv")

#2.Subset surveys to keep rows with weight between 30 and 60, and print out the first 6 rows.

surveys <- surveys %>% 
  filter(weight > 30 & weight < 60)
         
head(surveys)


#3.Create a new tibble showing the maximum weight for each species + sex combination and name it biggest_critters. 
#  Sort the tibble to take a look at the biggest and smallest species + sex combinations.

unique(surveys$sex)

biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species, sex) %>% 
  summarize(max_weight = max(weight))

biggest_critters[order(biggest_critters$max_weight),]
biggest_critters[order(-biggest_critters$max_weight),]

#can use arrange(max_weight)
#arrange(desc(max_weight))

#'4.Try to figure out where the NA weights are concentrated in the data- 
#is there a particular species, taxa, plot, or whatever, where there are lots of NA values? 
#There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. 
#Maybe use tally and arrange here.

surveys %>% 
  count(plot_id) %>% 
  filter(is.na(weight))
#unsure what error is occurring

#ANSWER
#surveys %>% 
 # filter(is.na(weight)) %>% 
  #group_by(species) %>% 
  #tally() %>% 
  #arrange(desc(n))

#surveys %>% 
 # filter(is.na(weight)) %>% 
  #group_by(plot_id) %>% 
  #tally() %>% 
  #arrange(desc(n))

#surveys %>% 
  #filter(is.na(weight)) %>% 
  #group_by(year) %>% 
  #tally() %>% 
  #arrange(desc(n))

#5. Take surveys, remove the rows where weight is NA and add a column that contains the 
#   average weight of each species+sex combination to the full surveys dataframe. 
#   Then get rid of all the columns except for species, sex, weight, and your new average weight column. 
#   Save this tibble as surveys_avg_weight.

surveys <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species, sex) %>% 
  mutate(average_weight_sex = mean(weight))

surveys_avg_weight <- surveys %>% 
  select(species, sex, weight, average_weight_sex)

#6.Take surveys_avg_weight and add a new column called above_average that contains logical values 
#  stating whether or not a row’s weight is above average for its species+sex combination 
#  (recall the new column we made for this tibble).
surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > average_weight_sex)


#7. Manipulate surveys to create a dataframe with a column for genus and a column named after every plot type, 
# with each of these columns containing the mean hindfoot length of animals in that plot type and genus. 
# So every row has a genus and then a mean hindfoot length value for every plot type. 
# The dataframe should be sorted by values in the Control plot type column. 
#This question will involve quite a few of the functions you’ve used so far, 
#and it may be useful to sketch out the steps to get to the final result.

surveys_wide <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(plot_type, genus) %>% 
  summarize(mean_hindfoot = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = "plot_type", values_from = "mean_hindfoot")

surveys_wide <- surveys_wide[order(surveys_wide$Control),]
