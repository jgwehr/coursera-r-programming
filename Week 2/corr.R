corr <- function(directory, threshold = 0) {
  ## a directory of data files and a threshold for complete cases and calculates the
  ##  correlation between sulfate and nitrate for monitor locations where the number
  ##  of completely observed cases (on all variables) is greater than the threshold
  
  ##Validations
  stopifnot(dir.exists(directory))
  
  fileList <- list.files(directory, full.names=TRUE) ##Get the full file names
  
  completeSet <- data.frame()
  
}