Mandelbrot <- function() {
  if (require(caTools) == FALSE) {
    library(caTools)           # external package providing write.gif function
  }
jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
                                 "yellow", "#FF7F00", "red", "#7F0000"))
  dxn <- readline(prompt = "Inserisci la lunghezza \n ")
  dyn <- readline(prompt = "Inserisci l'altezza \n ")
  itn <- readline(prompt = "Inserisci il numero di step \n ")
  Dx <- c(as.integer(dxn), as.integer(dyn), as.integer(itn))
  C <- complex( real=rep(seq(-2.2, 1.0, length.out=Dx[1]), each=Dx[2] ),
                imag=rep(seq(-1.2, 1.2, length.out=Dx[2]), Dx[1] ) )
  C <- matrix(C,Dx[2],Dx[1])       # reshape as square matrix of complex numbers
  Z <- 0                     # initialize Z to zero
  X <- array(0, Dx) # initialize output 3D array
  for (k in 1:Dx[3]) {          # loop with 20 iterations
    Z <- Z^2+C               # the central difference equation
    X[,,k] <- exp(-abs(Z))   # capture results
  }
  write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=100)
}