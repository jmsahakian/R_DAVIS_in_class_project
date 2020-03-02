#Homework Week 7

library(tidyverse)
library(ggplot2)
library(ggthemes)
library(scales)

gapminder <- read_csv("data/raw_data/gapminder.csv")

#Change in Population Between 2002 and 2007
#Africa, Americas, Asia, and Europe
#we want plots by continent 
#change in population for each country between 2002 and 2007 on y


gapminder_wider <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  pivot_wider(names_from = "year", values_from = "pop")

gapminder_pop_change <- gapminder_wider %>%
  filter(continent != "Oceania") %>% 
  group_by (country, continent) %>% 
  summarize(pop_change = `2007` - `2002`)
#will need to arrange/sort

gapminder_pop_change %>% 
  ggplot(mapping = aes(x = reorder(country, pop_change), y = pop_change, fill= as.factor(continent)), alpha = 0) +
  geom_col() +
  facet_wrap(~continent, scales = "free") + 
  scale_color_colorblind() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none") +
  labs(x = "Country") +
  labs(y = "Change in Population Between 2002 and 2007")
ggsave(filename = "images/mybeautifulson.png")

#SETH YEFRICAN'S CODE

library(tidyverse)
library(gapminder)
gapminder %>%
  group_by(continent, country) %>%
  summarize(pop_change = pop[year == 2007]-pop[year == 2002]) %>%
  ggplot(mapping = aes(x = reorder(country, pop_change), y = pop_change, fill= as.factor(continent)), alpha = 0) +
  geom_col() +
  facet_wrap(~continent, scales = "free") + 
  ggthemes::scale_color_colorblind() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(size = 10),
        legend.position = "none") +
  labs(x = "Country", y = "Change in Population Between 2002 and 2007") + # Don't need to repeat labs()
  coord_flip()
ggsave(filename = "my_large_son.png", width = 11, height = 14, units = "in")

