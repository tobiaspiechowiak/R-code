
rm(list=ls())
loc<-'c:/Users/tobiasp/Documents/Big Data/R_packages/'     # Location for packages.
WD <- 'c:/Users/tobiasp/Documents/Big Data/Lektion 3'

setwd(WD)

opar <- par(no.readonly=TRUE)

## Q1
# Create uniform distribution
N1 <- 1000  # Use N1 samples per cluster.
x1 <- runif(N1, min=-1.50, max=-0.50)   # Uniform from -1.0 to +1.0
y1 <- runif(N1, min=-1.50, max=-0.50)
z1 <- runif(N1, min=-1.50, max=-0.50)
col1 <- rep(1,N1)

#create gaussian distribution
x2 <- rnorm(N1, mean=0, sd=0.1)   # Uniform from -1.0 to +1.0
y2 <- rnorm(N1, mean=0, sd=0.1)
z2 <- rnorm(N1, mean=4, sd=0.1)
col2 <- rep(2,N1)

#create flat uniform distribution
x3 <- runif(N1, min=0.5, max=1.50)   # Uniform from -1.0 to +1.0
y3 <- runif(N1, min=0.5, max=1.50)
z3 <- runif(N1, min=1, max=1)
col3 <- rep(3,N1)

#visualisation 
library(scatterplot3d,lib=loc)
library(rgl,lib=loc)
library("plot3D",lib=loc)

xx <-c(x1,x2,x3); yy <-c(y1,y2,y3); zz <-c(z1,z2,z3);col_123<-c(col1,col2,col3);
df_123 <- data.frame(xx,yy,zz,col_123);
plot3d(df_123$xx,df_123$yy,df_123$zz,col=df_123$col_123, main="Basic 3D Scatter Plot")

##Q2
#Central limit theorem uniform distribution
pdf("CLT_1.pdf")
nr <- 10000 #experiments

x_1 <- replicate(nr,{  #for 1 
  tmp <- runif(1)
  sum(tmp)})

x_10 <- replicate(nr,{  #for 10 var
  tmp <- runif(10)
  sum(tmp)})

x_50 <- replicate(nr,{  #for 50 var
  tmp <- runif(50)
  sum(tmp)})

x_100 <- replicate(nr,{  #for 100 var
  tmp <- runif(100)
  sum(tmp)})

#gaussian distribution
y_1 <- replicate(nr,{  #for 1 
  tmp <- rnorm(1)
  sum(tmp)})

y_10 <- replicate(nr,{  #for 10 var
  tmp <- rnorm(10)
  sum(tmp)})

y_50 <- replicate(nr,{  #for 50 var
  tmp <- rnorm(50)
  sum(tmp)})

y_100 <- replicate(nr,{  #for 100 var
  tmp <- rnorm(100)
  sum(tmp)})

#plot
par(mfrow=c(2,4))
hist(x_1,main="1 var, Uniform")
hist(x_10,main="10 var, Uniform")
hist(x_50,main="50 var, Uniform")
hist(x_100,main="100 var, Uniform")

hist(y_1,main="1 var, Gaussian")
hist(y_10,main="10 var, Gaussian")
hist(y_50,main="50 var, Gaussian")
hist(y_100,main="100 var, Gaussian")

par(opar)
dev.off()

##Q3
#scatterplot cars data 
jpeg("mtcars_1.jpeg")
attach(mtcars)
plot(cyl,mpg,main="cylinders vs. milage");
text(cyl,mpg,row.names(mtcars),cex=0.8,pos=4,col="red")
detach(mtcars)
dev.off()
par(opar)

##Q4
#3D plot of car weigth, usage and displacement
dev.new()
attach(mtcars)
col1 <- rep(2,length(wt))
plot3d(wt,mpg,disp,main="3D plot for mtcars data set",col=col1)
detach(mtcars)
par(opar)

##Q5  use iris data
dev.new()
par(mfrow=c(1,2))
#length vs. species
boxplot(Sepal.Length~Species,data=iris,main="Iris data",xlab="Species",
        ylab="Sepal length")
boxplot(Sepal.Width~Species,data=iris,main="Iris data",xlab="Species",
        ylab="Sepal width")
par(opar)

##Q6
dev.new()
attach(iris)
tmp <- iris[order(Sepal.Length),]
dotchart(tmp$Sepal.Length,
         row.names(tmp),
         groups = tmp$Species,
         pch=19,
         gcolor = "blue",
         xlab="Sepal Length",
         main="Species vs. Sepal Length")

detach(iris)
par(opar)






