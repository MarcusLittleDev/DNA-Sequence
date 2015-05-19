CodonMatches <- function(scMatrix,row,col){
	  matches <- rep(0, times = nrow(scMatrix))
        if(col != ncol(scMatrix)){codon <- paste(scMatrix[row,col], scMatrix[row,col+1], sep = "")
	      }else{return(matches)}	
    
        for(i in 1:nrow(scMatrix)){
                matches[i] <- 0
                for(n in 1:(ncol(scMatrix)-1)){
                        if(i == row){break}
                        if(scMatrix[i,n] != "NA"){codonTwo <- paste(scMatrix[i,n], scMatrix[i, n+1], sep ="")}
                      	else{break}
                  #compare codons
		            if(codon == codonTwo){matches[i] <- matches[i] + 1}
                }
        }
        return(matches)
}

UpdateSeqMatches <- function(seqMatches, row, codonMatches){
        for(i in 1:nrow(seqMatches)){
                seqMatches[row, i] <- seqMatches[row, i] + codonMatches[i]
        }
        return(seqMatches)
}

#increments to the next codon to compare
NextCodon <- function(scMatrix){
        seqMatches <- matrix(data = 0,nrow = nrow(scMatrix), ncol = nrow(scMatrix))
        for(i in 1:nrow(scMatrix)){
                for(n in 1:ncol(scMatrix)){
                        if((scMatrix[i, n] == "NA")){break}
                        codonMatches <- CodonMatches(scMatrix, i, n)
                        print(codonMatches)
                        seqMatches <- UpdateSeqMatches(seqMatches, i, codonMatches)
                }
        }
        
        return(seqMatches)
}


