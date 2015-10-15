corr <- function(directory, threshold = 0) {
  ## a directory of data files and a threshold for complete cases and calculates the
  ##  correlation between sulfate and nitrate for monitor locations where the number
  ##  of completely observed cases (on all variables) is greater than the threshold
  
  
  ## Validation
  stopifnot(threshold >= 0)
  stopifnot(dir.exists(directory))
  
  
  
  fileList <- list.files(directory, full.names=TRUE) ##Get the full file names
  
  completeSet <- data.frame() ##Empty data.frame to hold filenames, etc
  
  for (csvi in fileList) {
    stopifnot(file.exists(csvi))
    
    fileTemp <- read.csv(csvi)
    fileSubset <- subset(fileTemp,complete.cases(fileTemp))
    
    rows <- nrow(fileSubset)
    
    completeSet <- rbind(completeSet, rows)
  }
  
  ##Garbagecollect
  rm(fileTemp)
  rm(fileSubset)
  rm(rows)
  
  ## Merge the completSet data to the list of files
  fileList <- cbind(fileList,completeSet)
  colnames(fileList) <- c("filename", "nobs")
  rm(completeSet)
  
  ## Select only those files above our threshold
  completeList <- fileList[which(fileList$nobs > threshold),]
  
  
  
  
  ##        OLD. Initial approach. But the course forces the output of fn Complete
  ## So, you can't attach file names to the completedcase vectors. So... you have to
  ## retrace to get that. Waste of time.
  
  ## Understand the number of completed cases for each file in the entire directory
  ## completeList <- complete(directory)
  
  ## Select only those files above our threshold
  ## completeList <- completeList[which(completeList$nobs > threshold),]
  
  ## At this point, this part of the project looks super inefficient..
}

test <- corr('specdata', 150)