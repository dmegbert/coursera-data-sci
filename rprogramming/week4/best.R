#A function to find the best state for heart attack, pneumonia, or heart failure
library(dplyr)
setwd("/Users/davidegbert/coursera-data-sci/rprogramming/week4")
best <- function(state, outcome) {
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
    #find best heart attack care
    if(outcome == "heart attack") {
        dpSort<- dplyr::filter(hospData, 
            (!is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack) 
            & hospData$State == state)) %>%
            arrange(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name)
        dpSort <- as.character(dpSort[1,2])
        return(dpSort)
    }
    #find best heart failure care
    if(outcome == "heart failure") {
        dpSort<- dplyr::filter(hospData, 
            (!is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure) 
            & hospData$State == state)) %>%
            arrange(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name)
        dpSort <- as.character(dpSort[1,2])
        return(dpSort)
    }
    #find best heart failure care
    if(outcome == "pneumonia") {
        dpSort<- dplyr::filter(hospData, 
            (!is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia) 
            & hospData$State == state)) %>%
            arrange(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name)
        dpSort <- as.character(dpSort[1,2])
        return(dpSort)
    }
    print("Something went wrong, this should not print")
}

