source("ReadFile.R")
source("SequenceEquivalent.R")
source("SeqCompare.R")
source("SeqOutput.R")

GeneAnalysis <- function(fileInput){
  
  filename <- fileInput
  originalMatrix <- ReadFile(filename)
  sameCodeMatrix <- CreateSCMatrix(originalMatrix)
  comparisonMatrix <- NextCodon(sameCodeMatrix)
  return(OutputResults(comparisonMatrix, originalMatrix))
}