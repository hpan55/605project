```{r echo=FALSE, message=FALSE, warning=FALSE}
library(diagram)
names <- c("getData.sh", "readData.sub(.sh/.R)", "gene_human.sub(.sh/.R)", "gene_mouse.sub(.sh/.R)", "merge.sh")
M <- matrix(nrow = 5, ncol = 5, byrow = TRUE, data = 0)
M[3, 2] <- M[2, 1] <- M[4, 2] <- M[5, 3] <- M[5, 4] <-  ""
plotmat(M, pos = c(1, 1, 2, 1), curve = 0, name = names, lwd = 1,
         box.lwd = 2, cex.txt = 0.8, box.type = "rect", box.prop = 0.3)
```
