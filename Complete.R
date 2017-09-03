complete <- function(directory, id = 1:332) {
  
  filelist <- list.files(path=directory, pattern=".csv",full.names = TRUE)
  
  nobs <- numeric()
  
  for (i in id) {
    
    data <- read.csv(filelist[i])
    nobs <- c(nobs,sum(complete.cases(data)))
    y <- data.frame(i, nobs)
    z <- rbind(z, y)
  }
  
  data.frame(id, nobs)
  
}