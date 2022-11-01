# Deliverable 1 Script
library(dplyr)
mechacar_mpg <- read.csv('Data/MechaCar_mpg.csv')
regression <- lm(mpg ~ ., data=mechacar_mpg)
summary <- summary(regression)

r_squared <- summary$r.squared
p_value <- pf(summary$fstatistic[1],
   summary$fstatistic[2],
   summary$fstatistic[3],
   lower.tail = FALSE)

#Deliverable 1 Results
paste("r-squared: ", as.character(r_squared))
paste("p-value: ", as.character(p_value))



# Deliverable 2 Script
suspension_coil <- read.csv('Data/Suspension_Coil.csv')
total_summary <- summarize(suspension_coil, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Deliverable 2 Results
paste("Total Variance: ", as.character(total_summary %>% select(Variance)))
lot_summary %>% select(Manufacturing_Lot, Variance)



# Deliverable 3 Script
t.test(suspension_coil$PSI, y = rep(1500, length(suspension_coil$PSI)))

lot_1 <- subset(suspension_coil, Manufacturing_Lot == "Lot1")
t.test(lot_1$PSI, y = rep(1500, length(lot_1$PSI)))

lot_2 <- subset(suspension_coil, Manufacturing_Lot == "Lot2")
t.test(lot_2$PSI, y = rep(1500, length(lot_2$PSI)))

lot_3 <- subset(suspension_coil, Manufacturing_Lot == "Lot3")
t.test(lot_3$PSI, y = rep(1500, length(lot_3)))