library(stringr)
load("download")
index <- which(str_detect(meta$Sample_characteristics_ch1,"liver"))
expression <- expression[,index]
rownames(expression) <- meta$genes
write.table(expression["LDLR",],file ="LDLR_human.txt",sep = "\t",row.names = T)
all <- nrow(expression)
foot <- ceiling(all/10)
for(i in 1:10){
  start <- foot*(i-1)+1
  count <- min(foot,all-start+1)
  liver <- expression[start:(start+count-1),]
  a<-i-1
  write.table(liver,file = paste0("liver_human",as.character(a),".txt"),sep = "\t",row.names = T)
}

rm(list=ls())

library(stringr)
load("download.1")
index <- which(str_detect(meta$Sample_characteristics_ch1,"liver"))
expression <- expression[,index]
rownames(expression) <- toupper(meta$genes)
write.table(expression["LDLR",],file ="LDLR_mouse.txt",sep = "\t",row.names = T)
all <- nrow(expression)
foot <- ceiling(all/10)
for(i in 1:10){
  start <- foot*(i-1)+1
  count <- min(foot,all-start+1)
  liver <- expression[start:(start+count-1),]
  a<-i-1
  write.table(liver,file = paste0("liver_mouse",as.character(a),".txt"),sep = "\t",row.names = T)
}


