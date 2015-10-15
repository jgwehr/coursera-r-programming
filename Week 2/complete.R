complete <- function (directory, id = -1) {
  
  ##Validations
  stopifnot(dir.exists(directory))
  
  fileList <- list.files(directory, full.names=TRUE) ##Get the full file names
  
  completeSet <- data.frame()
  
  ## allow for empty params
  if (is.numeric(id) & id < 0) {
    id <- 1:length(fileList)
  }
  
  for (csvi in id) {
    ## Note that we could validate the file exists. But, as we've just gotten the actual name,
    ##  the file should still exist except in very rare cases
    
    fileTemp <- read.csv(fileList[csvi])
    fileSubset <- subset(fileTemp,complete.cases(fileTemp))
    
    rows <- nrow(fileSubset)
    
    completeSet <- rbind(completeSet, cbind(csvi,rows))
  }
  
  colnames(completeSet) <- c("id", "nobs")
  return (completeSet)
  
}


## https://github.com/derekfranks/practice_assignment/blob/master/Practice_Assignment.pdf