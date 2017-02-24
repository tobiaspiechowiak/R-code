
help.start()    # This is the main entry to the R project documentation.
opar.org <- par(no.readonly=TRUE)  # Remember the initial IO parameter settings.
loc<-'c:/Users/tpiechowiak/Documents/R/win-library/3.3'  # Use this folder for storing packages
WD <- 'c:/Users/tpiechowiak/R code/R-code/Lektion 4/'

setwd(WD)

#install flexclust package
install.packages("flexclust",lib=loc)


#Q1###############################
data(nutrient,package="flexclust")
nutrient.scaled <- scale(nutrient)
d <- dist(nutrient.scaled,method="euclidean")

#Average linkage cluster 
pdf("average scaled cluster.pdf")
fit.average <- hclust(d,method="average")
plot(fit.average,hang=-1, cex=.8,main="Average linkage cluster")
dev.off()


#Single linkage cluster 
pdf("single scaled cluster.pdf")
fit.single <- hclust(d,method="single")
plot(fit.single,hang=-1,cex=.8, main="Single linkage cluster")
dev.off()
###################################################
#THERE DOES NOT SEEM TO BE A DIFFERENCE?!

#Q2###################################################

