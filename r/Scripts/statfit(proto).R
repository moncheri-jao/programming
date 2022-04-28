dati <- function () {
  txt <- readline(prompt = "Inserisci il nome del file con l'estensione ")
  s <- readline(prompt = "Inserisci il separatore dei decimali ")
  dt <- read.table(txt, dec = s)
  t <- lm(dt)
  yn <- readline(prompt = "Plot fit, plot dati con summary fit? {Voglio i dati([,2])} (pf[s], pd[s], {d(2)}) ")
  if (yn == "pfs") {
    t <- lm(dt)
    plot(t)
    return(summary(t))
  }
  if (yn == "pds") {
    plot(dt)
    t <- lm(dt)
    return(summary(t))
  }
  if (yn == "pf") {
    t <- lm(dt)
    plot(t)
    return(t)
  }
  if (yn == "pd") {
    plot(dt)
    t <- lm(dt)
    return(t)
  }
  if (yn == "d"){
    t <- lm(dt)
    summary(t)
    return(dt)
  }
  if (yn == "d2"){
    t <- lm(dt)
    summary(t)
    return(dt[,2])
  }
}

cut2 <- function (dt) {
  t <- dt[,2]
  return(t)
}