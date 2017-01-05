#Week 4 Programming Assignment Part 1

outcome <- read.csv("ProgAssignment3-data/outcome-of-care-measures.csv", 
                    colClasses = "character")

head(outcome)

#coerce col 11 into being a numeric vector
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

