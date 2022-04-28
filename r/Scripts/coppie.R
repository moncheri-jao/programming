random <- function (N) {
  n <- N%%2
  while (n == 1)
    N <- as.integer(readline(prompt="Inserire un numero pari \n"))
    n <- N%%2
    if (n==0){
      break
    }
  s <- sample(1:N,replace=F)
  k <- N/2
  for (i in 1:k){
    cat(sprintf("\n tizio %d con tizio %d\n", s[i],s[N-i+1]))
  }
}


randomf <- function (N) {
  k <- N/2
  m <- sample(1:k,replace=F)
  f <- sample(m,replace=F)
  for (i in 1:k){
    cat(sprintf("\n tizio %d con tizia %d\n", m[i],f[i]))
  }
}