# Filename: 4_R_Intro_Visualization_v8.R
# jaas, Februar 2017
#
##############################################################################
# Objective: 
# Introduction of a selection of visualization methods using
# - introduction to graphics in R
# - exemplifying af selection of graphics function and combinations
#   of function for visualization of datasets.
# 
#                 "R Intro Visualization"  TABLE OF CONTENTS
#
# 4.0: Enter the main R Language documentation and path to library.
# 4.1: List all data sets in the standard R installation package "datasets".
# 4.2: Examples on R code for basic operations on graphs. 
#      Ref. [Kabacoff, 2015] pages 48- . This section includes: 
#      - Plot of regression line. 
#      - Plot regression line to pdf or jpg file.
# 4.3: Examples on applying graphic parameters for fonts, colors, axes, labels.
#      Ref. [kabacoff, 2015] pages 49 - .
# 4.4: Examples from the RColorBrewer package, for generating color palettes.
# 4.5: Examples on gray-levels, from the R base installation.
# 4.6: Examples on text objects in graphics.     
# 4.7: Example on margin controle of plots, ref. [Kabacoff, 2015] p. 55
# 4.8: Example on comparing 2 plots, ref. [kabacoff, 2015] listing 3.3. p. 61
# 4.9: Example on text annotations on graph, ref. [Kabacoff, 2015], p. 61, 62.
#             Scatterplot with labeled points.
#             This example generates also a pdf plot
# 4.10: Example: One figure with 4 plots organized 2 x 2.
#       [Kabacoff, 2015] page 65.
# 4.11: Example: One figure with one column, 3 rows, org: 3 x 1.
#       [Kabacoff, 2015] page 65.
# 4.12: Example: One figure with 3 plots, organized: 1 fig, 2 figs.
#       [Kabacoff, 2015] page 67.
# 4.13: Example on combining a scatter plot with two box plots.
#       Ref. [Kabacoff, 2015] p. 69.
# 4.14: Example on Comparing groups by using parallel Box plots.
#       Ref. [Kabacoff, 2015] p. 129.
# 4.15: Example on plotting a large number of labeled values on a
#       simple horizon scale, sorted and colored.
#       Ref. [Kabacoff, 2015] p. 134.
# 4.16: Example on Bubble plot with point size area proportional to a 
#       variable, using the mtcar dataset. 
#       Ref. [Kabacoff, 2015] p. 267. 
# 4.17: Example on 3d Scatter plot, Ref. [Kabacoff, 2015] p. 263.
#       Basic 3D plot 
#       3D plot with verfical lines
#       Mouse controlled spinning of a 3D plot.
# 4.18: Creating and visualizing a selection of 3D clusters of Gaussian and 
#       Uniform distributions using the function plot3d() 
#
############################################################################## 
#
#                            REFERENCES
#
# [Adler, 2012] Joseph Adler, "R In a Nutshell", O'Reilly, 2012.
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
# 4.0: Enter the main R Language documentation.
#
help.start()          # This is the main entry to the R project documentation.
#
loc='c:/Users/tobiasp/Documents/Big Data/R_packages/'     # Location for packages.
opar.org <- par(no.readonly=TRUE) # Store original graphical parameter setting.
##############################################################################
# 4.1: List all data sets in the standard R installation package "datasets".
#
# Initially look into the selection of datasets  the R package "datasets".
#
library(help = "datasets")
iris                       # List the iris data set.
mtcars                     # List the mtcars data set.
##############################################################################
# 4.2: Examples on R code for basic operations on graphs.
#      Ref. [Kabacoff, 2015] page 48
#
attach(mtcars)       # Now use the motor cars dataset.
plot(wt, mpg)        # Scatterplot wt: weight and mpg: miles pr. Gallon.
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
#
#                     Output graphics in pdf file.
pdf("mpg_regression.pdf")
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight, (pdf)")
detach(mtcars)
dev.off()
par(opar.org)   # Restore original graphics parameters.
#
# Resulting output: mpg_regression.pdf in workspace.
# Check pdf file existence in the working directory.
path_1 <- getwd();  # Path to working directory.
files_wd <- list.files(path = path_1)
files_wd            # List on console and check manually.
#
#                Repeat the above targeting an jpg file.
jpeg("mpg_regression.jpg")
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight (jpg)")
detach(mtcars)
par(opar.org)   # Restore original graphics parameters.
dev.off()
?dev.off()      # Close the pdf output device.
#
# Resulting output: mpg_regression.jpg in workspace.
# Check jpg file existence in the working directory.
path_2 <- getwd();      # Path to working directory.
files_wd <- list.files(path = path_2)
files_wd                # List on console and check manually.
grep("mpg_regression.jpg",files_wd) # Check file position for jpg
grep("mpg_regression.pdf",files_wd) # Check file position for pdf
#
###############################################################################
# 4.3: Examples on applying graphic parameters for text, lines, colors.
#      Ref. [Kabacoff, 2015] pages 49 - . 
# Table 3.1 [Kabacoff, 2015] page 49, and patient responses to two drugs
# at 5 dosage levels.
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
#
plot(dose, drugA, type="b")  # b: "Plot both lines and points".
title("drugA=drugA(dose), Example 1")
#
# Continue, exemplifying graphical parameters using the par() commands
## opar <- par(no.readonly=TRUE)  # Remember the original setting of par().
par(lty=2,  pch=17)   # Line type 2 (Fig. 3.5, p. 51 [Kabacoff, 2015]).
                      # plot symbol 17 (Fig. 3.4, p. 51 [Kabacoff, 2015]).
plot(dose, drugA, type="b")     
title("drugA=drugA(dose), Example 2")
par(opar.org)             # Restore original parameters.
#
# Combine the plotting parameters, incl. symbol and line width scaling in one 
# plot command
plot(dose, drugA, type="b", lty=3, lwd=2, pch=17, cex=2)
title("drugA=drugA(dose), Example 3")
            # b: Plot both points and lines.
            # lty: Line type 3, Fig. 3.5, p. 51 [Kabacoff, 2015].
            # lwd: Scale line width 2 times.
            # pch: use symbol 17 (triangle), Fig. 3.4, p. 51 [Kabacoff, 2015].
            # cex: scale symbol size 2 times, relative to default.
par(opar.org)             # Restore original parameters.
#
# Repeat former plot in Example_3_drugA.pdf
pdf("Example_3_drugA.pdf")
plot(dose, drugA, type="b", lty=3, lwd=2, pch=17, cex=2)
title("drugA=drugA(dose), Example 3")
# b: Plot both points and lines.
# lty: Line type 3, Fig. 3.5, p. 51 [Kabacoff, 2015].
# lwd: Scale line width 2 times.
# pch: use symbol 17 (triangle), Fig. 3.4, p. 51 [Kabacoff, 2015].
# cex: scale symbol size 2 times, relative to default.
dev.off()
par(opar.org)             # Restore original parameters.
##########################################################################
# 4.4: Examples on applying the color() function in plot()
# Ref. Table 3.3, p. 52 [Kabacoff, 2015]
?colors()   # Function for returning all possible color names.
all_colors <- colors()
length(all_colors)        # Display numbers of colors.
all_colors                # List all colors
#
# Try useful package for creating color palettes, p. 53 [Kabacoff, 2015]
#
install.packages("RColorBrewer",lib=loc)
library(RColorBrewer, lib=loc) # Include package in library
n <- 7
ex_colors <- brewer.pal(n, "Set1") 
barplot(rep(1,n), col=ex_colors)
#
# List all available packages
brewer.pal.info      # List all available palettes.
display.brewer.all() # Display all brewer color palettes.
                     # This must be displayed on full screen for reading.
help(RColorBrewer)   # Further manual on the package.
# -------------------------------------------------------------------
# Examples from the RColorBrewer manual
# create a sequential palette for usage and show colors
mypalette<-brewer.pal(7,"Greens")
image(1:7,1,as.matrix(1:7),col=mypalette,xlab="Greens (sequential)",
      ylab="",xaxt="n",yaxt="n",bty="n")
## display a divergent palette
display.brewer.pal(7,"BrBG")
devAskNewPage(ask=TRUE)
## display a qualitative palette
display.brewer.pal(7,"Accent")
devAskNewPage(ask=TRUE)
## display a palettes simultanoeusly
display.brewer.all(n=10, exact.n=FALSE)
devAskNewPage(ask=TRUE)
display.brewer.all(n=10)
devAskNewPage(ask=TRUE)
display.brewer.all()
devAskNewPage(ask=TRUE)
display.brewer.all(type="div")
devAskNewPage(ask=TRUE)
display.brewer.all(type="seq")
devAskNewPage(ask=TRUE)
display.brewer.all(type="qual") 
devAskNewPage(ask=TRUE)
display.brewer.all(n=5,type="div",exact.n=TRUE)
devAskNewPage(ask=TRUE)
display.brewer.all(colorblindFriendly=TRUE)
devAskNewPage(ask=TRUE)
brewer.pal.info
brewer.pal.info["Blues",]
brewer.pal.info["Blues",]$maxcolors
#
#####################################################################
# 4.5: Examples on gray-levels, from the R base installation.
#      Ref. [Kabacoff, 2015] page 53
#
?gray()  # Manual for the gray() function
n <- 10
example_colors <- rainbow(n) # Create a vector of n contiguous colors.
pie(rep(1,n), labels=example_colors, col=example_colors)
example_grays <- gray(0:n/n) # Create a vector of colors from a vector 
                             # of gray levels.
pie(rep(1,n), labels=example_grays, col=example_grays)
#
# Repeat plot into pdf
pdf("pie_color.pdf")
pie(rep(1,n), labels=example_colors, col=example_colors)
dev.off()
par(opar.org) 
pdf("pie_gray.pdf")
pie(rep(1,n), labels=example_grays, col=example_grays)
dev.off()
par(opar.org) 
#
#####################################################################
# 4.6: Examples on text objects in graphics.
#      Ref. [Kabacoff, 2015] page 53, Table 3.4 (font size) & 
#                                     Table 3.5 (font families)
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
#
plot(dose, drugA, type="b")  # b: "Plot both lines and points".
title("drugA=drugA(dose), Example 1")
par(opar.org)                # Restore original parameters.
#
# Generate pdf plot
pdf("fig_4_6_txt1.pdf")
plot(dose, drugA, type="b")  # b: "Plot both lines and points".
title("drugA=drugA(dose), Example 1")
dev.off()
par(opar.org)
#
# Set new parameters for plot
par(font.lab=3, cex.lab=1.5, font.main=4, cex.main=2) 
plot(dose, drugA, type="b")  # b: "Plot both lines and points".
title("drugA=drugA(dose), Example 3")
par(opar.org)                # Restore original parameters.
#
# Generate pdf plot
pdf("fig_4_6_txt2.pdf")
par(font.lab=3, cex.lab=1.5, font.main=4, cex.main=2) 
plot(dose, drugA, type="b")  # b: "Plot both lines and points".
title("drugA=drugA(dose), Example 3")
dev.off()
par(opar.org)
#
#####################################################################
# 4.7: Example margin controle of plots, ref. [Kabacoff, 2015] p. 55
#
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
#
par(pin=c(2, 3))    # Table 3.6, page 55
                    # Plot dimensions 2 inch. width, 3 inch. height.
par(lwd=2, cex=1.5) # Table 3.2, page 51, scale line width x 2.
                    # Table 3.4, page 53, scale text x 1.5.
par(cex.axis=0.75, font.axis=3) # Table 3.4, page 53, scale axis text.
                                # Table 3.5, page 54, font axis text.
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
          # type: "b", connect points by lines.
          # pch: symbol 19, Fig. 3.4, p. 51, [Kabacoff, 2015].
          # lty: line type 6, Fig. 3.5, p. 51, [Kabacoff, 2015].
          # col: blue, Table 3.3, p. 52, [Kabacoff, 2015].
          # bg: background color, Table 3.3, p. 52, [Kabacoff, 2015].
par(opar.org) # Restore original parameters.
#
#####################################################################
# 4.8: Ex. on cmp. 2 plots, ref. [Kabacoff, 2015] Listing 3.3. p. 61
#

# 4.9: Example on text annotations on graph, 
#      ref. [Kabacoff, 2015], p. 61, 62.
#      Scatterplot with labeled points.
par(opar.org)
attach(mtcars)
plot(wt, mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")
text(wt, mpg,
     row.names(mtcars),
     cex=0.6, pos=4, col="red") # cex, cf. Table 3.4, p. 53.
                                # pos, cf. Table 3.9, p. 62.
detach(mtcars)
par(opar.org)
#
pdf("Milage_vs_car_weight.pdf")
attach(mtcars)
plot(wt, mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")
text(wt, mpg,
     row.names(mtcars),
     cex=0.6, pos=4, col="red") # cex, cf. Table 3.4, p. 53.
# pos, cf. Table 3.9, p. 62.
detach(mtcars)
dev.off()
par(opar.org)
#
#####################################################################
# 4.10: Example: One figure with 4 plots organized 2 x 2.
#       [Kabacoff, 2015] page 65.
par(opar.org)
attach(mtcars) 
par(mfrow=c(2,2)) 
plot(wt,mpg, main="Scatterplot of wt vs. mpg") 
plot(wt,disp, main="Scatterplot of wt vs. disp") 
hist(wt, main="Histogram of wt") 
boxplot(wt, main="Boxplot of wt") 
detach(mtcars)
par(opar.org) 
#
# generate pdf of plot
attach(mtcars)
pdf("car_2_X_2.pdf")
par(mfrow=c(2,2)) 
plot(wt,mpg, main="Scatterplot of wt vs. mpg") 
plot(wt,disp, main="Scatterplot of wt vs. disp") 
hist(wt, main="Histogram of wt") 
boxplot(wt, main="Boxplot of wt")
detach(mtcars)
dev.off()
par(opar.org) 
#####################################################################
# 4.11: Example: One figure with one column, 3 rows, org: 3 x 1.
#       [Kabacoff, 2015] page 65.
attach(mtcars) 
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar.org)
detach(mtcars) 
#
#####################################################################
# 4.12: Example: One figure with 3 plots, organized: 1 fig, 2 figs.
#       [Kabacoff, 2015] page 67.
#
attach(mtcars) 
?layout()      # Manual for complex plot layout function.
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE)) 
hist(wt) 
hist(mpg) 
hist(disp) 
detach(mtcars)
par(opar.org)
#
attach(mtcars) 
pdf("plots_1_2.pdf")
?layout()      # Manual for complex plot layout function.
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE)) 
hist(wt) 
hist(mpg) 
hist(disp) 
detach(mtcars)
dev.off()
par(opar.org)
##################################################################
# 4.13: Example on combining a scatter plot with two box plots.
#       Ref. [Kabacoff, 2015] p. 69.
#
par(opar.org)
par(fig=c(0, 0.8, 0, 0.8)) # Set up scatter plot
    # Center part of figure from (0,0) to 80% of x and y axis.
plot(mtcars$wt, mtcars$mpg,
     xlabel="Miles per Gallon",
     ylabel="Car weight")
par(fig=c(0, 0.8, 0.55, 1), new=TRUE)   # Set up box plot above.
boxplot(mtcars$wt, horizontal=TRUE, axes=FALSE)
par(fig=c(0.65, 1, 0, 0.8), new=TRUE)   # Set up box plot above.
boxplot(mtcars$mpg, horizontal=FALSE, axes=FALSE)
mtext("Enhanced Scatterplot", side=3, outer=TRUE, line=-3)
    # Print text on one of 4 margins.
    # side=3: top margin.
    # outer=TRUE, use outer margin.
    # line=-3, start on margin line -3.
par(opar.org)
#
# Generate pdf plot of the above
par(opar.org)
pdf("scatter_with_2_boxplots.pdf")
par(fig=c(0, 0.8, 0, 0.8)) # Set up scatter plot
# Center part of figure from (0,0) to 80% of x and y axis.
plot(mtcars$wt, mtcars$mpg,
     xlabel="Miles per Gallon",
     ylab="Car weight")
par(fig=c(0, 0.8, 0.55, 1), new=TRUE)   # Set up box plot above.
boxplot(mtcars$wt, horizontal=TRUE, axes=FALSE)
par(fig=c(0.65, 1, 0, 0.8), new=TRUE)   # Set up box plot above.
boxplot(mtcars$mpg, horizontal=FALSE, axes=FALSE)
mtext("Enhanced Scatterplot", side=3, outer=TRUE, line=-3)
# Print text on one of 4 margins.
# side=3: top margin.
# outer=TRUE, use outer margin.
# line=-3, start on margin line -3.
dev.off()
par(opar.org)
####################################################################
# 4.14: Example on Comparing groups by using parallel Box plots.
#       Ref. [Kabacoff, 2015] p. 129.
# 
# Check  Boxplot in Fig. 6.11 page 129 in [Kabacoff, 2015]
boxplot(mtcars$mpg, main="Box plot", ylab="Miles per Gallon")
#
# Use parallel boxplot() for comparing 4, 6 and 8 cylinders mpg.
hist(mtcars$cyl)   # Check samples pr cylinder type.
boxplot(mpg ~ cyl, data=mtcars, main="Car Milage Data",
        xlab="Number of cylinders",
        ylab="Miles per Gallon")
#
# Use notched boxplots, where the boxplot width is proportional
# to the sample size, Ref. [Kabacoff, 2015] p. 130.
boxplot(mpg ~ cyl, data=mtcars, main="Car Milage Data",
        notch=TRUE, 
        varwidth=TRUE,  # Box width proportional sample size  
        col="blue",
        xlab="Number of cylinders",
        ylab="Miles per Gallon")
#
# Encode cylinder data into categories with appropriate
# labels: 4 cyl, 6, cyl 8 cyl 
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels=c(4,6,8),
                       labels=c("4","6","8"))
# Encode the transmission type mtcars$am into categories.
# am: 0 or 1. a: Automatic, m: Manual.
mtcars$am.f <- factor(mtcars$am, 
                      levels=c(0,1),
                      labels=c("auto", "standard"))
# Generate the boxplot on the two factors
boxplot(mpg ~ am.f*cyl.f,
        data=mtcars,
        varwidth=TRUE,
        col=c("gold", "darkgreen"),
        main= "MPG Distribution by Auto Type",
        xlab="Auto Type",
        ylab="Miles per Gallon")
# Notice that there are 2 colors, used for 6 boxplots. Thus
# the colors are circulated starting with "gold".
#
par(opar.org)
######################################################################
# 4.15: Example on plotting a large number of labeled values on a
#       simple horizon scale, sorted and colored.
#       Ref. [Kabacoff, 2015] p. 134.
#
# Generate a simple dotplot of each cartype with mpg 
?dotchart()    # Manual for the dotplot.
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.7,
         main="Gas Milage for Car Models",
         xlab="Miles per Gallon")
#
# cex: cf. Table 3.4, p. 53 [Kabacoff, 2015] scaling text to 0.7.
#
# Dotplot grouped, sorted and colored, 
# Ref. Listing 6.11, p. 134 [Kabacoff, 2015].
x <- mtcars[order(mtcars$mpg),] # Sorting mpg into x.
x$cyl <- factor(x$cyl)          # Create a factor on the sorted data.
#
x$color[x$cyl==4] <- "red" # Extend x data frame with color ench. cyl.
x$color[x$cyl==6] <- "blue" # Extend x data frame with color ench. cyl.
x$color[x$cyl==8] <- "darkgreen" # Extend x data frame ...
#
dotchart(x$mpg,
         labels=row.names(x),
         cex=0.7,
         groups=x$cyl,
         gcolor="black",
         color= x$color,
         pch=19,
         main="Gas Milage for Car Models \n grouped by cylinder",
         xlab="Miles per Gallon")
par(opar.org)
#        
######################################################################
# 4.16: Example on Bubble plot with point size proportional to a 
#       variable, using the mtcar dataset. 
#       Ref. [Kabacoff, 2015] p. 267. 
#
attach(mtcars)
                     # disp: displacement.
r <- sqrt(disp/pi)   # Circle area proportional to displacement.
                     #
symbols(wt, mpg, circle=r, inches=0.30,
        fg="white", bg="lightblue",
        main="Bubble plot with point size proportional to displacement",
        xlab="Weight of car (lbs/1000)",
        ylab="Miles per Gallon")
text(wt, mpg, rownames(mtcars), cex=0.6)
detach(mtcars)
par(opar.org)
#        
######################################################################
# 4.17: Example on 3d Scatter plot, Ref. [Kabacoff, 2015] p. 263.
#
install.packages("scatterplot3d",lib=loc)
install.packages("rgl",lib=loc)
install.packages("plot3D",lib=loc)
#
library(scatterplot3d,lib=loc)
library(rgl,lib=loc)
library("plot3D",lib=loc)
#
# Basic scatter3d plot
attach(mtcars)        # Use the mtcars data set from package "datasets"
scatterplot3d(wt, disp, mpg, 
              main="Basic 3D Scatter Plot")
#
# scatterplot3d with vertical lines, to support interpretation 
scatterplot3d(wt, disp, mpg, 
              pch=16, 
              highlight.sd=TRUE, 
              type="h", 
              main="3D scatter plot with vertical lines.")
# Generate pdf plot of the above
par(opar.org)
pdf("fig_4_17_scatterplot3d.pdf")
scatterplot3d(wt, disp, mpg, 
              pch=16, 
              highlight.sd=TRUE, 
              type="h", 
              main="3D scatter plot with vertical lines.")
dev.off()
par(opar.org)
#
# 3D plot with mouse controlled view direction
#
attach(mtcars)
plot3d(wt, disp, mpg, col="red", size=5 )
#
######################################################################
# This example needs the packages from the above Example 4.17.
# 4.18: Example on 3D plot of Gaussian and uniform distributions.
#     
# Create 3D cluster, uniform distributed, augmented with color vector.
?runif()
N1 <- 1000  # Use N1 samples per cluster.
x1 <- runif(N1, min=-0.50, max=0.50)   # Uniform from -1.0 to +1.0
y1 <- runif(N1, min=-0.50, max=0.50)
z1 <- runif(N1, min=-0.50, max=0.50)
col_1 <- rep(1,N1)   # Color no. 1
#
# Create 3D cluster, Gaussian distributed, augmented with color vector.
?rnorm()
N2 <- 1000  # Use N2 samples per cluster.
x2 <- rnorm(N2, mean=0, sd=1) 
y2 <- rnorm(N2, mean=0, sd=1) 
z2 <- rnorm(N2, mean=0, sd=1) 
col_2 <- rep(2,N2)
#
# Concatenate the two datasets into one dataframe with colors associated each
# dataset.
#
x <-c(x1,x2); y <-c(y1,y2); z <-c(z1,z2);col_12<-c(col_1,col_2);
df_12 <- data.frame(x,y,z,col_12)
plot3d(df_12$x, df_12$y, df_12$z, col=df_12$col_12, size=3, type='p')
?plot3d()            # Check the manual for plot3d()
# type= s => sphere in each datapoint-
# type= p => points in each datapoint.
#
# Now extend with one more 3D Gaussian cluster with 
# standard deviations sdx=1, sdy=1, sdz=0.1 in center 1,1,1.
N3 <- 1000  # Use N2 samples per cluster.
x3 <- rnorm(N3, mean=1.0, sd=1.0) 
y3 <- rnorm(N3, mean=1.0, sd=1.0) 
z3 <- rnorm(N3, mean=1.0, sd=0.1) 
col_3 <- rep(3,N3)
xx <-c(x1,x2,x3); yy <-c(y1,y2,y3); zz <-c(z1,z2,z3);col_123<-c(col_1,col_2,col_3);
df_123 <- data.frame(xx,yy,zz,col_123)
plot3d(df_123$x, df_123$y, df_123$z, col=df_123$col_123, size=3, type='p')
#####################################################################################