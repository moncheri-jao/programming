eqn <- function(m, n)  {
  for (i in 1:n)  {
    for (j in 1:n)  {
      for (k in 1:n)  {
        c <- (i/(j + k) + j/(i + k) + k/(j + i))
          if (c < m + 0.0001 && c > ((m - 1) + 0.9999))  {
            v <- c(i, j, k, c)
          }
        }
      }
    }
  return(v)
}