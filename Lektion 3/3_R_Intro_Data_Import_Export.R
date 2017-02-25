# Filename: 3_R_Intro_Data_Import_Export_v6.R
# jaas, February 2017.
#
# Objective: 
# Introduce R Language functions for importing and exporting data.
#
#              "R Intro Data Import Export" TABLE OF CONTENTS
#
# 3.0: Enter the main R Language documentation. ALWAYS USED.
# 3.1.0: Setting the working directory, miscellaneous references.
# 3.1.1: Importing data from a comma separated values (csv) text file.
# 3.2: Importing data from a CSV file exported from Excel.
# 3.3: Merging two data frames using rbind().
# 3.4: Writing a data frame to csv file in working directory.
#
#                            REFERENCES
#
# [Adler, 2012] Joseph Adler, "R In a Nutshell", O'Reilly, 2012.
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
# 3.0: Enter the main R Language documentation.
help.start()   # This is the main entry to the R project documentation.
#
opar.org <- par(no.readonly=TRUE)  # Store original parameters for later restore.
                                  
loc='C:/R_packages/'      # Pointer to packages.
##############################################################################
# 3.1.0: Setting the working directory, miscellaneous references.
#
# Method 1: RStudio -> Session -> Set Working directory -> choose directory
# Method 2:
(dir <- getwd())   # Get working directory.

#
# Generate link to file: myfilname.csv by concatenating with the working
# directory in variable dir
file1 <- paste(as.character(dir),"/myfilname.csv", sep="", collapse = NULL)
file1   # List path to new filename.
#
##############################################################################
# 3.1.1: Importing data from a comma separated values (CSV) text file.
#
# Main refs:
# [Kabacoff, 2015] page page 34, Section 2.3.2 "Importing data from a delimited 
#                                             text file"
# [R Core, 2015a] As THE general reference.
#
# Read CSV data from a test text file with product evaluations from users.
# The structure is as shown in Section 2.4.1 "Create a data frame with customer
# assessments of two products".
# The file is organized as 5 columns with comma separated observations as
# further described below. The data columns are preceeded by one headline
# with names on the variables and this headline is again preceeded with 4 lines
# of comments.
# This format is further described below:
#
# File name: product_evaluations_v1.csv  This file should be included in 
#                                        the workspace before continuing.
# File format:
# The first 4 lines of the csv file are comments.
# Then there is one headline with five  names of variables observed. 
# They are further described below:
#
# Prod_no: Product number. Value 1 or 2.
# Fe_Ma: The answer is from a female/male. Value F or M.
#   S1: The product is useful.
#   S2: The product price is acceptable.
#   S3: The customer will, without hesitation, recommend the product to a 
#       person known well by the customer. 
# 
# The observation values in S1 to S3 are following a Likert scale:
#  Value 5: Strongly agree
#  Value 4: Agree
#  Value 3: Neutral (Do not agree or disagree)
#  Value 2: Disagree
#  Value 1: Strongly disagree.
#
?read.table()               # The R manual for the function.
#
product_eval_1 <- read.table(file="product_evaluations_v1.csv", header=TRUE, 
    colClasses =c("numeric", "character", "numeric", "numeric", "numeric"), 
    skip=4, sep="," )
#
# skip=4, skips the top 4 lines of the text file when reading, thus allowing 
# these lines to be used for comments.
product_eval_1  # Display 
#
###############################################################################
# 3.2: Read CSV data from text file, generated from Excel in CSV format.
#
product_eval_2 <- read.table(file="product_evaluations_v2.csv", header=TRUE, 
      colClasses =c("numeric", "character", "numeric", "numeric", "numeric"), 
                           skip=4, sep=";" )
# sep=";", is the separator in the csv file generated from the Excel export 
# to a csv file.
product_eval_2
#
###############################################################################
# 3.3: Merging two data frames.
#
product_eval_all <- rbind(product_eval_1, product_eval_2)
product_eval_all
###############################################################################
# 3.4: Writing a data frame to csv file in working directory.
#
write.csv(product_eval_all, file = "product_eval_all.csv")
#
###############################################################################

