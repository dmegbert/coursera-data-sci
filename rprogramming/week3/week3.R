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


