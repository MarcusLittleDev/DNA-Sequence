OutputResults <- function(compareResult, originalMatrix){
  SequenceNumber <- vector()
  Matches <- vector()
  Sequence <-vector()
  DNAResults <- vector()
	for(i in 1:nrow(compareResult)){
		strHolder <- ""
		SequenceNumber <- c(SequenceNumber, paste("Sequence ", i, sep = ""))
		for(t in 1:ncol(originalMatrix)){
			if(originalMatrix[i,t] == "NA"){break}
			strHolder <- paste(strHolder, originalMatrix[i,t], sep = "-")	
		}
		Sequence <- c(Sequence, strHolder)
    matchhelp <- vector()
		for(n in 1:nrow(compareResult)){
			if(n != i && (compareResult[i,n] != 0)){matchhelp <- paste(matchhelp, " ", compareResult[i, n], "matches in sequence", n, "---")}	
		}
    Matches <- c(Matches, matchhelp)
	}
  DNA <- cbind(SequenceNumber, Sequence, Matches)
  return(DNA)
}

        
