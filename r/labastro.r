setwd("~/Dropbox/lab/labastro/5-7/Astro_Esp_5_Martedi/Calibrazione\ nuova")
library(Hmisc)

nesquik <- function (sig,n) {
  hist(sig[,2],xlab="Tensione [V]",ylab="Conteggi", main=" ",nc=n)
  errbar(sig[,1],sig[,2],sig[,2]+sqrt((0.5*cos(sig[,1]))^2+0.25),sig[,2]-sqrt((0.5*cos(sig[,1]))^2+0.25),xlab="Tempo [s]",ylab="Tensione [V]")
}

fn <- function(dt) {
  f <- 1/(2*dt/250)
  return(f)
}

cleandata <- function(ds) {
	d <- matrix(0, nrow = dim(ds)[[1]], ncol = 2)
	d[,1] <- ds[,2]
	d[,2] <- ds[,3]
  return(d)
}

temp = list.files(pattern="*.txt")
for (i in 1:length(temp)) assign(temp[i], cleandata(read.table(temp[i])))

dfs <- Filter(function(x) is(x, "matrix"), mget(ls()))

for(i in 1:length(dfs)) assign(temp[i], lm(dfs[[i]][,2]~dfs[[i]][,1]))
fitt <- robe <- function() {
  vec <- vector(length = length(dfs))
  for(i in 1:length(dfs)) { 
    errbar(dfs[[i]][,1],dfs[[i]][,2],dfs[[i]][,2]+summary(lm(dfs[[i]][,2]~dfs[[i]][,1]))$sigma,dfs[[i]][,2]-summary(lm(dfs[[i]][,2]~dfs[[i]][,1]))$sigma)
    abline(lm(dfs[[i]][,2]~dfs[[i]][,1]), col="red")
  }
}

g16v <- c(g16v115.txt[[1]][[1]],g16v117.txt[[1]][[1]],g16v119.txt[[1]][[1]],g16v120.txt[[1]][[1]],g16v122.txt[[1]][[1]],g16v125.txt[[1]][[1]])
g16 <- c(mean(g16v),sd(g16v)/sqrt(length(g16v)))
g5v <- c(g5v100.txt[[1]][[1]],g5v92.txt[[1]][[1]],g5v94.txt[[1]][[1]],g5v96.txt[[1]][[1]],g5v98.txt[[1]][[1]])
g5 <- c(mean(g5v),sd(g5v)/sqrt(length(g5v)))
g8v <- c(g8v100.txt[[1]][[1]],g8v103.txt[[1]][[1]],g8v106.txt[[1]][[1]],g8v109.txt[[1]][[1]],g8v112.txt[[1]][[1]])
g8 <- c(mean(g8v),sd(g8v)/sqrt(length(g8v)))

for(i in 1:length(dfs)) assign(temp[i], robe())
for(i in 1:length(dfs)) assign(temp[i], cbind(summary(lm(dfs[[i]][,2]~dfs[[i]][,1]))$coefficients[[1]],summary(lm(dfs[[i]][,2]~dfs[[i]][,1]))$coefficients[[3]],summary(lm(dfs[[i]][,2]~dfs[[i]][,1]))$coefficients[[2]],summary(lm(dfs[[i]][,2]~dfs[[i]][,1]))$coefficients[[4]]))

check1 <- function(ds) {
  s <- mean(ds[,2])
  as <- abs(ds[,2]-s)
  c <- ifelse(as < 300,ds[,1],NA)
  d <- ifelse(as < 300,ds[,2],NA)
  c <- c[!is.na(c)]
  d <- d[!is.na(d)]
  cd <- cbind(c,d)
  return(cd)
}