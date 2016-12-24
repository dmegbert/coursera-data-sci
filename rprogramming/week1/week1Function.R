add2 <- function(x,y) {
  x + y
}
add2(8,1005)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

randVector <- sample(35, size = 20)
randVector
above10(randVector)

columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}
columnmean(airquality)

