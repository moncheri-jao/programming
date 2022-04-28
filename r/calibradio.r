calib <- function(x) {
	theta <- 31-0.09*x+0.000113*x^2-3.9e-08*x^3+4e-12*x^4-3e-17*x^5
	return(theta)
}
