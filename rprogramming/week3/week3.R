#playing with git part 2
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x<-1:4
lapply(x, runif)
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[,1]) #annonymous function example

#sapply will simplify result of lapply if possible
#will return a matrix or vector if possible, if not it will return a list

x <- list(a = 1:5, b = rnorm(10))
y<-sapply(x, mean)

#apply - used for applying function to rows or cols of a matrix

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)   #finds mean of each column of the matrix and returns a vector
apply(x, 1, sum)    #finds sum of each row of the matrix and returns a vector
x
rowSums(x) #uses apply but is faster for row/col sums
colSums(x)
rowMeans(x) #same but for means
colMeans(x)

#need to pass args for quantile for each row and will return a 2x20 matrix
apply(x, 1, quantile, probs = c(0.25, 0.75))  

#average matrix in an array
a<-array(rnorm(2*2*10), c(2, 2, 10))
a
#keep 1st and 2nd dimension and collapse 3rd dimension
apply(a, c(1,2), mean)
#can also use rowMeans pass dims arg
rowMeans(a, dims = 2)

#mapply is a multivariate apply of sorts which applies a function in 
#parallel over a set of arguments

#mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  
#the ... is the arguments to apply over
#MoreArgs is a list of ohter arguments to FUN
#Simplify - should result be simlplified

mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(5,1,2)

#vectorize a function that does not take in vector arguments using mapply
mapply(noise, 1:5, 1:5, 2)

#tapply applies function over subsets of a vector
#tapply(X, INDEX, FUN=NULL, ..., simplify = TRUE)
#X is a vector, INDEX is a factor or a list of Factors, FUNction, ... args to 
#pass to the function, simplify - should results be simplified

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3,10)
f
tapply(x, f, mean)

#split takes a vector or other object and splits it into groups determined by a
#factor or a list of factors
#split(x, f, drop = FALSE, ...) x is vector/list/df, f is factor or list of factors
# drop indicates whether empty levels should be dropped

split(x, f)

#common to use split and lapply together
lapply(split)
library(datasets)
head(airquality)

#find mean within each month
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

#get rid of NAs and simplify using sapply
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

#Splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
interaction(f1,f2)
str(split(x, list(f1,f2)))
str(split(x, list(f1,f2), drop = TRUE))

log(-1)
printmessage <- function(x) {
    if(is.na(x))
        print("x is a missing value")
    else if(x>0)
        print("x is greater than 0")
    else
        print("x is less than 0")
    invisible(x)
}
y<-printmessage(-25)
y
printmessage(NA)

library(datasets)
data(iris)
