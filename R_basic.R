set.seed(100)
d <- rpois(25,8)
d

GetMeanAndSE <- function(x){
  m <- mean(x)
  n <- length(x)
  SE <- sd(x)/sqrt(n)
  return(c(m,SE))
}

GetMeanAndSE(d)