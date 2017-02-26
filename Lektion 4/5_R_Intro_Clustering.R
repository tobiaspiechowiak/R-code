# Filename: 5_R_Intro_Clustering_v6.R
# jaas, February 2017
# 
##############################################################################
# Objective: 
# Introduce the common steps in cluster analysis, following the
# steps described in Chap. 16 "Cluster analysis", pp. 371- [Kabacoff, 2015].
# 
#                 "R Intro Clustering"  TABLE OF CONTENTS
#
# 5.0: Enter the main R Language documentation, and install packages
#      needed for clustering.
#
# 5.1: Step 1: Choose appropriate attributes.
# 5.2: Step 2: Scale the data.
# 5.3: Step 3: Screen for outliers.
# 5.4: Step 4: Calculate distances.
# 5.5.0: Step 5: Select a clustering algorithm. 
#              Hierarchical and/or partitioning cluster analysis.
# 5.5.1: Step 5: Repeat # 5.5.0 using outlier substitution with median.
# 5.5.2: Step 5: Repeat # 5.5.0 using "single" link clustering.
# 5.5.3: Step 5: Repeat # 5.5.2 using outlier substitution with median.
# 5.6: Step 6: Obtain one or more cluster solutions.
# 5.7: Step 7: Determine the number of clusters present.
# 5.8: Step 8: Obtain final clustering solution.
# 5.9: Step 9: Visualize the results.
#
# 5.20: Examples using the Partitioning Clustering k-means
# 5.30: Examples using the Partitioning around medoids.
############################################################################## 
#
#                            REFERENCES
#
# [Adler, 2012] Joseph Adler, "R In a Nutshell", O'Reilly, 2012.
# [Charrad, 2014] Malika Charrad, Nadia Ghazzali, Veronique Boiteau,
#    Azam Niknafs, "NbClust: An R Package for Determining the Relevant
#    Number of Clusters in a Data Set", Journal of Statistical Software,
#    October 2014, Vol. 61, Issue 6, http://www.jstatsoft.org/
# [CRAN, 2015] "CRAN Task View: Cluster Analysis & Finite Mixture Models"
#     https://cran.r-project.org/web/views/Cluster.html
# [Filzmoser, 2005] Peter Filzmoser, Robert G. Garrett, Clemens Reimann
#     "Multivariate outlier detection in exploration geochemistry"
#     Computers & Geosciences 31 (2005) 579-587.
# [Glynn, 2015] Earl F. Glynn, "Reference Card for Colors" 
#       research.stowers-institute.org/efg/R/Color/Chart/
# [Kabacoff, 2015]  Robert I. Kabacoff, "R in Action", 
#     2'Ed, Manning Publications, 2015.
# [R Core, 2015] R Core Team and contributors worldwide, 
#     "The R Language Manual System", from help.start() at R Studio Console .
# [R Core, 2015a] R Core Team, "R Data import/Export" 
#        cran.r-project.org/doc/manuals/r-release/R-data.html
# [short, 2004] Tom Short, "Short Reference Card"
#     cran.r-project.org/doc/contrib/Short-refcard.pdf
# [Teetor, 2011] Paul Teetor, "R Cookbook", O'Reilley, 2011.
# [Torfs, 2014] Paul Torfs, Caludia Brauer, "A (very) Short Introduction to R", 
#        cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
# [Zhao, 2013] Yanchang Zhao, "R and Data Mining", Elsevier, 2013.
# [Zhao, 2013] Yanchang Zhao, "R Reference Card for Data Mining", January 2015.
#        www.rdatamining.com/docs/r-reference-card-for-data-mining
#
##############################################################################
# 5.0: Enter the main R Language documentation.
#      Install packages needed for clustering.
#
help.start()    # This is the main entry to the R project documentation.
opar.org <- par(no.readonly=TRUE)  # Remember the initial IO parameter settings.
loc='C:/R_packages/'  # Use this folder for packages.
#
install.packages("cluster",lib=loc)
install.packages("NbClust",lib=loc)
install.packages("modeltools",lib=loc)
install.packages("flexclust",lib=loc)
install.packages("timeDate",lib=loc)
install.packages("timeSeries",lib=loc)
install.packages("fBasics",lib=loc)
install.packages("fMultivar",lib=loc)
install.packages("ggplot2",lib=loc)
install.packages("outliers",lib=loc)
install.packages("dendextend",lib=loc)
install.packages("sgeostat",lib=loc)
install.packages("robustbase",lib=loc)
install.packages("data.table",lib=loc)
install.packages("pls",lib=loc)
install.packages("robCompositions",lib=loc)
install.packages("mvoutlier",lib=loc)
install.packages("rattle",lib=loc)
#
# Cluster validation and stability
#
install.packages("fpc",lib=loc)
install.packages("clv",lib=loc)
install.packages("clValid",lib=loc)
#
library("cluster",lib=loc)
library("NbClust",lib=loc)
library("modeltools",lib=loc)
library("flexclust",lib=loc)
library("timeDate",lib=loc)
library("timeSeries",lib=loc)
library("fBasics",lib=loc)
library("fMultivar",lib=loc)
library("ggplot2",lib=loc)
library("outliers",lib=loc)
library("dendextend",lib=loc)
library("sgeostat",lib=loc)
library("robustbase",lib=loc)
library("data.table",lib=loc)
library("pls",lib=loc)
library("robCompositions",lib=loc)
library("mvoutlier",lib=loc)
library("rattle",lib=loc)
#
# Cluster validation and stability
#   
library("fpc",lib=loc)
library("clv",lib=loc)
library("clValid",lib=loc)
#
######################################################################
# 5.1: Step 1: Choose appropriate attributes.
#
# Example p. 373 [Kabacoff, 2015]
data(nutrient, package="flexclust")
str(nutrient)
head(nutrient, 4)    # Display upper 4 rows from the dataset 
#
######################################################################
# 5.2: Step 2: Scale the data.
#      The data scaling is included in Step. 5.
#
######################################################################
# 5.3: Step 3: Screen for outliers.
#      This step is exemplified using ref. [Filzmoser, 2005].
#
# Ref. [Kabacoff, 2015] p. 371 
# screen and remove univariate  outliers using the package: outliers 
# install.packages("outliers")   # Moved to top of this script.
# install.packages("mvoutlier")  # Moved to top of this script.
# library(outliers)
# library(mvoutlier)
# help(package="outliers")    # Single variable outliers.
# help(package="mvoutliers")  # Multivariable outliers.
#
# Demonstrate the function symbol.plot(), ref. [Filzmoser, 2005].
# Objective: A method for multivariate outlier detection able 
#            to distinguish between extreme values of a normal 
#            distribution and values originating from a different 
#            distribution (outliers).
#            Method: Find subset of observations, h, with 
#                    MCD (Minimum Covariance Determinant).
# 
# create data matrices with two different distributions:
# Matrix x: Two column vectors with 100 rows of standardized normal var.
x <- cbind(rnorm(100), rnorm(100))
# Matrix y: Two column vectors with 10 rows of normal var. mean=5, std=1
y <- cbind(rnorm(10, 5, 1), rnorm(10, 5, 1))
# Matrix z: Two column vectors, each with 110 rows. 
z <- rbind(x,y)
str(z)       # Check structure of resulting z matrix
head(z, 10)  # Check the top 20 rows in z.'
par(opar.org)
plot(z[,1],z[,2])
title("Raw data from two distributions.")
#
par(opar.org) 
pdf("fig_5_3_raw_data.pdf") # Generate pdf plot.
plot(z[,1],z[,2])   # Plot 110 datapoints.
title("Raw data from two distributions.")
dev.off()
par(opar.org)
#
# Use symbol.plot from package mvoutliers
symbol.plot(z, quan=0.75)
par(opar.org) 
#
pdf("fig_5_3_symbol.pdf") # Generate pdf plot.
# Use 0.75*110 observations for estimating the 
# mcd (minimum covariance determinant), cf. manual ?symbol.plot()
symbol.plot(z, quan=0.75)   
dev.off()
par(opar.org)
#
######################################################################
# 5.4: Step 4: Calculate distances.
#
# Compute the distance matrix between the first 4 rows of nutrient,
# using the dist() function in R base installation.
# dist() contains the following distances using ?dist()
#        "euclidean", "maximum", "manhattan", 
#        "canberra", "binary", "minkowski"
# 
?dist()                # Check manual.
d <- dist(nutrient)    # 
as.matrix(d)[1:4,1:4]  # Symmetric distance matrix, with 0 diagonal.
                       # Notice the very different number ranges
                       # of the variables.
# If mixed data types: binary, nomial (category), ordinal (eg. Likert) 
# and continous (e.g. temperature), use the daisy() function in the 
# cluster package.
# Example on packages for clustering on mixed types:
# Functions for agglomerative clustering: agnes()
# Functions for partitionng around medoids: pam().
######################################################################
# 5.5: Step 5: Select a clustering algorithm.
# Average-linkage clustering of neutrient data. 
# Listing 16.1 p. 375 [Kabacoff, 2015.
#
data(nutrient, package="flexclust")
?tolower()          # Check manual. 
row.names(nutrient) <- tolower(row.names(nutrient))
?scale()            # Check manual for the scaling function.
nutrient.scaled <- scale(nutrient) # Scale all variables to
                                   #  mean = 0 and spread = 1.
# Check the scaled variables properties.
#    Mean values = 0
#    Standard deviations = 1.
#
attributes(nutrient.scaled)
summary(nutrient.scaled)           # Verify that mean values are = 0.
#
# Check that the standard deviations after scaling are = 1.
rows <- nrow(nutrient.scaled)         # Number of rows in data frame
energy <- nutrient.scaled[1:rows,1]   # energy vector
protein <- nutrient.scaled[1:rows,2]  # protein vector
fat <- nutrient.scaled[1:rows,3]      # fat vector
calcium <- nutrient.scaled[1:rows,4]  # calcium vector
iron <- nutrient.scaled[1:rows,5]     # iron vector
#
?sd()                                 # Manual for standard deviation.
sd_energy <- sd(energy); sd_energy    # sd = 1
sd_protein <- sd(protein); sd_protein # sd = 1
sd_fat <- sd(fat); sd_fat             # sc =1
sd_calcium <- sd(calcium); sd_calcium # sd = 1
sd_iron <- sd(iron); sd_iron # sd = 1
#
# Plot histograms of the normalized variables.
#
par(opar.org)
par(mfrow=c(2,3)) 
hist(energy, main="Scaled Energy")
hist(protein, main="Scaled Protein" )
hist(fat, main="Scaled Fat")
hist(calcium, main="Scaled Calcium")
hist(iron, main="Scaled Iron")
par(opar.org) 
#
pdf("fig_5_1_hist.pdf")
par(mfrow=c(2,3)) 
hist(energy, main="Scaled Energy")
hist(protein, main="Scaled Protein" )
hist(fat, main="Scaled Fat")
hist(calcium, main="Scaled Calcium")
hist(iron, main="Scaled Iron")
dev.off()
par(opar.org) 
#
str(nutrient.scaled)
#
# Display the euclidean distance matrix of 
#  nutrient.scaled
#
?dist()                                # Manual for dist()
d_eucli <- dist(nutrient.scaled,"euclidean")
d_eucli
#
attributes(d_eucli)
summary(d_eucli)                         # Check 
#
par(opar.org)
fit.average_eucli <- hclust(d_eucli, method="average")
plot(fit.average_eucli, hang=-1, cex=0.8, 
     main="Average Linkage Clustering, Euclidean")
# hang=-1, the labels are below the plot, rotated 90 Degree.
# cex=.8, scale the text cx times, c.f. [Kabacoff, 2015] p. 53.
#
par(opar.org)
pdf("fig_5_2_AV_Link_Clust.pdf")
plot(fit.average_eucli, hang=-1, cex=0.8, 
     main="Average Linkage Clustering, Euclidean")
dev.off()
par(opar.org) 
#
# It is proposed to repeat for some other distance measures, and 
# compare the resulting clustering trees by plotting.
#####################################################################
# 5.6: Step 6: Obtain one or more cluster solutions.
# 5.7: Step 7: Determine the number of clusters present.
#
# Selecting the number of clusters, p.376 [Kabacoff, 2015]
par(opar.org)
nc <- NbClust(nutrient.scaled, distance="euclidean", 
              min.nc=2, max.nc=15, method="average")
table(nc$Best.n[1,])
barplot(table(nc$Best.n[1,]),
        xlab="Number of clusters", ylab="Number of criteria",
        main="Number of Clusters Chosen among 26 Criteria.")
par(opar.org)
#
pdf("fig_5_3_Number_of_Clusters.pdf")
barplot(table(nc$Best.n[1,]),
        xlab="Number of clusters", ylab="Number of criteria",
        main="Number of Clusters Chosen among 26 Criteria.")
dev.off()
par(opar.org) 
######################################################################
# 5.8: Step 8: Obtain final clustering solution.
# 
# Listing 16.3 page 377 [Kabacoff, 2015]
#
?cutree()                  # Manual for tree cutting. 
clusters <- cutree(fit.average_eucli, k=5) # Use k=5 groups as desired.
table(clusters)
aggregate(nutrient, by=list(cluster=clusters), median)
#
aggregate(as.data.frame(nutrient.scaled), by=list(cluster=clusters), 
          median)
par(opar.org)
#
######################################################################
# 5.9: Step 9: Visualize the results.
#
# Listing 16.3 page 377 [Kabacoff, 2015]
#
par(opar.org)     
plot(fit.average_eucli, hang=-1, cex=0.8,
     main="Average Linkage Clustering\n k=5 Cluster Solution.")
rect.hclust(fit.average_eucli, k=5) # Display the k=5 cluster solution.
#
par(opar.org)
pdf("fig_5_4_ALC_k_5_Clust.pdf")
plot(fit.average_eucli, hang=-1, cex=0.8,
     main="Average Linkage Clustering\n k=5 Cluster Solution.")
rect.hclust(fit.average_eucli, k=5) # Display the k=5 cluster solution.
dev.off()
par(opar.org)
######################################################################
# 5.20: Examples using the Partitioning Clustering k-means
#
# Ref. page 379 [Kabacoff, 2015] Plotting function of k-means clusters.
#
#install.packages("rattle",lib="C:/R_packages/") # Installed on top of script.
#library("rattle",lib="C:/R_packages/") moved to top of script.
data(wine, package="rattle")
str(wine)
head(wine)
#
df <- scale(wine[-1])              # Scale 
wssplot <- function(data, nc=15, seed=1234){ 
  wss <- (nrow(data)-1)*sum(apply(data,2,var)) 
      for (i in 2:nc){ 
           set.seed(seed) 
           wss[i] <- sum(kmeans(data, centers=i)$withinss)} 
           plot(1:nc, wss, type="b", xlab="Number of Clusters", 
          ylab="Within groups sum of squares")} 
#
wssplot(df)
par(opar.org)
#
barplot(table(nc$Best.n[1,]),
        xlab="Number of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criterias.")
set.seed(1234)
fit.km <- kmeans(df, 3, nstart=25)
table(nc$Best.n[1,])
#
fit.km$centers
#
aggregate(wine[-1], by=list(cluster=fit.km$cluster), mean)
#
# Quality of fit
ct.km <- table(wine$Type, fit.km$cluster)
ct.km
#
# library(flexclust) moved to top of script
randIndex(ct.km)
#
# Plot the CCC (Cubic Cluster Criteria) from NbClust() for assessing
# the quality of the clustering, cf. [Kabacoff, 2015] page 387.
# If CCC is negative and decreasing for increasing number of clusters, 
# then the dataset has a tendency to unimodality.
plot(nc$All.index[,4], type="o", ylab="CCC", 
     xlab="Number of clusters", col="blue")
# The reference nc$All.index[,4] refers to the CCC index.
pdf("fig_5_4_CCC_index_Wine.pdf")
# then the dataset has a tendency to unimodality.
plot(nc$All.index[,4], type="o", ylab="CCC", 
     xlab="Number of clusters", col="blue")
dev.off()
par(opar.org)
######################################################################
# 5.30: Examples using the Partitioning around medoids
#
# library("cluster",lib=loc) moved to top of script.
set.seed(1234)
fit.pam_3 <- pam(wine[-1], k=3, stand=TRUE)
fit.pam_3$medoids
clusplot(fit.pam_3, main="Bivariate Cluster Plot, k=3")
par(opar.org)
#
pdf("fig_5_5_Partitioning_3.pdf")
clusplot(fit.pam_3, main="Bivariate Cluster Plot, k=3")
dev.off()
par(opar.org)
#
ct.pam_3 <- table(wine$Type, fit.pam_3$clustering)
# library(flexclust) moved to top of script
randIndex(ct.pam_3)
#
# Repeat for k=4
#
set.seed(1234)
fit.pam_4 <- pam(wine[-1], k=4, stand=TRUE)
fit.pam_4$medoids
clusplot(fit.pam_4, main="Bivariate Cluster Plot, k=4")
par(opar.org)
#
pdf("fig_5_6_Partitioning_4.pdf")
clusplot(fit.pam_4, main="Bivariate Cluster Plot, k=4")
dev.off()
par(opar.org)
#
######################################################################
