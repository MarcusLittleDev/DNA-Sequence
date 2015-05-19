CreateSCList <- function(){
        START <- c("TAC")
        CGA <- c("CGA","CGG","CGT","CGC")
        GCA <- c("GCA","GCG","GCT","GCC","TCT","TCC")
        TTA <- c("TTA","TTG")
        CTA <- c("CTA","CTG")
        ACA <- c("ACA","ACG")
        GTT <- c("GTT","GTC")
        CTT <- c("CTT","CTC")
        GTA <- c("GTA","GTG")
        TAA <- c("TAA","TAG","TAT")
        STOP <- c("ATT","ACT","ATC")
        AAT <- c("AAT","AAC","GAA","GAG","GAT","GAC")
        TTT <- c("TTT","TTC")
        CCA <- c("CCA","CCG","CCT","CCC")
        AAA <- c("AAA","AAG")
        GGA <- c("GGA","GGG","GGT","GGC")
        AGA <- c("AGA","AGG","AGT","AGC","TCA","TCG")
        TGA <- c("TGA","TGG","TGT","TGC")
        ATA <- c("ATA","ATG")
        CAA <- c("CAA","CAG","CAT","CAC")

        sameCodeList <- list(START,CGA, GCA, TTA, CTA, ACA, GTT, CTT, GTA, TAA, STOP, AAT, TTT, CCA, AAA, GGA, AGA, TGA, ATA, CAA)
        return(sameCodeList)
}

CheckEquivalent <- function(codon,scList){
        changeSC <- "NA"
        notFound <- TRUE
        counter <- 1
        scNames <- c("START","CGA","GCA","TTA","CTA","ACA","GTT","CTT", "GTA","TAA","STOP","AAT","TTT","CCA","AAA","GGA","AGA","TGA","ATA","CAA")

        while(notFound){
                if(codon != "NA"){
                        result <- (scList[[counter]] != codon)
                        if(all(result) == FALSE){
                                changeSC <- scNames[counter]
                                notFound <- FALSE
                        }
                }
                counter <- counter + 1
                if(counter > 20){notFound <- FALSE}
        }
        return(changeSC)

}

CreateSCMatrix <- function(mat){
        seqMatrix <- mat
        scList <- CreateSCList()

        for(i in 1:nrow(seqMatrix)){
                for(n in 1:ncol(seqMatrix)){
                        seqMatrix[i,n] <- CheckEquivalent(seqMatrix[i,n], scList)
                }
        }
        return(seqMatrix)
}

