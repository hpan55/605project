
rm(list=ls())

library(reshape2)
library(stringr)
library(dplyr)
library(data.table)
library(WGCNA)

args=(commandArgs(TRUE))
if(length(args)==2){
    LDLRH=(args[1])
    liverm=(args[2])
}else{
    print('usage: Rscript gp2.R <template spectrum> <data directory> \n')
}


target <- read.table(LDLRH,sep = "\t")
data <- read.table(paste0("liver_mouse",liverm,'.txt'),sep = "\t")
gene <- rownames(data)
data <- t(data)
colnames(data) <- gene
bicor <- bicorAndPvalue(x=target, y=data,alternative = "two.sided")
Bicor <- melt(bicor$bicor)
p <- melt(bicor$p)
remove(bicor)
result <- Bicor
colnames(result) <- c("gene_symbol_1", "gene_symbol_2", "bicorrelation")
result <- data.frame(result)
result$p <- p$value
result <- result[order(result$gene_symbol_2,partial = abs(result$bicorrelation),decreasing = T,na.last = T),]
remove(p)
remove(Bicor)

result <- result[!is.na(result$p),]
result$p <- ifelse(result$p==0,"<2.225074e-308",as.character(result$p))
write.csv(result,file = paste0("bicor_protein_mouse",liverm,".csv"),row.names = F,sep = ",")
