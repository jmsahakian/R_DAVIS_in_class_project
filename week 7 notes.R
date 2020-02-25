#Week 7 Notes

#Homework
library(tidyverse)
gapminder <- read_csv("data/raw_data/gapminder.csv")

#i used mutate not summarize

gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_LifeExp = mean(lifeExp)) %>% 
  ggplot(mapping = aes(x = year, y = mean_LifeExp, color = continent)) + 
  geom_point() + 
  geom_line() + 
  labs(color = "Continent")
#can also use rename(continent = Continent)

#load survey data in 
surveys_complete <- read_csv("data/raw_data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))
#period means all columns

#we want to create a new dataframe with the species that appear each year

yearly_counts <- surveys_complete %>% 
  count(year, species_id)
#under the hood, count is grouping by, tallying, and ungrouping

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, color = species_id)) +
 geom_point() + 
 geom_line()
#we are using color as a grouping variable

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + 
 geom_line()
#can also do shape =, linetype =


#Faceting

ggplot(data = yearly_counts, mapping = aes(x=year, y = n)) + 
  geom_line () +
  facet_wrap(~ species_id)

#creates a graph for every species
#can facet_wrap by two axises

#Challenge
new_count <- surveys_complente %>% 
  count(year, species_id, sex)

ggplot(data = new_count, mapping = aes(x=year, y = n, color = sex)) + 
  geom_line () +
  facet_wrap(~ species_id) +
  theme_bw()
#could also do theme_minimal()


#simplification can make a big difference in communication 

