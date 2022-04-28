linreg <- function(x,y) {
    M <- cbind(c(length(x),sum(x)), c(sum(x),sum(x^2)))
    n <- c(sum(y),sum(x*y))
    c <- solve(M)%*%n
    rownames(c) <- c("Intercetta", "C.Angolare")
    return(c)
}
