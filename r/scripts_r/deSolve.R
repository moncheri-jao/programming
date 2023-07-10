library(deSolve)
## Chaos in the atmosphere
atm <- function (step){
Lorenz <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dX <- a * X + Y * Z
    dY <- b * (Y - Z)
    dZ <- -X * Y + c * Y - Z
    list(c(dX, dY, dZ))
  })
}
parameters <- c(a = -8/3, b = -10, c = 28)
state <- c(X = 1, Y = 1, Z = 1)
times <- seq(0, 1500, by = step)
out <- ode(y = state, times = times, func = Lorenz, parms = parameters)
plot(out)
## add a 3D figure if package scatterplot3D is available
library(scatterplot3d)
scatterplot3d(out[,-1], type = "l", color = "blue")
}