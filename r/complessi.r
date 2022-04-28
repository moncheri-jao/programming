setwd("~/Scripts/r")
plot(0+1i,xlim=c(-2,2),ylim=c(-2,2), xlab="Re", ylab="Im",asp=1,cex=2)
grid()
z <- (0+1i)^(1/4)*c(1, 1.05, 0.95)
co <- c("blue","red","green")
for (n in 1:3) {
	for (k in 1:16) {
		points(z[n]^k,pch=19,col=co[n])
		lines(c(0,Re(z[n]^k)),c(0,Im(z[n]^k)),col=co[n])
		Sys.sleep(0.1)
	}
}
