#pollutant mean
#week 2 of R programming course assessment
setwd("/Users/davidegbert/coursera-data-sci/rprogramming")

pdata <- data_frame()
pollutantmean <- function(directory, pollutant, id) {
    for(i in id) {
       if (i<10) {
            #print(paste(directory, "/00", id[i], ".csv", sep = ""))
            pdata <- rbind(pdata, read.csv(
                file = paste(directory, "/00", i, ".csv", sep = ""), 
                skip = 1, header = FALSE
                    )
                )
        }
       else if (i >= 10 & i<100) {
            #print(paste(directory, "/0", id[i], ".csv", sep = ""))
           pdata <- rbind(pdata, read.csv(
                file = paste(directory, "/0", i, ".csv", sep = ""), 
                skip = 1, header = FALSE
                ))
        }else {
            #print(paste(directory, "/", id, ".csv", sep = ""))
             pdata <- rbind(pdata, read.csv(
                file = paste(directory, "/", i, ".csv", sep = ""), 
                skip = 1, header = FALSE))
        }

    }
    colnames(pdata) <- c("Date", "sulfate", "nitrate", "ID")
    if(pollutant == "sulfate"){
        p_mean <- mean(pdata$sulfate, na.rm = TRUE, trim = 0)
    }
    else if(pollutant == "nitrate"){
        p_mean <- mean(pdata$nitrate, na.rm = TRUE, trim = 0)
    }
   p_mean
}

#my_mean <- pollutantmean("specdata", "nitrate", id = 1:332)

