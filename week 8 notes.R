#Week 8 Notes


library(tidyverse)


gapminder <- read_csv("data/raw_data/gapminder.csv")

pg <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  filter(year %in% 2002:2007) %>% 
  #filter(year > 2000) %>% 
  #filter(year %in% c(2002, 2007)) %>% 
  pivot_wider(names_from = "year", values_from = "pop")