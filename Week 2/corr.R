source('complete.R')

corr <- function(directory, threshold = 0) {
  ## a directory of data files and a threshold for complete cases and calculates the
  ##  correlation between sulfate and nitrate for monitor locations where the number
  ##  of completely observed cases (on all variables) is greater than the threshold
  
  
  ## Validation
  stopifnot(threshold >= 0)

  
  completeList <- complete(directory) #Get a list of the completed cases for each file in dir
  nobsAboveThresh <- (completeList$nobs > threshold) ##Logical vector of those that meet our requirements
  
  
  ## At this point, this part of the project looks super inefficient..
  ##
  ## fn complete has only returned ids, which are useless and require extra processing
  ##    If the function returned the file names, we'd save a lot of time...
  
  ## Get the same list of files fn complete did...
  fileList <- list.files(directory, full.names=TRUE) ##Get the full file names
  
  ## Only get the file names we care about
  filesAboveThreshold <- fileList[nobsAboveThresh]
  
  ##garbagecollect
  rm(completeList)
  rm(threshold)
  rm(nobsAboveThresh)
  rm(fileList)
  
  
  setOfCorrelations <- vector()
  
  for (fileName in filesAboveThreshold) {
    stopifnot(file.exists(fileName)) ##Validate
    
    ## The file again
    fileTemp <- read.csv(fileName)
    
    setOfCorrelations <- rbind(setOfCorrelations,cor(fileTemp$nitrate, fileTemp$sulfate, use="complete.obs"))
  }
  
  rm(filesAboveThreshold) ##gc
  
  return (as.numeric(setOfCorrelations))
}