#Week 4 homework 


#Problem 1
surveys <- read.csv("data/raw_data/portal_data_joined.csv")

surveys_base <- surveys[c("species_id","plot_type","weight")]

surveys_base <- surveys_base[1:60,]
    
surveys_base$species_id <- (as.character(surveys_base$species_id))
surveys_base$plot_type <- (as.character(surveys_base$plot_type))

surveys_base <- surveys_base[complete.cases(surveys_base$weight),]

challenge_base <- surveys_base[surveys_base$weight > 150,]



#Problem 2