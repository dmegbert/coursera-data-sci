#function to rank all 
rankAll <- function(outcome, num = "best") {
    #read in data from .csv
    hospData <- read.csv("ProgAssignment3-data/outcome-of-care-measures.csv",
                         na.strings = c("NA", "Not Available"))
    
    #create vector of valid outcomes
    validOutcome <- c("heart attack", "heart failure", "pneumonia")
    
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
            !is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)) %>%
            arrange(State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
                    Hospital.Name)
    }
    
    #find best heart failure care
    if(outcome == "heart failure") {
        dpSort<- dplyr::filter(hospData, 
            !is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)) %>%
            arrange(State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, 
                    Hospital.Name)
    }
    
    #find best heart failure care
    if(outcome == "pneumonia") {
        dpSort<- dplyr::filter(hospData, 
            !is.na(hospData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)) %>%
            arrange(State, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, 
                    Hospital.Name)
    }
    
    #create a dataframe with ranked hospitals
    bestHosp <- function(x, num = 1) {
        if (num == 55555) {
            x <- tail(x, 1)
            a <- as.character(x[,2])
            b <- as.character(x[,7])
            c <- c(a,b)
        }else {
            a <- as.character(x[num,2])
            b <- as.character(x[num,7])
            c <- c(a,b)
        }
      c  
    }
    l <- split(dpSort, dpSort$State)
    l <- lapply(l, bestHosp, num = num)
    dpSort <- data.frame(matrix(unlist(l), nrow=54, byrow=T))
}


