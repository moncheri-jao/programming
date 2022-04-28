integral <- function(f,a,b,n){
    h <- (b-a)/n
    x <- seq(a,b, len=n+1)
    fx <- f(x)
    sum(fx[-1]+fx[-length(x)])*h/2
}

finite.diff <- function(f,x) {
	if (length(f) != length(x)) {
	    stop("coglione hanno lunghezze diverse")
	}
	n <- length(x)
	fdx <- vector(length = n)
	for (i in 2:n) {
	    fdx[i-1] <- abs((f[i-1]-f[i])/(x[i]-x[i-1]))
	}
	return(fdx)
}

int <- function (y,a,b) {
    x <- seq(a,b,len=length(y))
    F <- sum(y*abs(x[-1]+x[-length(y)]))
    return(F)
}
