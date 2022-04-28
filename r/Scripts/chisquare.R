chisq <- function(nu) {
curve(dchisq(x,df=nu),from=0, to=10*nu, col="black")
curve(dnorm(x,mean=nu, sd=sqrt(2*nu)),from=nu-5*sqrt(2*nu), to=nu+5*sqrt(2*nu), col="red", add=TRUE)
}
# chi2 da normale
chisqn <- function() {
N <- as.integer(readline(prompt = "Numero di valori casuali Gaussiani "))  
x = rnorm(N)
z = x*x
hist(z,prob=TRUE,nc=100)
curve(dchisq(x,df=1), from = 0 , to = 12, add=TRUE, col='BLUE')
}
# somma di normali
chisqns <- function(N,nu) {
x1 =rnorm(N)
x2 =rnorm(N)
x3 =rnorm(N)
x4 =rnorm(N)
z = x1*x1+x2*x2+x3*x3+x4*x4
hist(z, prob=F, nc=10)
curve(dchisq(x, df = nu), from = -20 , to = 20, add = TRUE, col = "red")
}