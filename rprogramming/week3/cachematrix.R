## This is a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## This function computes the inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
#create a square matrix that can be inversed
testMat <- matrix(rnorm(1000000), 1000, 1000)

#make the special matrix
specailMat <- makeCacheMatrix(testMat)

#compute the inverse of the matrix
cacheSolve(specailMat)

#retrieve the inverse of the matrix from cache
cacheSolve(specailMat)
