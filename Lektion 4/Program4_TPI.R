
help.start()    # This is the main entry to the R project documentation.
opar.org <- par(no.readonly=TRUE)  # Remember the initial IO parameter settings.
loc<-'c:/Users/tobiasp/Documents/Big Data/R_packages/'  # Use this folder for storing packages
WD <- 'c:/Users/tobiasp/Documents/Big Data/R-code/Lektion 4/'

setwd(WD)

#install flexclust + rattle packages
install.packages("flexclust",lib=loc)
install.packages("rattle",lib=loc)


#Q1#####################################
data(nutrient,package="flexclust")
nutrient.scaled <- scale(nutrient)
d <- dist(nutrient.scaled,method="euclidean")

#Average linkage cluster 
pdf("average scaled cluster.pdf")
fit.average <- hclust(d,method="average")
plot(fit.average,hang=-1, cex=.8,main="Average linkage cluster")
rect.hclust(fit.average,k=5) #5 clusters seems a good fit for these data set
dev.off()


#Single linkage cluster 
fit.single <- hclust(d,method="single")
library(NbClust)
nrc <- NbClust(nutrient.scaled,distance = "euclidean",min.nc = 2,
               max.nc = 15,method = "single")
barplot(table(nrc$Best.nc[1,]),xlab="Number of clusters",main = "nr cluster for 
        single linkage")
pdf("single scaled cluster.pdf")
plot(fit.single,hang=-1,cex=.8, main="Single linkage cluster")
rect.hclust(fit.single,k=max(nrc$Best.nc[1,])) #15 clusters seem to be best for single
#linkage
dev.off()
#single linkage tends to create more clusters than average linkage? Single linkage 
#tends to prefer "lengthy" distributions -> more cluster?
###################################################


#Q2###################################################
#Wine data from ics.uci.edu (package rattle)
data(wine,package = "rattle")
head(wine,5)
nwine <- scale(wine[-1]) #normalize without first column
head(nwine)

#looking at all 30 criteria in barplot (NbCLust is loaded)
nrc <- NbClust(nwine,min.nc = 2, max.nc = 15, method = "kmeans")
pdf("Optimal number of cluster.pdf")
barplot(nrc$Best.nc[1,],ylab = "Nr cluster",xlab = "method")
dev.off()

#example index = ccc (Beale,1983) (15 cluster optimal, see pdf "Optimal number of cluster.pdf")
fit.PAM.ccc <- pam(nwine,k = 15,stand = FALSE)
library(cluster)  #load clusplot
pdf("PAM of wine data with 15 cluster.pdfwine data with 15 cluster.pdf")
plot(fit.PAM.ccc,main="PAM wine data 15 cluster")

dev.off()

#example index = trcovw (3 cluster optimal, see pdf "Optimal number of cluster.pdf")
fit.PAM.ccc <- pam(nwine,k = 3,stand = FALSE)
library(cluster)  #load clusplot
pdf("PAM of wine data with 3 cluster.pdf")
clusplot(fit.PAM.ccc,main="PAM wine data 15 cluster")
dev.off()
#It seems that ccc metric is not very appropriate for this dataset since 
#most of the the indices propose 3 cluster. Visually it makes also most sense
##########################################################


#Q3#####################################################
#PAM
#k = 3 for wine data
fit.Pam.k3 <- fit.PAM.ccc
pdf("PAM of wine data with 3 cluster.pdf")
clusplot(fit.Pam.k3,main="PAM wine data 3 cluster")
dev.off()
ct.k3 <- table(wine$Type,fit.Pam.k3$clustering) #cross-tabulation table for k = 3
ri.k3 <- randIndex(ct.k3) #rand Index for k = 3: 0.75

#k = 4 for wine data
fit.Pam.k4 <- pam(nwine,k = 4,stand = FALSE)
pdf("PAM of wine data with 4 cluster.pdf")
clusplot(fit.Pam.k4,main="PAM wine data 4 cluster")
dev.off()
ct.k4 <- table(wine$Type,fit.Pam.k4$clustering) #cross-tabulation table for k = 4
ri.k4 <- randIndex(ct.k4) #rand Index for k = 4: 0.66

#k = 5 for wine data
fit.Pam.k5 <- pam(nwine,k = 5,stand = FALSE)
pdf("PAM of wine data with 5 cluster.pdf")
clusplot(fit.Pam.k5,main="PAM wine data 5 cluster")
dev.off()
ct.k5 <- table(wine$Type,fit.Pam.k5$clustering) #cross-tabulation table for k = 5
ri.k5 <- randIndex(ct.k5) #rand Index for k = 5: 0.53

#k = 6 for wine data
fit.Pam.k6 <- pam(nwine,k = 6,stand = FALSE)
pdf("PAM of wine data with 6 cluster.pdf")
clusplot(fit.Pam.k6,main="PAM wine data 6 cluster")
dev.off()
ct.k6 <- table(wine$Type,fit.Pam.k6$clustering) #cross-tabulation table for k = 6
ri.k6 <- randIndex(ct.k6) #rand Index for k = 6: 0.43
#K-means
fit.km.k3 <- kmeans(nwine,3,nstart = 25)
dev.off()
ct.km.k3 <- table(wine$Type,fit.km.k3$cluster) #cross-tabulation table for k-means for 
#k = 3
ri.km.k3 <- randIndex(ct.km.k3) #rand Index for k-means with k = 3: 0.90

#cross-tabulation of the actual wine type (actual number = 3) with the cluster analysis as well 
#as the rand index reveals that a PAM with 3 cluster mirrors the real clustering of wine
#data to a high degree although k-means seems to perform better than PAM with this dataset
#
################################################


#Q4#############################################
#create the cluster
#four cluster mean 1, 2, 3, 4; std 0.2, 1, 0.7, 2
c1 <- cbind(rnorm(100,1,1), rnorm(100,1,1)) #x,y data cluster 1
c1 <- cbind(rep.int(1,100),c1)
c2 <- cbind(rnorm(100,2,1), rnorm(100,2,1)) #x,y data cluster 2
c2 <- cbind(rep.int(2,100),c2)
c3 <- cbind(rnorm(100,3,1), rnorm(100,3,1)) #x,y data cluster 3
c3 <- cbind(rep.int(3,100),c3)
c4 <- cbind(rnorm(100,4,1), rnorm(100,1,1)) #x,y data cluster 3
c4 <- cbind(rep.int(4,100),c4)
c5 <- rbind(c1,c2,c3,c4)

#normalize the data 
c5.scaled <- scale(c5[,2:3])

#plot them 
dev.new()
plot(c5.scaled) #plot the cluster 
title("4 cluster gaussian dist.")
par(opar.org)

#check first for cluster number in kmeans
library(NbClust)
nrCluster.kmeans <- NbClust(c5.scaled,distance = "euclidean",min.nc = 2,
               max.nc = 15,method = "kmeans")
pdf("Optimal number of cluster for Q4 (kmeans).pdf")
barplot(nrCluster.kmeans$Best.nc[1,],xlab = "method",ylab = "nr cluster")
dev.off()

#Most metrics from NbClust propose 4 cluster for k-means
#3 cluster 
fit.km.4 <- kmeans(c5,4,nstart = 25)
ct.km.4 <- table(c5[,1],fit.km.4$cluster) #cross-tabulation table for k = 5
ri.km.4 <- randIndex(ct.km.4) #rand Index for k = 5: 0.53

#check first for cluster number in PAM
library(NbClust)
nrCluster.pam <- NbClust(c5.scaled,distance = "euclidean",min.nc = 2,
                     max.nc = 15,method = "median")
pdf("Optimal number of cluster for Q4 (Pam).pdf")
barplot(nrCluster.pam$Best.nc[1,],xlab = "method",ylab = "nr cluster")
dev.off()

#Most metrics from NbClust propose 4 cluster for PAM
#4 cluster 
fit.pam.4 <- pam(c5.scaled,k = 4, stand = FALSE)
ct.pam.4 <- table(c5[,1],fit.pam.4$clustering) #cross-tabulation table for k = 5
ri.pam.4 <- randIndex(ct.pam.4) #rand Index for k = 5: 0.53
library(cluster)  #load clusplot
pdf("PAM of 2-D data.pdf")
clusplot(fit.pam.4,main="PAM of 2-D data with 4 cluster and st=1")
dev.off()
#k-means works better than PAM here. Both work really good for low st in the distributions.
#Get worse with higher st. With larger st NbClust gets more ambiguous with them amount of cluster (3 preferred)
################################################


