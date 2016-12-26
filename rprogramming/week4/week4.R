#Simulataion
#Generating random numbers
#rnorm - generate randmo Normal variates with a given mean and std dev
#dnorm - evaluate the Normal probability density (with a given mean/sd) at a 
#point (or vector of points)
#
#pnorm - evaluate the cummulative distribution function for a Normal a normal dist.
#rpois - generate random Poisson variates with a given rate

# d for density, r for random number generation, p for cumulative dist, q for quantile function

x <- rnorm(10, mean = 10, sd = 2)
x

x<-rnorm(10)
x
#reproducible random number by setting seed. Always set seed before beginning
set.seed(1)
rnorm(5)
set.seed(1)

rpois(10, 2)
ppois(100000, 2)
set.seed(1)
rpois(10,2)

#Generating Random Numbers from a Linear Model
# linear model is y = Beta0 + Beta1x + epsilon  epsilon is Noise normal(mean 2, std dev 2)
# Beta0 is .5 and Beta1 is 2

set.seed(20)
x <-rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

#If x is binary (gender, yes/no, etc.)
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

#Generating random numbers from a Poisson model where
# Y ~ Poisson(mu)  log mu = Beta0 + Beta1*x   Beta0 = 0.5 and Beta1 = .3
# we need to use the rpois function for this
# count variables instead of continuous variables

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

# Random Sampling
# sample function allows you to draw randomly from a specified set of (scalar)
# objects allowing you to sample from arbitrary distributions

set.seed(1)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)
sample(1:10, 4, replace = TRUE)
