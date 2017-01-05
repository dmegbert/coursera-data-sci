#A function to find the hospital with the given ranking
library(dplyr)
setwd("/Users/davidegbert/coursera-data-sci/rprogramming/week4")
rankHospital <- function(state, outcome, num = "best") {
    #read in data from .csv
    hospData <- read.csv("ProgAssignment3-data/outcome-of-care-measures.csv",
                         na.strings = c("NA", "Not Available"))
    
    #create vector of valid outcomes
    validOutcome <- c("heart attack", "heart failure", "pneumonia")
    
    #see if state is valid
    if (!is.element(state, hospData$State)) {
        stateError <- paste(state, " is not a valid state. Use two letter postal code and all caps")
        print(stateError)
        return(invisible())
    }
    
    #see if outcome is valid
    if (!is.element(outcome, validOutcome)) {
        outcomeError <- paste(outcome, " is not a valid outcome. Please enter 'heart attack', 'heart failure' or 'pneumonia'")
        print(outcomeError)
        return(invisible())
    }
    #see if num is valid
    if (num == "best")
        num <- 1
    if (num == "worst")
        num <- 55555
    if (!is.numeric(num)) {
        outcomeError <- paste(num, "is not a valid ranking. Please enter a positive integer or 'best' or 'worst'")
        print(outcomeError)
        return(invisible())
    }
    if (num%%1 != 0 | num < 1) {
        outcomeError <- paste(num, "is not a valid ranking. Please enter a positive integer or 'best' or 'worst'")
        print(outcomeError)
        return(invisible())
    }
    
    #find best heart attack care
    if(outcome == "heart attack") {
        dpSort<- dplyr::filter(hospData, 
            (!is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack) 
            & hospData$State == state)) %>%
            arrange(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name)
        if(num == 55555)
            num <- length(dpSort[,2])
        dpSort <- as.character(dpSort[num,2])
        return(dpSort)
    }
    #find best heart failure care
    if(outcome == "heart failure") {
        dpSort<- dplyr::filter(hospData, 
            (!is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure) 
            & hospData$State == state)) %>%
            arrange(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name)
        if(num == 55555)
            num <- length(dpSort[,2])
        dpSort <- as.character(dpSort[num,2])
        return(dpSort)
    }
    #find best heart failure care
    if(outcome == "pneumonia") {
        dpSort<- dplyr::filter(hospData, 
            (!is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia) 
            & hospData$State == state)) %>%
            arrange(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name)
        if(num == 55555)
            num <- length(dpSort[,2])
        dpSort <- as.character(dpSort[num,2])
        return(dpSort)
    }
    print("Something went wrong, this should not print")
}

