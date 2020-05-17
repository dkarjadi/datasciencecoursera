pollutantmean <- function(directory, pollutant, id = 1:332){
  old.dir<-getwd()
  setwd(directory)
  fileNames <- paste(id)
  for(i in id){
    if(i < 10){
      fileNames[i] <- paste("00",fileNames[i],".csv",sep = "")
          }
    if(i < 100 && i > 9){
      fileNames[i] <- paste("0", fileNames[i],".csv", sep = "")
    }
    else if (i > 99){
      fileNames[i] <- paste(fileNames[i], ".csv", sep = "")
    }
    theData <- read.csv(fileNames[1], header = TRUE)
    for(a in 2:332){
      theData <- rbind(theData,read.csv(fileNames[a]))
      
    }
    if (pollutant == 'nitrate') {
      nit<-data.frame(theData["nitrate"])
      mean(nit$nitrate, na.rm = TRUE)
    } else {
      sul<-data.frame(theData["sulfate"])
      mean(sul$sulfate, na.rm = TRUE)
    }
    
  }
    
  setwd(old.dir)
}

