path.data <- 'C:\\Users\\ULB\\Documents\\R\\GSEA_Combat_blasted'

lnc.cvsn <- read.table(file.path(path.data, 'lnc_deregulated_forGSEA_allSamples.txt'), sep='\t', dec='.', header=TRUE, row.names=1, check.names=FALSE, na.strings='')
cod.cvsn <- read.table(file.path(path.data, 'allmRNAs_forGSEA_allSamples.txt'), sep='\t', dec='.', header=TRUE, row.names=1, check.names=FALSE, na.strings='')
lnc.C <- lnc.cvsn[,lnc.cvsn[1,]=="cancer"]
lnc.C <- lnc.C[-1,]
cod.C <- cod.cvsn[,cod.cvsn[1,]=="cancer"]
cod.C <- cod.C[-1,]
name.gene <- rownames(cod.C)
name.lnc <- rownames(lnc.C)

lnc.C <- as.matrix(lnc.C, drop=F)
lnc.C <- apply(lnc.C, 2, as.double)
rownames(lnc.C) <- name.lnc
cod.C <- as.matrix(cod.C, drop=F)
cod.C <- apply(cod.C, 2, as.double)
rownames(cod.C) <- name.gene
# "bla"
#bla2
#bla3

i.cod.C.1 <- sample(1:ncol(cod.C), (ncol(cod.C)-1)/2)
i.cod.C.2 <- setdiff(1:ncol(cod.C), i.cod.C.1)
cod.C.1 <- cod.C[,i.cod.C.1]
cod.C.2 <- cod.C[,i.cod.C.2]
lnc.C.1 <- lnc.C[,i.cod.C.1]
lnc.C.2 <- lnc.C[,i.cod.C.2]

write.table(cod.C.1, file=file.path(path.data, 'cod.blasted.part1.txt'), sep='\t', quote=F)
write.table(cod.C.2, file=file.path(path.data, 'cod.blasted.part2.txt'), sep='\t', quote=F)
write.table(lnc.C.1, file=file.path(path.data, 'lnc.blasted.part1.txt'), sep='\t', quote=F)
write.table(lnc.C.2, file=file.path(path.data, 'lnc.blasted.part2.txt'), sep='\t', quote=F)