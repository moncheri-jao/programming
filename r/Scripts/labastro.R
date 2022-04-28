setwd("~/Dropbox/lab/labastro/provar")
library(Hmisc)

nesquik <- function (sig,n) {
  hist(sig[,2],xlab="Tensione [V]",ylab="Conteggi", main=" ",nc=n)
  errbar(sig[,1],sig[,2],sig[,2]+sqrt((0.5*cos(sig[,1]))^2+0.25),sig[,2]-sqrt((0.5*cos(sig[,1]))^2+0.25),xlab="Tempo [s]",ylab="Tensione [V]")
}

temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))

fn <- function(dt) {
  f <- 1/(2*dt/250)
  return(f)
}
