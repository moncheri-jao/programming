# library(deSolve)
# ## Chaos in the atmosphere
# Lorenz <- function(t, state, parameters) {
#   with(as.list(c(state, parameters)), {
#     dX <- a * X + Y * Z
#     dY <- b * (Y - Z)
#     dZ <- -X * Y + c * Y - Z
#     list(c(dX, dY, dZ))
#   })
# }
# parameters <- c(a = -8/3, b = -10, c = 28)
# state <- c(X = 1, Y = 1, Z = 1)
# times <- seq(0, 1500, by = 0.01)
# out <- ode(y = state, times = times, func = Lorenz, parms = parameters)
# plot(out)
# ## add a 3D figure if package scatterplot3D is available
# library(scatterplot3d)
# scatterplot3d(out[,-1], type = "l", color = "blue")

robe <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dx <- c(X,Y,Z)
    p1 <- c(0, (1/2)/(-(6.6E-34)/8*(3.14)^2), 0)
    p2 <- c(1, 6.6E-34/4*(3.14), 0)
    p3 <- c(0,0,0)
    S <- cbind(p1,p2,p3)
    DX <- S*dx
    list(c(DX[1], DX[2], DX[2]))
  })
}
parameters <- c(a = -(6.6E-34/8*(3.14)^2),b = 6.6E-34/4*(3.14), C = 1/2)
state <- c(X = 1, Y = 1, Z = 0)
times <- seq(0, 100, by = 0.1)
out <- ode(y = state, times = times, func = robe, parms = parameters)
plot(out)
library(scatterplot3d)
scatterplot3d(out[,-1], type="l", color="blue")