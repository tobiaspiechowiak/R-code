rm(list=ls())  #clear workspace

opar.org <- par(no.readonly=TRUE)

home <- "c:/Users/tpiechowiak/R code/R-code/Lektion 7/"

setwd(home)

loc <-"c:/Users/tpiechowiak/Documents/R/win-library/3.3/"              # Use this folder for packages.
#
#
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
library("proxy",lib=loc)
library("randomForest",lib=loc)
library("e1071",lib=loc)
library("ISLR",lib=loc)
library("tree",lib=loc)
library("MASS",lib=loc)
library("rattle",lib=loc)
library("kernlab",lib=loc)
library("dtw",lib=loc)
library("class",lib=loc)

##############################################################################
#prepare data
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

df <- breast[-1]   # Remove the first column (identity). 
df$class <- factor(df$class, levels=c(2,4),  
                   labels=c("benign", "malignant"))

#prepare training data
train <- sample(nrow(df), 0.7*nrow(df))   # Use 70% of dataset for training.
df.train <- df[train,]        # Form training set.
df.validate <- df[-train,]    # Use the rest of dataset (30%) for validation.
table(df.train$class) 
table(df.validate$class)

#############################################################################
#define performance function (modified by TPI)
# Define a performance function.
#
err <- performance <- function(table, n=2){
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
  #result <- paste("Sensitivity = ", round(sensitivity, n) ,
   #               "\nSpecificity = ", round(specificity, n),
    #              "\nPositive Predictive Value = ", round(ppp, n),
     #             "\nNegative Predictive Value = ", round(npp, n),
      #            "\nAccuracy = ", round(hitrate, n), "\n", sep="")
  #cat(result)
  return(hitrate)
}

##############################################################################
#7,1
# 6.5: Random forest, p. 399 [Kabacoff, 2015] for e cases of mtry and 3 cases of ntrees
#
set.seed(1234) 
nrtries <- c(2,sqrt(9),9) #number of tries at each node
nrtree <- c(20,100,500) #number of trees in forest
cname <- c("p=2","p=3","p=9")
rname <- c("20","100","500")
err.classification <- matrix(0,nrow=length(nrtree),ncol=length(nrtries),
                             dimnames=list(rname,cname))


for(i in 1:3) {#for nrtree
  for (j in 1:3) {#for nrtries
    fit.forest <- randomForest(class~., data=df.train,ntree=nrtree[i],mtry=nrtries[j],         
                                 na.action=na.roughfix, 
                                 importance=TRUE)   
    importance(fit.forest, type=2) # Type = 2 minimize the total node impurity,
    # measured by the Gini index, cf. p. 312 [James, 2013]. 
    # A small Gini index means that a node mainly contains observation from 
    #  one class.
    forest.pred <- predict(fit.forest, df.validate)          
    forest.perf <- table(df.validate$class, forest.pred,  
                         dnn=c("Actual", "Predicted")) 
    err.classification[i,j] <- (1 - performance(forest.perf)) * 100 #calculate classification error percent
      
  }
}

# Save for later performance comparison:
save(err.classification, file="perf_forest.perf") 


#classification error 
#p=2      p=3      p=9
#20  1.477833 2.463054 2.463054
#100 1.477833 1.970443 2.463054
#500 1.477833 1.477833 3.448276


#Is the random forest training on a sub-set of the training data at its single trees? 
#How does that relate to the number of trees in the forest?
#It seems that there is not a big difference in classification error for the 9 combinations on the 
#test data set



################################################################################
#7.2
#support vector machine

set.seed(1234) 
fit.svm <- svm(class~., data=df.train ) 
#gamma default:  1/(data dimension)
fit.svm 
svm.pred <- predict(fit.svm, na.omit(df.validate)) 
svm.perf <- table(na.omit(df.validate)$class,  
                  svm.pred, dnn=c("Actual", "Predicted")) 
svm.perf 
# Save for later performance comparison:
save(svm.perf, file="perf_svm.perf") 
#
#
