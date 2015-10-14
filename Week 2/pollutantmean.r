pollutantmean <-function (directory, pollutant, ids = 0) {
  ##Read all csvs in [directory]
  
  ##Validations
  stopifnot(dir.exists(directory))
  stopifnot(pollutant == "sulfate" | pollutant == "nitrate")
  ##stopifnot(is.integer(ids))
 
  fileList <- list.files(directory, full.names=TRUE) ##Get the full file names
  fileList <- fileList[ids] ##new list of only the names we care about
  
  ##Initiate
  fileData <- data.frame()
  
  ##Iterate
  for (csvi in fileList) {
    fileData <- rbind(fileData,read.csv(csvi))
  }
  
  rm(fileList)##Cleanup
  

  return ( mean(fileData[,pollutant], na.rm=TRUE)) ##subset the pollutant category and remove na
  

##  for(csvi in ids) {
    ##csv <- sprintf(fmt="%03i",csvi)
    ##filename <- paste0(directory,"/",csv,".csv", sep="")
  ##  dim(fileList)
    ##meanTable <- read.csv(directory)
##  }

}