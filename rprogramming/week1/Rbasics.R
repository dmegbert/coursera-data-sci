myfunction <- function(x) {
  y <- rnorm(100)
  mean(y)
}
myfunction()

second <- function(x) {
  x + rnorm(length(x))
}