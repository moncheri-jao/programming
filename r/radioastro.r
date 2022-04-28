setwd("~/Dropbox/lab/labastro/5-7/esp7/editedforr")
library(Hmisc)
temp <- list.files(pattern="*.txt")
for (i in 1:length(temp)) {
	assign(temp[i], read.table(temp[i]))
}

calib <- function(x) {
	theta <- 0.0374*x-18.4
	return(theta)
}
