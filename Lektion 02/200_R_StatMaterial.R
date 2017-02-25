# Filename: 200_StatMaterial_v1.R
# jaas, February 2017
#
# 0.0: ALWAYs APPLIED. 
# 1.0: Central limit theorem from [Snow, 2016].
# 2.0: Material for the [Kearns, 2011] open source textbook on
#      "Intoduction to Probabilities and Statistics using R".
#      Package dokumentation [Kearns, 2013]
#      
############################################################################## 
#
#                            REFERENCES
#
# [Adler, 2012] Joseph Adler, "R In a Nutshell", O'Reilly, 2012.
# [Glynn, 2015] Earl F. Glynn, "Reference Card for Colors" 
#    research.stowers-institute.org/efg/R/Color/Chart/
# [Kabacoff, 2015]  Robert I. Kabacoff, "R in Action", 
#    2'Ed, Manning Publications, 2015.
# [Kerns, 2011] G. Jay Kerns, "Introduction to Probabilities and 
#    Statistics using R", First Edition, pp. 412.
#    cran.r-project.org/web/packages/IPSUR/vignettes/IPSUR.pdf
# [Kerns, 2013] G. Jay Kerns, "Elementary Probability and the Prob Package"
#    cran.r-project.org/web/packages/prob/vignettes/prob.pdf
# [R Core, 2015] R Core Team and contributors worldwide, 
#    "The R Language Manual System", from help.start() at R Studio Console .
# [R Core, 2015a] R Core Team, "R Data import/Export" 
#     cran.r-project.org/doc/manuals/r-release/R-data.html
# [short, 2004] Tom Short, "Short Reference Card"
#     cran.r-project.org/doc/contrib/Short-refcard.pdf
# [Snow, 2016] Greg Snow, "Demonstrations for Teaching and Learning",
#   https://cran.r-project.org/web/packages/TeachingDemos/index.html
# [Teetor, 2011] Paul Teetor, "R Cookbook", O'Reilley, 2011.
# [Torfs, 2014] Paul Torfs, Caludia Brauer, "A (very) Short Introduction to R", 
#        cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
# [Zhao, 2013] Yanchang Zhao, "R and Data Mining", Elsevier, 2013.
# [Zhao, 2013] Yanchang Zhao, "R Reference Card for Data Mining", January 2015.
#   www.rdatamining.com/docs/r-reference-card-for-data-mining
#
##########################################################################
# 0.0: This part i always applied.
opar.org <- par(no.readonly=TRUE) # Store the original graphical parameters
# for later restore af plotting.
loc <- "c:/Users/tobiasp/Documents/Big Data/R_packages/" # Location for installing packages.
#
##############################################################################
# 1.0: 
install.packages("TeachingDemos", lib=loc)
library("TeachingDemos", lib=loc)
#
clt.examp()
clt.examp(5)
clt.examp(30)
clt.examp(50)
##############################################################################
# 2.0: 
#install.packages("prob", lib=loc)
#library("prob", lib=loc)
#
install.packages("IPSUR",lib=loc)
install.packages("combinat", lib=loc)
install.packages("timeDate", lib=loc)
install.packages("timeSeries", lib=loc)
install.packages("fBasics", lib=loc)
install.packages("fOptions", lib=loc)
install.packages("fAsianOptions", lib=loc)
install.packages("hypergeo", lib=loc)
install.packages("stats4", lib=loc)
install.packages("splines", lib=loc)
install.packages("VGAM", lib=loc)
install.packages("prob",lib=loc)
library("IPSUR", lib=loc)
library("combinat", lib=loc)
library("timeDate", lib=loc)
library("timeSeries", lib=loc)
library("fBasics", lib=loc)
library("fOptions", lib=loc)
library("fAsianOptions", lib=loc)
library("hypergeo", lib=loc)
library("stats4", lib=loc)
library("splines", lib=loc)
library("VGAM", lib=loc)
library("prob",lib=loc)
#
#-------------------------------------------------------------
tosscoin(1)             # [Kerns, 2013] page 2.
tosscoin(3)
rolldie(3, nsides = 4)  # [Kerns, 2013] page 2.
#
#-------------------------------------------------------------
# [Kearns, 2013] page 17
# Simulate experiment picking 5 cards from a deck of cards.
S <- cards(makespace=TRUE)
sim(S, ntrials = 5)
#-------------------------------------------------------------
# [Kearns, 2013] page 17
# Simulate experiment tossing two fair coins.
S <- tosscoin(2, makespace = TRUE)
sims <- sim(S, ntrials = 50000)
empirical(sims)
#-------------------------------------------------------------