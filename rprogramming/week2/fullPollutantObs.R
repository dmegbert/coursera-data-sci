#pollutant full
#week 2 of R programming course assessment
setwd("/Users/davidegbert/coursera-data-sci/rprogramming")

pdata <- data.frame()
monitorName <- vector()
dataWithCounts <- data.frame()
trimmedData <-data.frame()
completeData <- data.frame() 
colnames(completeData) <- c("id", "nobs")
complete <- function(directory, id) {
    naID <- vector()
    for(i in id) {
        monitorName <- cbind(monitorName, i)
        
        if (i<10) {
            #print(paste(directory, "/00", id[i], ".csv", sep = ""))
            pdata <- read.csv(
                file = paste(directory, "/00", i, ".csv", sep = ""), 
                skip = 1, header = FALSE
            )
            
        }
        else if (i >= 10 & i<100) {
            #print(paste(directory, "/0", id[i], ".csv", sep = ""))
            pdata <- read.csv(
                file = paste(directory, "/0", i, ".csv", sep = ""), 
                skip = 1, header = FALSE
            )
        }else {
            #print(paste(directory, "/", id, ".csv", sep = ""))
            pdata <- read.csv(
                file = paste(directory, "/", i, ".csv", sep = ""), 
                skip = 1, header = FALSE)
        }
        
        cdata <- na.omit(pdata)
        rowCount <- length(cdata[,4])
        #dataWithCounts <- cbind(cdata, rowCount)
        trimmedData <- c(cdata[1,4], rowCount)
        
        if(rowCount==0) {
            completeData <- rbind(completeData, c(i, 0))
        }else {
            completeData <- rbind(completeData, trimmedData)
        }
    }
    colnames(completeData)<- c("id", "nobs")
    completeData
    
}
#blah<-completePollutant("specdata", 290:332)
#blah

