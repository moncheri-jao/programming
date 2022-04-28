chisq <- function () {
  x <- 1000
  nu <- as.integer(readline(prompt = "Gradi di libertà "))
  curve(dchisq(x, nu), from = 0, to = 10*nu, col = "black")
  curve(dnorm(x, mean = nu, sd = sqrt(2*nu)), from = nu - 5*sqrt(2*nu), to = nu+5*sqrt(2*nu), col = "red", add = TRUE)
}

# chi2 da normale

chisqn <- function () {
  N <- as.integer(readline(prompt = "Numero di valori casuali Gaussiani "))  
  x = rnorm(N)
  z = x*x
  hist(z, prob = TRUE, nc = 100)
  curve(dchisq(x,df=1), from = 0 , to = 12, add = TRUE, col = 'BLUE')
}

# somma di normali

chisqns <- function () {
  N <- as.integer(readline(prompt = "Numero di valori Gaussiani "))
  nu <- as.integer(readline(prompt = "Gradi di libertà "))
  e <- as.integer(readline(prompt = "Estremo superiore del grafico "))
  i <- as.integer(readline(prompt = "Estremo inferiore del grafico "))
  grc <- readline(prompt = "Colore del grafico (ENG) ")
  if (is.na(N) == TRUE || is.na(nu) == TRUE || is.na(e) == TRUE || is.na(i) == TRUE) {
    return(cat("Hai inserito valori non numerici, non eseguo "))
  }
  else {
    x1 =rnorm(N)
    x2 =rnorm(N)
    x3 =rnorm(N)
    x4 =rnorm(N)
    z = x1*x1 + x2*x2 + x3*x3 + x4*x4
    hist(z, prob = TRUE, nc = 100)
    curve(dchisq(x, df = nu), from = i , to = e, add = TRUE, col = grc)
  }
}