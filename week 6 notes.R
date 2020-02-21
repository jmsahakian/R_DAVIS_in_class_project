#Week 6 Notes

library(tidyverse)

surveys_complete <- read_csv("data/raw_data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

surveys_complete

#ggplot likes data in a long format
#use pivot_longer

#basic ggplot building
#ggplot(data = DATA, mapping = aes(MAPPINGS)) + geom_function()
#geom could be box plot, line, dot etc
#mapping sets the x axis, y axis, color etc

ggplot(data = surveys_complete)

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()

#store whole plots or part of plots to an object

#assigning part of a plot to an object
surveys_plot <- ggplot(data = surveys_complete,
                       mapping = aes(x = weight, 
                                     y = hindfoot_length))

surveys_plot

surveys_plot + geom_point()
#gives us the same plot as before

#how is each layer viewing the data

ggplot() + 
  geom_point(data = surveys_complete,
             mapping = aes(x = weight, y = hindfoot_length))
#each geom can transform what is inside of its function and what is inside of the ggplot()
#ggplot is universal to everything else on top of it

#modify a specific geom by itself
ggplot(data = surveys_complete,
       mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.1)
#helped us see the differences in density
#alpha is from a 0 to 1, with 0 as the most transparent

ggplot(data = surveys_complete,
       mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.01)

#colors
ggplot(data = surveys_complete,
       mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.1, color = "plum4")

ggplot(data = surveys_complete,
       mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.1, color = "plum4")

#color by species ID
ggplot(data = surveys_complete,
       mapping = aes(x = weight, y=hindfoot_length)) + 
  geom_point(alpha = 0.1, aes(color = species_id))

#can also include color within the ggplot call, gives us the same plot
ggplot(data = surveys_complete,
       mapping = aes(x = weight, y=hindfoot_length, color = species_id)) + 
  geom_point(alpha = 0.1)

#Challenge
ggplot(data = surveys_complete,
       mapping = aes(x = species_id, y=weight)) + 
  geom_point(alpha = 0.1, aes(color = plot_type))
#a bar graph would be better

ggplot(data = surveys_complete,
       mapping = aes(x = species_id, y=weight)) + 
  geom_col(aes(color = plot_type))
#could also a box plot

#box plot with weight on y axis and species_id on the x axis
surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_boxplot()

surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_boxplot(aes(color = plot_type))

surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_boxplot()+
  geom_jitter(alpha = 0.3, color = "tomato")

surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_jitter(alpha = 0.3, aes(color = plot_type)) + 
  geom_boxplot()

#alternative ways of 
surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_jitter(alpha = 0.3, aes(color = plot_type)) + 
  geom_boxplot(aes(color = genus))

surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_jitter(alpha = 0.3, aes(color = plot_type)) + 
  geom_boxplot(aes(color = plot_type))

#Challenge

#1. geom_violin()
surveys_complete %>% 
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_violin()

surveys_complete %>%
ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_jitter(alpha = 0.3, aes(color = plot_type)) + 
  geom_violin()

surveys_complete %>%
  ggplot(mapping = aes(x=species_id, y=weight))+ 
  geom_violin() +
  geom_jitter(alpha = 0.3, color = "plum3")

#2. scale_y_log10()
surveys_complete %>%
  ggplot(mapping = aes(x=species_id, y= weight))+ 
  geom_violin() +
  geom_jitter(alpha = 0.3, color = "plum3") +
  scale_y_log10()

surveys_complete %>%
  ggplot(mapping = aes(x=species_id, y= weight))+ 
  geom_violin() +
  scale_y_log10()


#3. new plot - distribution of hindfoot_length, jitter plot
surveys_complete %>%
  filter(species_id == "NL" | species_id == "PF") %>% 
  ggplot(mapping = aes(x=species_id, y= hindfoot_length))+ 
  geom_jitter(alpha = 0.3, aes(color = plot_id))


#we want R to understand that these are discrete not continuous

#surveys_complete$plot_id <- as.factor(surveys_complete$plot_id)

surveys_complete %>%
  filter(species_id == "NL" | species_id == "PF") %>% 
  ggplot(mapping = aes(x=species_id, y= hindfoot_length))+ 
  geom_jitter(alpha = 0.3, aes(color = as.factor(plot_id)))+
  geom_boxplot()

#how can we make the boxplot transparent 

surveys_complete %>%
  filter(species_id == "NL" | species_id == "PF") %>% 
  ggplot(mapping = aes(x=species_id, y= hindfoot_length))+ 
  geom_jitter(alpha = 0.3, aes(color = as.factor(plot_id)))+
  geom_boxplot(alpha = 0.5)

surveys_complete %>%
  filter(species_id == "NL" | species_id == "PF") %>% 
  ggplot(mapping = aes(x=species_id, y= hindfoot_length))+ 
  geom_jitter(alpha = 0.3, aes(color = as.factor(plot_id)))+
  geom_boxplot(fill = NA)

#two color aes, color and fill
#could also set fill = NA, same as alpha = 0

