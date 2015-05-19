ReadFile <- function(fileName){
	inputVec <- vector() #Variable to hold entire sequence
  holderVec <- vector() #vector to temporarily store substrings
	codonSeparated <- list() #List to hold created substrings(codons)
	sequences <- matrix()
	inputVec <- scan(file = fileName, what = "character", sep = "\n", blank.lines.skip = TRUE)#scan file and input into vec
	inputVec <- toupper(inputVec)                   #change sequence string into all CAPS
  inputVec <- gsub(" ", "", inputVec)  #remove white spaces
  
  #populate list codonSeparator with Genomes
  for(i in 1:length(inputVec)){
    holderVec <- substring(inputVec[i], seq(1,nchar(inputVec[i]),3),seq(3,nchar(inputVec[i]),3))    #store substrings of 3 length into holderVec
    codonSeparated[[i]] <- holderVec  #insert Genome into codonSeparator
  }
  numInSeq <- 0 #counter to keep track of elements in each sequences
  tempCount <- 0
	maxLen <- 0  #the highest amount of elements in all sequences
	bool <- FALSE  #bool to track if elements should be stored
  hasStop <- FALSE

	#Calculates the maxLen for all Genomes
	for(i in codonSeparated){
	  for(n in 1:length(i)){
	    if(i[n] == "TAC"){bool <- TRUE}
	    while(bool == TRUE & n <=length(i)){
        tempCount <- tempCount + 1
	      if(identical(i[n],"ATT")|identical(i[n],"ACT")|identical(i[n],"ATC")){
          bool <- FALSE
          numInSeq <- numInSeq+tempCount
          tempCount <- 0
	      }
        n <- n + 1
	    }}
    if(numInSeq > maxLen){maxLen <- numInSeq}
    numInSeq <- 0
	  tempCount <- 0
	  bool <- FALSE
	}
	
  bool <- FALSE
	seqList <- list() #creates a list to hold each vector sequence
	seqHolder <- vector()
  genomeHolder <- rep("NA", maxLen)#creates a vector with the max length of elements set to NA
	holderCount <- 1		
	rCount <- 1    #tracks the number of row to store vector in list
  genomeCount <- 1
  
	#store relevent Genome data into list
	for(i in codonSeparated){
	  for(n in 1:length(i)){
	    if(i[n] == "TAC"){
        bool <- TRUE
	    }
	    while(bool == TRUE & n <=length(i)){
        seqHolder[holderCount] <- i[n]
        if(identical(i[n],"ATT")|identical(i[n],"ACT")|identical(i[n],"ATC")){
          bool <- FALSE
          for(q in seqHolder){
            genomeHolder[genomeCount] <- q
            genomeCount <- genomeCount + 1
          }
          seqHolder <- vector()
          holderCount <- 1
        }else{
          holderCount <- holderCount + 1
          n <- n + 1
        }}
	  }
	  seqHolder <- vector()
    holderCount <- 1
	  bool <- FALSE
	  seqList[rCount] <- list(genomeHolder)
	  genomeHolder <- rep("NA", maxLen)
    rCount <- rCount + 1
    genomeCount <- 1
	}
	    
      
	sequences <- do.call(rbind,seqList) #creates a matrix with values from list "seqList"
	
	return(sequences) #function returns matrix with each row as a sequence
}
