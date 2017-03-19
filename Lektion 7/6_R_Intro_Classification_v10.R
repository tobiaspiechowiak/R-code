# Filename: 6_R_Intro_Classification_v10.R
# jaas, March 2017
# 
##############################################################################
# Objective: 
# Introduce the common steps in data classification mainly following the
# Chap. 17 "Classification", pp. 339- [Kabacoff, 2015] and referencing
# Chap. 4 "Classification" and Chap. 9 "Support Vector Machines", [James, 2013].
# 
#                 "R Intro Classification"  TABLE OF CONTENTS
#
# 6.0: Enter the main R Language documentation, and install packages
#      needed for classification.
# 6.1: Preparing data for classification examples. p. 391 [Kabacoff, 2015].
# 6.2: Logistic regression example, p. 392 [Kabacoff, 2015].
# 6.3: Creating a decision tree, p. 394 [Kabacoff, 2015].
# 6.4: Conditional inference trees, p. 397 [Kabacoff, 2015].
# 6.5: Random forest, p. 399 [Kabacoff, 2015].
# 6.6.0: Support vector machines, p. 401 [Kabacoff, 2015].
# 6.6.1: SVM, [Meyer, 2015].
############################################################################## 
#
#                            REFERENCES
#
# [Adler, 2012] Joseph Adler, "R In a Nutshell", O'Reilly, 2012.
# [Charrad, 2014] Malika Charrad, Nadia Ghazzali, Veronique Boiteau,
#    Azam Niknafs, "NbClust: An R Package for Determining the Relevant
#    Number of Clusters in a Data Set", Journal of Statistical Software,
#    October 2014, Vol. 61, Issue 6.  www.jstatsoft.org
# [Charrad, 2015] Malika Charrad, Nadia Ghazzali, Veronique Boiteau,Azam Niknafs
#    "Package NbClust", Manual
#    cran.r-project.org/web/packages/NbClust/NbClust.pdf
# [Charrad, 2015a] Malika Charrad, Nadia Ghazzali, Veronique Boiteau, Azam Niknafs
#    "Package NbClust", code
#    cran.r-project.org/web/packages/NbClust/index.html
# [CRAN, 2015] "CRAN Task View: Cluster Analysis & Finite Mixture Models"
#     https://cran.r-project.org/web/views/Cluster.html
# [Fisher, 1936 ] R.A. Fisher, "The Use of Multiple Measurements in Taxonomic 
#    Problems", Annals of Eugenics, Volume 7, Issue 2, pages 179-188, Sep. 1936.  
# [Giorgino, 2009] Toni Giorgino, "Computing and Visualizing Dynamic Time 
#    Warping Alignments in R: The dtw Package", Journal of Statistical Software
#    August 2009, Volume 31, Issue 7, www.jstatsoft.org
# [Giorgino, 2015] Toni Giorgino, "Package Dynamic Time Warping Algorithms"
#    cran.r-project.org/web/packages/dtw/index.html
# [Goslee, 2007] Sarah C. Goslee, Dean L. Urban, "The ecodist Package for 
#    Dissimilarity-based Analysis of Ecological Data", 
#    Journal of Statistical Software, September 2007, Volume 22, Issue 7,
#    www.jstatsoft.org
# [Goslee, 2015] Sarah Goslee, "package ecodist", 2015.
#    cran.r-project.org/web/packages/ecodist/index.html
# [Gower, 1971] J.C. Gower, "A General Coefficient of Similarity and Some of Its 
#    Properties", Biometrics, Vol. 27, No. 4. (Dec., 1971), pp. 857-871.
# [Glynn, 2015] Earl F. Glynn, "Reference Card for Colors" 
#   research.stowers-institute.org/efg/R/Color/Chart/
# [Greenacre, 2013] Michael Greenacre, Raul Primicerio 
#   "Multivariate Analysis of Echological Data", 2013.
#   www.fbbas.es    and    www.multivariatestatistics.org   and
#   www.econ.upf.edu/~michael/stanford/ .
#   Chap. 4 "Measures of distance between samples: Euclidean".
#   Chap. 5 "Measures of distance between samples: non-Euclidean".
#   Appendix A "Aspects of Theory".
#   Appendix B "Bibliography and Web Resources.
#   Appendix c "Computational Notes".
# [James, 2013] Gareth James, Daniela Witten, Trevor Hastie, 
#     Robert Tibshirani, "An Introduction to Statistical Learning with
#     Applications in R", Springer, 2013.
#     www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf
# [Kabacoff, 2015]  Robert I. Kabacoff, "R in Action", 
#     2'Ed, Manning Publications, 2015.
# [Kabacoff, 2015a] R.I. Kabacoff, "R in Action", Errata, 2015.
# [Karatzoglou, 2006] Alexandros Karatzoglou, David Meyer, Kurt Hornik,
#   "Support Vector Machines in R", Journal of Statistical Software, 
#   April 2006, Volume 15, Issue 9. www.jstatsoft.org
# [Maechler, 2015] Martin Maechler, "Package cluster",
#   cran.r-project.org/web/packages/cluster/index.html
# [Maechler, 2015a] Martin Maechler, "Package cluster", Manual
#   cran.r-project.org/web/packages/cluster/cluster.pdf
# [Meyer, 2015] David Meyer, "Package 'e1071',
#   cran.r-project.org/web/packages/e1071/index.html
# [Pison, 1999] Greet Pison, Anja Struyf, Peter J. Rousseeuw,
#   "Displaying a Clustering with CLUSPLOT", Computational Statistics and 
#   Data Analysis 30 (1999), 381-392.
# [RCoreTeam, 2015] R Core Team and contributors worldwide, 
#   "The R Language Manual System", from help.start() at R Studio Console .
# [RCoreTeam, 2015a] R Core Team, "R Data import/Export" 
#   cran.r-project.org/doc/manuals/r-release/R-data.html
# [Short, 2004] Tom Short, "Short Reference Card"
#   cran.r-project.org/doc/contrib/Short-refcard.pdf
# [Teetor, 2011] Paul Teetor, "R Cookbook", O'Reilley, 2011.
# [Torfs, 2014] Paul Torfs, Caludia Brauer, "A (very) Short Introduction to R", 
#   cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
# [Zhao, 2013] Yanchang Zhao, "R and Data Mining", Elsevier, 2013.
# [Zhao, 2015] Yanchang Zhao, "R Reference Card for Data Mining", January 2015.
#        www.rdatamining.com/docs/r-reference-card-for-data-mining
#
##############################################################################
# 6.0: Enter the main R Language documentation.
#      Install packages needed for examples on classification methods.
#
help.start()    # This is the main entry to the R project documentation.
opar.org <- par(no.readonly=TRUE)
loc='C:/R_packages/'              # Use this folder for packages.
#
# Follow p. 390 [Kabacoff, 2015] install packages for classification
#
install.packages("rpart",lib=loc)
install.packages("rpart.plot",lib=loc)
#install.packages("party",lib=loc)
install.packages("partykit",lib=loc)
install.packages("randomForest",lib=loc)
install.packages("e1071",lib=loc)
install.packages("ISLR",lib=loc)
install.packages("tree",lib=loc)
install.packages("MASS",lib=loc)
install.packages("rattle",lib=loc)
install.packages("kernlab",lib=loc)
install.packages("proxy",lib=loc)
install.packages("dtw",lib=loc)
install.packages("class",lib=loc)
#
library("rpart",lib=loc)
library("rpart.plot",lib=loc)
#library("party",lib=loc)
library("partykit",lib=loc)
library("randomForest",lib=loc)
library("e1071",lib=loc)
library("ISLR",lib=loc)
library("tree",lib=loc)
library("MASS",lib=loc)
library("rattle",lib=loc)
library("kernlab",lib=loc)
library("proxy",lib=loc)
library("dtw",lib=loc)
library("class",lib=loc)
#
############################################################################## 
# 6.1: Preparing data for classification examples. p. 391 [Kabacoff, 2015]
#
# Objective: Create a dataset for classifier training and testing a classifier.
# Use approx 70% for training and the rest for testing.
#
loc1 <- "http://archive.ics.uci.edu/ml/machine-learning-databases/" 
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data" 
url <- paste(loc1, ds, sep="") 
#
breast <- read.table(url, sep=",", header=FALSE, na.strings="?") 
str(breast)
names(breast) <- c("ID", "clumpThickness", "sizeUniformity", 
                "shapeUniformity", "maginalAdhesion",  
                "singleEpithelialCellSize", "bareNuclei",  
                "blandChromatin", "normalNucleoli", "mitosis", "class") 
#
# 
# Demonstrate saving a dataset in file, clear dataset and reload dataset.
ls()    # List objects.
save(breast, file="dataset_breast")
rm(breast)
ls()    # List objects.
# The dataset can be loaded using
load("dataset_breast")
ls()    # List objects.
#
df <- breast[-1]   # Remove the first column (identity). 
df$class <- factor(df$class, levels=c(2,4),  
                    labels=c("benign", "malignant"))
#
#
set.seed(1234)
#
# Use the sample() function for extracting rows for training and validation.
#
train <- sample(nrow(df), 0.7*nrow(df))   # Use 70% of dataset for training.
df.train <- df[train,]        # Form training set.
df.validate <- df[-train,]    # Use the rest of dataset (30%) for validation.
table(df.train$class) 
table(df.validate$class)
#
########################################################################
# 6.2: Logistic regression example, p. 392 p. [Kabacoff, 2015].
#
#   Logistic regression is for binary output ("benign", "malignant").
#
fit.logit <- glm(class~., data=df.train, family=binomial()) 
summary(fit.logit) 
prob <- predict(fit.logit, df.validate, type="response") 
logit.pred <- factor(prob > .5, levels=c(FALSE, TRUE),  
                      labels=c("benign", "malignant")) 
logit.perf <- table(df.validate$class, logit.pred, 
                     dnn=c("Actual", "Predicted")) 
logit.perf 
##############################################################################
# 6.3: Creating a decision tree, p. 394 [Kabacoff, 2015].
#
# library(rpart)  moved to top of script.
#
set.seed(1234) 
dtree <- rpart(class ~ ., data=df.train, method="class",       
               parms=list(split="information")) 
dtree$cptable 
plotcp(dtree)  # Plot x-validated error vers. complexity cp.
#
par(opar.org)
pdf("fig_6_1_dectree.pdf")  # Plot x-validated error vers. complexity cp.
plotcp(dtree)  # Plot x-validated error vers. complexity cp.
dev.off()
par(opar.org)
#
dtree.pruned <- prune(dtree, cp=.0125)  # prune the tree back to   
# 
# library(rpart.plot) moved to top of script.
# Plot the dicision tree, type=2: label all nodes.
prp(dtree.pruned, type = 2, extra = 104,   
     fallen.leaves = TRUE, main="Decision Tree") 
#
par(opar.org)
pdf("fig_6_2_dectree.pdf")  # Plot decision tree
prp(dtree.pruned, type = 2, extra = 104,   
    fallen.leaves = TRUE, main="Decision Tree") 
dev.off()
par(opar.org)
#
dtree.pred <- predict(dtree.pruned, df.validate, type="class") 
dtree.perf <- table(df.validate$class, dtree.pred,  
                     dnn=c("Actual", "Predicted")) 
dtree.perf
# Save for later performance comparison:
save(dtree.perf, file="perf_dtree.perf") 
#
##############################################################################
# 6.4: Conditional inference trees, p. 397 [Kabacoff, 2015]
#
# library(party) moved to top of script.
#
fit.ctree <- ctree(class~., data=df.train) 
plot(fit.ctree, main="Conditional Inference Tree") 

ctree.pred <- predict(fit.ctree, df.validate, type="response") 
ctree.perf <- table(df.validate$class, ctree.pred,  
                     dnn=c("Actual", "Predicted")) 
ctree.perf 
# Save for later performance comparison:
save(ctree.perf, file="perf_ctree.perf") 
#
##############################################################################
# 6.5: Random forest, p. 399 [Kabacoff, 2015].
#
#library(randomForest) moved to top of script.
#
set.seed(1234) 
fit.forest <- randomForest(class~., data=df.train,         
                            na.action=na.roughfix, 
                            importance=TRUE)              
fit.forest 
importance(fit.forest, type=2) # Type = 2 minimize the total node impurity,
  # measured by the Gini index, cf. p. 312 [James, 2013]. 
  # A small Gini index means that a node mainly contains observation from 
  #  one class.
forest.pred <- predict(fit.forest, df.validate)          
forest.perf <- table(df.validate$class, forest.pred,  
                      dnn=c("Actual", "Predicted")) 
forest.perf 
# Save for later performance comparison:
save(forest.perf, file="perf_forest.perf") 
#
#######################################################################
# 6.6.0: Support vector machines, p. 401 [Kabacoff, 2015]
#
# Prepare data, cf. [Kabacoff, 2015] p. 391
#
# library("e1071") moved to top of script.
#
loc2 <- "http://archive.ics.uci.edu/ml/machine-learning-databases/" 
ds2  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data" 
ur2 <- paste(loc2, ds2, sep="") 
#
breast <- read.table(ur2, sep=",", header=FALSE, na.strings="?") 
names(breast) <- c("ID", "clumpThickness", "sizeUniformity", 
                   "shapeUniformity", "maginalAdhesion",  
                   "singleEpithelialCellSize", "bareNuclei",  
                   "blandChromatin", "normalNucleoli", "mitosis", "class") 
#
df <- breast[-1] 
df$class <- factor(df$class, levels=c(2,4),  
                   labels=c("benign", "malignant")) 
#
set.seed(1234)
#
# Use the sample() function for extracting rows for training and validation.
#
train <- sample(nrow(df), 0.7*nrow(df))   # Use 70% of dataset for training.
df.train <- df[train,]        # Form training set.
df.validate <- df[-train,]    # Use the rest of dataset (30%) for validation.
table(df.train$class) 
table(df.validate$class)
#
# [Kabacoff, 2015] p. 403 A support vector machine
# library(e1071)  moved to top of script.
#
set.seed(1234) 
fit.svm <- svm(class~., data=df.train) 
fit.svm 
svm.pred <- predict(fit.svm, na.omit(df.validate)) 
svm.perf <- table(na.omit(df.validate)$class,  
                   svm.pred, dnn=c("Actual", "Predicted")) 
svm.perf 
# Save for later performance comparison:
save(svm.perf, file="perf_svm.perf") 
#
#
# Define a performance function.
#
performance <- function(table, n=2){
  if(!all(dim(table) == c(2,2)))
    stop("Must be a 2 x 2 table")
  tn = table[1,1]
  fp = table[1,2]
  fn = table[2,1]
  tp = table[2,2]
  sensitivity = tp/(tp+fn)
  specificity = tn/(tn+fp)
  ppp = tp/(tp+fp)
  npp = tn/(tn+fn)
  hitrate = (tp+tn)/(tp+tn+fp+fn)
  result <- paste("Sensitivity = ", round(sensitivity, n) ,
                  "\nSpecificity = ", round(specificity, n),
                  "\nPositive Predictive Value = ", round(ppp, n),
                  "\nNegative Predictive Value = ", round(npp, n),
                  "\nAccuracy = ", round(hitrate, n), "\n", sep="")
  cat(result)
}
#
# Load performance of classifiers:
#
load("perf_dtree.perf")    # -> dtree.perf
load("perf_ctree.perf")    # -> ctree.perf
load("perf_forest.perf")   # -> forest.perf
load("perf_svm.perf")      # -> svm.perf
#
# List performance of the classifiers.
#
performance(dtree.perf)
performance(ctree.perf)
performance(forest.perf)
performance(svm.perf)
#############################################################################
# 6.6.1:  Example on using svm p. 52 [Meyer, 2015]
#
data(iris)
attach(iris)
#
attributes(iris)
# Note: sepal eng.  ~  bægerblad dk.
# Note: petal eng.  ~  kronblad dk.-
#
# classification mode --------------------------
# default with factor response:
model <- svm(Species ~ ., data = iris)
model     # Display model.
          # SVM type: C (Classification)
          # Kernel: Radial Basis Function
          # cost = 1
          # gamma = 0.25
#
# alternatively the traditional interface:
x <- subset(iris, select = -Species) # Avoid Species.
y <- Species
x         # Display dataframe x (without column species)
y         # Display y with species.
#
model <- svm(x, y)
print(model)
summary(model)    # Same result as above.
#
# test with training data
pred <- predict(model, x)
# (same as:)
pred <- fitted(model)
pred      # Display predicted values
#
# Check accuracy. 
# Display the confusion matrix with 3 x 3 classes.
# Classes (species): setosa,  versicolor or virginica
table(pred, y)
#
# compute decision values and probabilities:
pred <- predict(model, x, decision.values = TRUE)
attr(pred, "decision.values")[1:4,]
#
# visualize (classes by color, SV by crosses):
# Plotting parameters:
# cmdscale(): returns principal coordinates.
# col: color c.f. [Kabacoff, 2015] Table 3.3 p. 52
# pch: symbol c.f. [Kabacoff, 2015] Table 3.2 p. 51
# 
plot(cmdscale(dist(iris[,-5])),
     col = as.integer(iris[,5]),
     pch = c("o","+")[1:150 %in% model$index + 1])
#
# try regression mode on two dimensions  ------------
# create data
x <- seq(0.1, 5, by = 0.05)  # Sequence from 0.1 to 5 by step 0.0
y <- log(x) + rnorm(x, sd = 0.2) # log: natural log.
#
# estimate model and predict input values
m <- svm(x, y)
new <- predict(m, x)
#
# visualize
plot(x, y)
points(x, log(x), col = 2) # Color -> red
points(x, new, col = 4)    # Color -> blue
#
# density-estimation ------------------
# Single-class support vector machines: Determine a region which
# represents a given fraction of the data.
# Parameters gamma and nu.
# The parameter 1 - nu ~ probability of the identified region.
#
# create 2-dim. normal with rho=0:
X <- data.frame(a = rnorm(1000), b = rnorm(1000))
attach(X)
plot(X$a, X$b)     # Scatterplot.
#
# traditional way:
# use the svm() for one-classification
# gamma = 0.1
# nu = 0.5 controls volume of sphere for outlier detection.
#
m10 <- svm(X, gamma = 0.1, nu=0.1)
# formula interface:
m2 <- svm(~., data = X, gamma = 0.1)
# or:
m3 <- svm(~ a + b, gamma = 0.1)
#
# test:
#newdata <- data.frame(a = c(0, 4), b = c(0, 4))
#predict (m1, newdata)
#
# visualize:
plot(X, col = 1:1000 %in% m10$index + 1, xlim = c(-5,5), ylim=c(-5,5))
title("nu=0.1")
# cex: cf. [Kabacoff, 2015] p. 51 Table 3.32 scaling x 5 default.
# col: color red. 
#points(newdata, pch = "+", col = 2, cex = 5)  # Plot Upscaled +
#
# density-estimation ------------------
# Single class support vector machine.
# create 2-dim. normal with rho=0:
X <- data.frame(a = rnorm(1000), b = rnorm(1000))
attach(X)
plot(X$a, X$b)     # Scatterplot.
#
# traditional way:
# use the svm() for one-classification
# gamma = 0.1
# nu = 1.0 controls volume of sphere for outlier detection.
#
m11 <- svm(X, gamma = 0.1, nu=0.5)
# formula interface:
#m2 <- svm(~., data = X, gamma = 0.1)
# or:
#m3 <- svm(~ a + b, gamma = 0.1)
#
# test:
#newdata <- data.frame(a = c(0, 4), b = c(0, 4))
#predict (m11, newdata)
#
# visualize:
plot(X, col = 1:1000 %in% m11$index + 1, xlim = c(-5,5), ylim=c(-5,5))
title("nu=0.5")
# cex: cf. [Kabacoff, 2015] p. 51 Table 3.32 scaling x 5 default.
# col. color=1 black
# col: color=2 red. 
# points(newdata, pch = "+", col = 2, cex = 5)  # Plot Upscaled +
#
# density-estimation ------------------
# Single class support vector machine.
# create 2-dim. normal with rho=0:
X <- data.frame(a = rnorm(1000), b = rnorm(1000))
attach(X)
plot(X$a, X$b)     # Scatterplot.
#
# traditional way:
# use the svm() for one-classification
# gamma = 0.1
# nu = 1.0 controls volume of sphere for outlier detection.
#
m12 <- svm(X, gamma = 0.1, nu=0.8)
# formula interface:
#m2 <- svm(~., data = X, gamma = 0.1)
# or:
#m3 <- svm(~ a + b, gamma = 0.1)
#
# test:
#newdata <- data.frame(a = c(0, 4), b = c(0, 4))
#predict (m12, newdata)
#
# visualize:
plot(X, col = 1:1000 %in% m12$index + 1, xlim = c(-5,5), ylim=c(-5,5))
title("nu=0.8")
# cex: cf. [Kabacoff, 2015] p. 51 Table 3.32 scaling x 5 default.
# col. color=1 black
# col: color=2 red. 
# points(newdata, pch = "+", col = 2, cex = 5)  # Plot Upscaled +
#
# density-estimation ------------------
# Single class support vector machine.
# create 2-dim. normal with rho=0:
X <- data.frame(a = rnorm(1000), b = rnorm(1000))
attach(X)
plot(X$a, X$b)     # Scatterplot.
#
# traditional way:
# use the svm() for one-classification
# gamma = 0.1
# nu = 1.0 controls volume of sphere for outlier detection.
#
m13 <- svm(X, gamma = 0.1, nu=0.99)
# formula interface:
#m2 <- svm(~., data = X, gamma = 0.1)
# or:
#m3 <- svm(~ a + b, gamma = 0.1)
#
# test:
#newdata <- data.frame(a = c(0, 4), b = c(0, 4))
#predict (m12, newdata)
#
# visualize:
plot(X, col = 1:1000 %in% m12$index + 1, xlim = c(-5,5), ylim=c(-5,5))
title("nu=0.99")
# cex: cf. [Kabacoff, 2015] p. 51 Table 3.32 scaling x 5 default.
# col. color=1 black
# col: color=2 red. 
# points(newdata, pch = "+", col = 2, cex = 5)  # Plot Upscaled +
#
#
# density-estimation ------------------
# Single class support vector machine.
# create 2-dim. normal with rho=0:
X1 <- data.frame(a = rnorm(1000)+1, b = rnorm(1000)+2)
attach(X1)
plot(X1$a, X1$b)     # Scatterplot.
#
# traditional way:
# use the svm() for one-classification
# gamma = 0.1
# nu = 1.0 controls volume of sphere for outlier detection.
#
m14 <- svm(X1, gamma = 0.1, nu=0.5)
# formula interface:
#m2 <- svm(~., data = X, gamma = 0.1)
# or:
#m3 <- svm(~ a + b, gamma = 0.1)
#
# test:
#newdata <- data.frame(a = c(0, 4), b = c(0, 4))
#predict (m12, newdata)
#
# visualize:
plot(X1, col = 1:1000 %in% m14$index + 1, xlim = c(-5,5), ylim=c(-5,5))
title("nu=0.5")
# cex: cf. [Kabacoff, 2015] p. 51 Table 3.32 scaling x 5 default.
# col. color=1 black
# col: color=2 red. 
# points(newdata, pch = "+", col = 2, cex = 5)  # Plot Upscaled +
#
#-----------------------
# Example using svm.tune p. 55 [Meyer, 2015]
#
data(iris)
# tune `svm' for classification with RBF-kernel (default in svm),
# using one split for training/validation set
#    tune on a grid gamma: parameter in the RBF
#    tune on a grid cost: cost of an error.
#    The objective of tune() is the minimization of the 
#    classification error.
obj <- tune(svm, Species~., data = iris,
            ranges = list(gamma = 2^(-1:1), cost = 2^(2:4)),
            tunecontrol = tune.control(sampling = "fix")
)
## alternatively:
## obj <- tune.svm(Species~., data = iris, gamma = 2^(-1:1), cost = 2^(2:4))
summary(obj)
plot(obj)
# Check that the performance plot seems ok.
#   The lowest classification error is otained at 
#   at high cost and low gamma. 
#
# tune `knn' (k-nearest neighbor) using a convenience function; 
# this time with the conventional interface and bootstrap sampling:
#    bootstrap sampling: Extract randomly, with replacement,
#    samples from a dataset, and estimate from these sets.
x <- iris[,-5]
y <- iris[,5]
obj2 <- tune.knn(x, y, k = 1:5, 
                 tunecontrol = tune.control(sampling = "boot"))
summary(obj2)
plot(obj2)
#
# tune `rpart' for regression, using 10-fold cross validation (default)
data(mtcars)
obj3 <- tune.rpart(mpg~., data = mtcars, minsplit = c(5,10,15))
summary(obj3)
plot(obj3)
############################################################################
