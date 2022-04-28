risolvente <- function(a,b,c) {
	coef <- c(a,b,c)
	dis <- coef[2]*coef[2]-4*coef[1]*coef[3]
	if (dis < 0) {
		dis <- dis*(1+1i)
		sol <- c((-coef[2]+sqrt(dis))/(2*coef[1]),(-coef[2]-sqrt(dis))/(2*coef[1]))
	}
	sol <- c((-coef[2]+sqrt(dis))/(2*coef[1]),(-coef[2]-sqrt(dis))/(2*coef[1]))
	plot(function(x) a*x*x+b*x+c, xlim=c(Re(sol[2])-1,Re(sol[1])+1))
	for (n in 1:2) {
		abline(v=Re(sol[n]),col="red")
	}
	return(sol)
}
