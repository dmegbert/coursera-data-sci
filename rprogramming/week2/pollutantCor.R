#pollutant correlation
#week 2 of R programming course assessment
setwd("/Users/davidegbert/coursera-data-sci/rprogramming")

pdata <- data.frame()
monitorName <- vector()
dataWithCounts <- data.frame()
trimmedData <-data.frame()
completeData <- data.frame() 
colnames(completeData) <- c("id", "nobs")
corPollutant <- function(directory, threshold = 0) {
    naID <- vector()
    corVec <-vector()
    for(i in 1:332) {
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
        #trimmedData <- c(cdata[1,4], rowCount)
      
        if(rowCount>threshold) {
            tmp <- vector()
            tmp <- cor(cdata[,2], cdata[,3])
            corVec <- append(corVec, tmp)
        }
    }
    corVec
}
blah<-corPollutant("specdata", threshold = 150)
head(blah)

