# escrit en catal?, per informacions pregunta al propietari d'aquesta maquina, moltes gracies.

# libraries fonamentals per el calc?l estadistic

libraries <- function () {
  library(lmtest)
  library(car)
  library(alr3)
  library(alr4)
  library(arm)
  library(Hmisc)
  library(effects)
  library(ggplot2)
  library(graphics)
  library(nlme)
}

# insereix el file

input <- function () {
  f <- readline(prompt = "?Nom del file? (amb extenci?) ")
  s <- readline(prompt = "Separador dels decimals utilitzat en el file ")
  dq <- read.table(f, dec = s)
  return(dq)
}

# fit dels dades amb plot i errors

lr <- function (x, y) {
  library(Hmisc)
  xl <- readline(prompt = "?nom dels x? " )
  yl <- readline(prompt = "?nom dels y? " )
  m <- readline(prompt = "?nom del plot? ")
  # c <- readline(prompt = "?color del plot? ")
  # ec <- readline(prompt = "?color dels errors? ")
  # fc <- readline(prompt = "?color del fit? ")
  plot(x, y, main = m, xlab = xl, ylab = yl)
  fit <- lm(y ~ x)
  abline(fit, col = "red")
  sfit <- summary(fit)
  std <- sfit$sigma
  errbar(x, y, y + std, y - std, xlab = xl, ylab = yl, col = "black", errbar.col = "black", add = TRUE)
  return(sfit)
}

# distribucions dels errors
dist <- function(x, y) {
  n <- 10000
  c <- readline(prompt = "?Color de la distribuci?? ")
  fit <- summary(lm(y~x))
  n <- as.integer(fit$df.residual)
  s <- as.integer(fit$coefficients[[2]])
  curve(dchisq(x, 50), col = c, xlim = c(0, 50))
  curve(dt(x, 50), col = c, xlim = c(0, 50))
  curve(dnorm(x, sd = s), col = c, xlim = c(0, 50))
  return(summary(fit))
}


ans <- function(x, y) {
  library(Hmisc)
  fit <- lm(y ~ x)
  sfit <- summary(fit)
  dex <- abs(x - mean(x))
  dey <- abs(y - mean(y))
  sx <- dex/sqrt(length(x))
  sy <- dey/sqrt(length(y))
  errbar(x, y, y + sy, y - sy)
  er <- cbind(dey,sy)
  return(er)
}