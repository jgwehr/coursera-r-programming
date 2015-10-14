complete <- function (directory, id = 1) {
  
  ##Validations
  stopifnot(dir.exists(directory))
  
  fileList <- list.files(directory, full.names=TRUE) ##Get the full file names
  
  completeSet <- data.frame()
  
  for (csvi in id) {
    fileTemp <- read.csv(fileList[csvi])
    fileSubset <- subset(fileTemp,complete.cases(fileTemp))
    
    rows <- nrow(fileSubset)
    
    print(paste(csvi,rows))
    
  }
  
}



assert <- complete("specdata", c(2, 4, 8, 10, 12))