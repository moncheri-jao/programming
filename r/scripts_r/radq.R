radq <- function(c, e) {
  d <- as.integer(c)
  if (c < 0) {
   d <- as.integer(readline(prompt = "Inserire un intero positivo "))
  }
  if (e < 0) {
    e <- readline(prompt = "Inserire una tolleranza positiva ")
  }
  for (x in 1:10000000) {
    y <- 0.5*(x + d/x)
    z <- abs(x - y)
    if (z < e)
      break
  }
  return(y)
}