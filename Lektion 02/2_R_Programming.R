# Filename: 2_R_Programming_v10.R
# jaas  February 2017
#
# Objective: 
# Introduction to R language elements.
#
#    
#              "Introduction to R Language Elements"  TABLE OF CONTENTS
#
# 2.0: Enter the main R Language documentation.
# 
# 2.1: Examples on scalar operations and examples on predefined functions.
#
# 2.2: Examples on vector definitions and operations.
#
# 2.3: Examples on matrix definitions and vector, matrix operations.
#
# 2.4: Examples on defining and applying data frames.
# 2.4.1: Create a data frame with customer assessments of two products.
# 2.4.2: Insert a new variable in a data frame.
#        (Insert a new column in a data frame).
# 2.4.3: Merge two sets of observations for the same set of variables 
#        (Insert new rows in a data frame).
# 2.4.4: Identify missing values in a data frame.
# 2.4.5: Excluding missing values from a data frame preparing for analysis.
# 2.4.6: Grouping observations into age groups: 
#        Teen, Young, MidAged, MidAgeP, Old.
# 2.4.7: Sorting observations according to one variable.
# 2.4.8: Plot selected parts of data frame.
# 2.4.9: Deleting (removing) rows or columns in dataframes.
#
# 2.5: Example on defining and applying factors (ordinal variables).
#
# 2.6: Example on defining and applying lists.
#
# 2.7:  Program control structures|\\
# 2.7.1: The if-else condition|\\
# 2.7.2: The for-loop|\\
# 2.7.3: The while-loop|\\
# 2.7.4: The repeat function|\\
# 2.7.5: The function definition.|\\
  
#
# 3.1: Binomial Distribution
# 3.2: Mean and variance of a set of data.
# 3.3: Set operations, sampling, union, intersection, difference, equal.
# 3.4: Combinations of a set.
# 3.5: Permutations of a set.
# 3.6: Central Limit Theorem (CLT) example with runif()) uniform density seed.
# 3.7: Central Limit Theorem (CLT) example with rbinom() binomial distribution seed.
# 3.8: Normal Distribution.
#
#                            REFERENCES
#
# [Adler, 2012] Joseph Adler, "R In a Nutshell", O'Reilly, 2012.
# [Bland, 2000] Martin Bland, "An Introduction to Medical Statistics",
#     Oxford University Press, 2000.
# [Kabacoff, 2015]  Robert I. Kabacoff, "R in Action", 
#     2'Ed, Manning Publications, 2015.
# [R Core, 2015] R Core Team and contributors worldwide, 
#     "The R Language Manual System", from help.start() at R Studio Console .
# [short, 2004] Tom Short, "Short Reference Card"
#     cran.r-project.org/doc/contrib/Short-refcard.pdf
# [Teetor, 2011] Paul Teetor, "R Cookbook", O'Reilley, 2011.
# [Torfs, 2014] Paul Torfs, Caludia Brauer, "A (very) Short Introduction to R", 
#        cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
# [Zhao, 2013] Yanchang Zhao, "R and Data Mining", Elsevier, 2013.
# [Zhao, 2013] Yanchang Zhao, "R Reference Card for Data Mining", January 2015.
#        www.rdatamining.com/docs/r-reference-card-for-data-mining
#
###############################################################################
# 2.0: Enter the main R Language documentation.
#
help.start()            # This is the main entry to the R project documentation.
#
opar <- par(no.readonly=TRUE)     # Store original parameters.
                                  # for later restore.
opar.old <- par(no.readonly=TRUE) # 
###############################################################################
# 2.1: Examples on scalar operations and examples on functions and logicals
#
10*32           # Multiply.
(10+2)*5        # Do not use [10+2]*5. It don't work.
2^3             # Exponent
2**4            # Exponent
(2+3i)^2        # Square a complex number: 4 + 12i - 9 = -5+12i
12/3            # Division
#
# Some constanst: pi and e.
#
print(pi, digits=15)
print(exp(1), digits=10)
#
# Some functions, e.g. [Kabacoff, 2015] page 91, Table 5.2 
#
abs(-4)
sqrt(2.71^2)
ceiling(15.29)
floor(15.29)
trunc(-1.5)                   # Truncation towards 0
round(3.14159265, digits=3)   # Round down to 3 decimal places.
signif(3.141592, digits=2)    # Signicant digits.
ac <- c(1,2,5,100)
median_ac <- median(ac); median_ac
mean_ac <- mean(ac);mean_ac
#
sin(pi)
sin(pi/2)
sin(pi)^2+cos(pi)^2
exp(1)           # Exponential function of 1, Eulers number e=2.71828
log(exp(1))      # Natural logarithm to Eulers number e, which is 1
log10(10)        # Base 10 logarithm to 10 which is 1.
log10(1)         # Base 10 logarithm to 1, which is 0.
log(3^2, base=3) # Base 3 logarithm of 9, which is 2, bc 3^2=9.
#
# Verify Eulers formula exp(i*x)=cos(x)+i*sin(x) for any value x.
# Try an example: 
x=pi/4                  # 45 degrees
a=exp(1i*x); a          # Create and print a
b=cos(x)+1i*sin(x); b   # Create and print b
c=a-b            # Eulers formula partially verified if |c| is close to zero.
c                #
Modc <- Mod(c)   # Modulus of c
Modc
print(c, digits=17)
#
# Try another example with a large argument 
x1=pi*10003.27              # Large argument
a1=exp(1i*x1); a1           # Create and print a
b1=cos(x1)+1i*sin(x1); b1   # Create and print b
c1=a1-b1  # Eulers formula is partially verified if |c| is close to zero.
print(c1, digits=17)
#
# Verify Eulers identity:
# "Plug in" pi in Eulers formula and get Eulers identity, sometimes referred 
# to as "The most beatiful formula in the world"  exp(1i*pi)+1=0
#
c2=exp(1i*pi)+1; print(c2, digits=17)  # Display c2 as complex number.
absc2=abs(c2); print(absc2, digits=17) # Display magnitude of c2, which is 
                                       # close to 0.
#
# Constants -------------
#
?NA  # Not available/missing value. NA is a reserved word in R.
is.na(c(1,2,NA))  # Ask if there is an NA in the array.
#
# INF, -INF Numbers out of numerical range.
?Inf      # Inf is a reserved word in the R.
2^1024    # This return an Inf.
-2^1024   # This returns an -Inf.
#
# NaN  Not a number.
?NaN
0/0       # Notice this is "Not a number"
1/0       # Notice this is Inf
#
# Logicals, relations and set operations.
#
z <- 1:5;z                          # z is a vector. 
#summary(z)                         # 
test_z1 <- (z < 3); test_z1         # Test "less than" on each vector position.
test_z2 <- (z == 2); test_z2        # Test "equal to" on each vector position.
test_z3 <- (z != 2); test_z3        # Test "not equal to" on each position.
test_z4 <- (z > 1 & z < 3); test_z4 # Test "logical AND" on each position.
test_z5 <- (z > 4 | z < 1); test_z5 # Test "logical OR" on each position.
test_z6 <- (z %in% c(0,-1,1,5,6,7,8,9,10,100)); test_z6 # test membership on 
                                                        # each position
z1 <- 1:3
z2 <- 2:5
z3 <- union(z1, z2); z3
z4 <- intersect(z1, z2); z4
z5 <- setdiff(z1, z2); z5           # Remove from z1 the elements in z2
z6 <- setdiff(z2, z1); z6           # Remove from z2 the elements in z1

#
###############################################################################
# 2.2: Examples on vector definitions and vector operations.
#
#      Examples on atomic vectors, c.f. [Kabacoff, 2015] page 464.
#      Atomic vectors are arrays of a single type: 
#          Logical, real, complex, character
passed <- c(TRUE, TRUE, FALSE, TRUE); passed         # Vector of logicals.
ages <- c(15, 18, 25, 14, 19); ages                  # Vector of numericals.
cmplxNums <- c(1+2i, 0+1i, 39+3i, 12+2i); cmplxNums  # Vector of numericals.  
cmplxNums1 <- c(1, 1i, 39+3i, 12+2i); cmplxNums1 # "It's ok to skip this ..."
#
#      Examples on vector operations, based on 
#      examples from R Manual display on console using  >?c
#      and [Kabacoff, 2015] page 22-23.
#
a <- c(1:1,7:9); a                 # Create array with 4 elements.
(a1 <- seq(from=3, to= 12, by=2))  # 
b <- c(1:5, 10.5, "next"); b       # Create array with 7 elements.
c <- letters[3:5];c                # letters c,d,e
#
# Used with a single argument to drop attributes
x <- 1:4; x                   # Create and display x
y <- c(1:4); y                # Same as the immediate former line.
#
# Alternative methods for creating vectors
a1 <- rep(1:4,2); a1             # 
a2 <- rep(1:4, each=2); a2       #
a3 <- rep(1:4, c(2,2,2,2)); a3   # Same as the former result.
a4 <- c(1,2,3,4, 'bigdata'); a4  # Vector with different types.
                                 # All entries becomes type: string.
a5 <- length(a4); a5             # Length of vector


# Check class and attributes of a, b and c
class(a)
class(b)
class(x)
class(y)
attributes(a)
attributes(b)
attributes(x)
attributes(y)
#
# Assign names to the components of x using the  names() function.
# Check the function of names() using R Manual display on console 
#  using  >?names
?names()                    # Check manual
names(x) <- letters[1:4]; x # Assigns the letters a b c d to the 
                            # 4 components of x.
c(x)                        # The array has names.
as.vector(x)                # The vector has no names.
#
# Example on a vector argument to a function
arg <- c(0:63)*pi/8; arg     # Generate a vector with pi/8 multiples.
sin_arg <- sin(arg); sin_arg   #
plot(sin_arg)
#
######################################################################
# 2.3: Examples on matrix definitions and vector, matrix operations.
#
# Define a matrix, c.f. [Kabacoff,2015] page 23; display the matrix 
#   and check its class and attributes.
#   Notice that the matrix is generated columnwise from a vector 1:N.
#   If generated by rows instead of by columns use the following 
#   attribute in the matrix argument: matrix( .... byrow=T)
#   
#   Now continue from here using by column  organisation. 
#   Notice there is no bycolumn (byrow=FALSE) attribute. 
#
Nelem <- 32; Nrow <- 4; Ncol <- 8  # Notice that Nelem = Nrow*Ncol (required) .
z <- matrix(1:Nelem, nrow=Nrow, ncol=Ncol, byrow=FALSE); z # Create a matrix. 
class(z)
attributes(z)    # Display the attributes on the console.
dim(z)           # Display the dimension on the console.
#
# Check matrix creation if too few elements 
# Notice no warning but circular allocation. 
z1 <- matrix(1:31, nrow=4, ncol=8, byrow=FALSE); z1 # Create an 4 x 8 matrix. 
#
# Get a single element in matrix z ("the lower rightmost corner element")
z[Nrow,Ncol]
# Get column number 2 in matrix z.
z[,2]
# Get row number 3 in matrix z.
z[3,]
# Get last row
z[Nrow,]
# Get last column
z[,Ncol]
# Get all rows, except row no. 2
z[-2,]
# Get all columns, except column no. 1
z[,-1]
#
# Transpose matrix z ("Exchange rows and columns") and display
z_t <- t(z); z_t
#
# The norm (length) of a vector:
z2 <- matrix(c(3,4), nrow=2, ncol=1); z2
length_z2 <- sqrt(t(z2)%*%z2); length_z2
#
# Multiply a matrix with a scalar, a vector and a matrix
z2=0.5*z; z2   
#
# Create a vector of apropriate size and multiply with matrix z
v <- matrix(c(0,0,0,1,0,0,0,0), nrow=8, ncol=1)
v
dim(v)
#
# Multiply matrix z and vector v and display the product.
zv <- z%*%v; zv    # Multiply and display.
z                  # Display matrix and verify column and zv.
#
# Scalar product (inner product, "dot" product) between 
#  two vectors w1 and w2.
w1 <- matrix(c(1,2,3,4,5,6), nrow=6, ncol=1); w1
w2 <- matrix(c(6,5,4,3,2,1), nrow=6, ncol=1); w2
a1 <- sum(w1*w2); a1  # Elementwise product and sum .
a2 <- t(w2)%*%w1; a2  # Matrix product of a row (use transpose) and a 
                      # column vector.
# Outer product of two vectors w1 and w2 into a matrix A1 and display
A1 <- w1 %*% t(w2); A1 
#
# Element wise product of two matrices
A2 <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=TRUE);A2
A3 <- matrix(c(6,5,4,3,2,1), nrow=2, ncol=3, byrow=TRUE);A3
A2A3 <- A2*A3;A2A3
#
# Arrays: matrices with more than 2 dimensions.
AR1 <- array(data=1:24,dim=c(3,4,2)) # 3 dim with dimensions 3x4x2
AR1  # Display AR1
AR2 <- array(1:24,c(3,3,2))  # identical array
AR2  # Display AR2
#
# Examples on special vectors and matrices
# Generate and display a column zero vector of size N=5.
N <- 5
zero_c <- matrix(rep(0,N), nrow=N, ncol=1); zero_c
#
# Generate and display a row vector with 1 of size N=5.
N <- 5
one_r <- matrix(rep(1,N), nrow=1, ncol=N); one_r
#
# Generate and display a matrix with zero entries
M0 <- matrix(0, nrow=3, ncol=2); M0
#
# Generate and display a diagonal matrix
?diag()            # Look into the manual of diag()
Md <- diag(c(1,2,3,4,5,6)); Md
#
# Generate and display a N x N unit matrix
Nd=5; Munit=diag(1,Nd); Munit
#
# 
# Define and exemplify multiplication of two matrices MM1 %*% MM2
# Notice that the number of columns in the leftmost matrix MM1
#   must be equal to the number of rows of the rightmost matrix MM2.
n1row <- 2;     n1col <- 3;   # Rows and columns of the leftmost matrix.
n2row <- n1col; n2col <- 4;   # Rows and columsn of the rightmost matrix.
MM1 <- matrix(1:(n1row*n1col),nrow=n1row, ncol=n1col); MM1
MM2 <- matrix(1:(n2row*n2col),nrow=n2row, ncol=n2col); MM2
MM12 <- MM1 %*% MM2; MM12  # F.inst chec manually some elements of MM12
#
#  Determine the inverse of a quadratic matrix.
# Create an example quadratic matrix A1
A1 <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=FALSE); A1
#
A1_inv <- solve(A1); A1_inv   # Determine and display the inverse of A1.
#
# Check that A1 and A1_inv are inverse by multiplying.
A1A1_inv <- A1 %*% A1_inv; A1A1_inv
#
# Check also the alternative ordering
A1_invA1 <- A1_inv %*% A1; A1_invA1
#
# Solve a quadratic equation system A1 %*% x1 = a1
a1=matrix(c(5,6), nrow=2, ncol=1, byrow=FALSE); a1
x1 <- A1_inv %*% a1; x1
#
# Example on LS (Least Squares) solving of an overdetermined 
# or quadratic or underdetermined linear equation system using 
# the normal equations. 
# Notice there are a large collection of methods for solving 
# linear equations.
# The solution to the equation system B1 %*% x=b1, using the normal 
# equation is, using the following representations:
#   inv(A): inverse matrix of A.
#   t(A): Transposed of matrix A.
# The normal equation solution then becomes:
#   x = inv(t(B1) %*% B1) %*% (t(B1) %*% b1)
# Now, exemplify by the following example equations:
B1 <- matrix(c(1,2,3,4,5,6,7,8), nrow=4, ncol=2, byrow=FALSE); B1
b1 <- matrix(c(9,10,11,12), nrow=4, ncol=1, byrow=FALSE); b1
# 
# Using the normal equation solution above leads to
tB1B1=t(B1) %*% B1; tB1B1
tB1B1_inv <- solve(tB1B1); tB1B1_inv
# Finally solve for vector x
x <- tB1B1_inv %*% (t(B1) %*% b1); x
# Check that the solution is fulfilling the original equation:
#                      B1 %*% x = b1
b1_estim <- B1 %*% x; b1_estim
#
# Check if the normal equation also work for the above 
#   quadratic eq. sys. A1 %*% x1 = a1
tA1A1=t(A1) %*% A1; tA1A1
tA1A1_inv <- solve(tA1A1); tA1A1_inv
x2 <- tA1A1_inv %*% (t(A1) %*% a1); x2 # Verify that x2 = x1 above.
#
# Build a symmetrical matrix and determine the eigenvalues and 
#   eigenvectors.
#
C <- matrix(c(1, 5, 7,  5, 1, 5,  7, 5, 1), nrow=3, ncol=3, byrow=TRUE)
C
?eigen()           # Manual for the function determining eigenvectors 
                   #  and values.
eigenC <- eigen(C)
eigenC$val        # Eigenvalues of C, because C is symmetric the eigen-
                  # values are real. Notice that $ is used as separator.
eigenC$vec        # Eigenvectors of C
#
# Check orthogonal eigenvectors one by one
t(eigenC$vec[,1]) %*% eigenC$vec[,2]   # Col 1 and Col. 2
t(eigenC$vec[,2]) %*% eigenC$vec[,3]   # Col 2 and Col. 3
t(eigenC$vec[,3]) %*% eigenC$vec[,1]   # Col 3 and Col. 1
# 
# Check orthogonal eigenvectors by matrix multiplication
t(eigenC$vec) %*% eigenC$vec  # Verify manually that it is diagonal.
# ------------------------------------------------------------------------
# Further examples on fundamental decompositions from Linear Algebra
# available. Please notice that, in the interest of the limited time, 
# these functions will not be exemplified at this point but only 
# referenced, as shown below:
#
# QR decomposition of matrix A, into a product of 
#  an orthogonal matrix Q, and an upper triangular matrix R, A=QR.
# 
?qr()   # Look into the manual for qr() decomposition.
        # A=QR, Q: orthogonal matrix, R: upper triangular matrix.
#
# Singular Value Decomposition of a matrix A into a product of 
# 3 matrices, such that A=UDV', where matrices U and V are orthogonal
# and V' is the transposed of matrix V. The columns of U are called
# the left singular vectors. The columns of V are called the right 
# singular vectors. The diagonal matrix D contains the singular values 
# of the matrix A.
#
?svd()  # Look into the manual for svd()
#
############################################################################
# lists: the most general collection of objects, which can be of 
#        mixed types.
#
?list()   # Check manual for the list() function.
obj1 <- 1:3; obj2 <- c('text1', 'text2', 'text3'); 
Nelem <- 6; Nrow <- 3; Ncol <- 2  # Notice that Nelem = Nrow*Ncol (required) .
obj3 <- matrix(1:Nelem, nrow=Nrow, ncol=Ncol, byrow=FALSE) # Create a matrix. 
m1 <- list(name1=obj1, name2=obj2, name3=obj3); m1
#
# Accessing list objects individually through names
m1$name1
m1$name2
m1$name3
#
# Accessing list objects individually through indexing
m1[[1]]       # The same as m1$name1
m1[['name1']] # The same as m1$name1
m1[2]         # The same as m1$name2
m1[3]         # The same as m1$name3
#
m1$name1[2]   # The same as obj1[2]
m1$name2[3]   # The same as obj2[3]
m1$name3[2,2] # The same as obj3[2,2]
#
###########################################################################
# Factors are used for storing of possibly ordered categorical data.
#
# Example: 
# Likert scale for representing responses from surveys.
# factor levels: Strongly Agree (SA), Agree (A), 
#                Neutral (N), 
#                Disagree(D), Strongly Disagree (SD).
# INCLUDE ORDERED
#
?factor()      # Check manual for factor
survey.vector <- c('A','SA','N','SD','A','A','D')
survey.vector

# Assign numerical value to category by ordered list
#
survey.factor <- factor(survey.vector, order=TRUE, 
                        levels=c('SD','D','N','A','SA'))
#                       values     1   2   3   4  5 
survey.factor
(as.numeric(survey.factor)) # Check the numerical values of categories. 
#
########################################################################
# 2.4: Examples on definition and operations on data frames.
#
?data.frame() # Initially look into the manual for data.frame().
              # QUOTE FROM MANUAL: "This function creates data frames, 
              # tightly coupled collections of variables which share many 
              # of the properties of matrices and of lists, used as the 
              # fundamental data structure by most of R's modeling software".
              #
# In the following is an example on a data frame for the represen-
# tation of heterogeneous data from an example on user assessments of 
# products. The example contains the following operations: 
#  - create a data frame.
#  - Insert a new variable in a data frame.
#  - Merge two sets of observations for the same set of variables.
#  - Identifying missing values in a data frame.
#  - Excluding missing values from data frame in preparation for analysis.
#  - Grouping observations into age groups: 
#    Teen (13-19), Young (20-39), MidAged (40-69), 
#    MidAgeP (70-79), Old (80-).
#  - Sorting observations in a data frame according to one variable.
#  - Plot selected parts of data frame.
#
# 2.4.1: Create a data frame -------------------------------------------
#
# Problem: Create a data frame which contains a mixture of numerical and 
#          character values, exemplified by customer assessment of two 
#          products, using a Likert scale for the product assessment.
#
# The Likert scale used is as follows:
# Scale value 5: The customer strongly agree (SA) in a statement about the product.
# Scale value 4: The customer agree (A) in a statement about the product.
# Scale value 3: The customer is neutral (N) with respect to a statement about 
#                the product.
# Scale value 2: The customer disagree (D) with respect to a statement about 
#                the product.
# Scale value 1: The customer strongly disagree (SD) with respect to a statement 
#                about the product.
# Scale value NA: The customer abstains (AB) from assessing the statement.
#
# There are two products, denoted Product 1 and Product 2.
# Each customer assessment is labeled with the gender of the customer.
# Each customer register the customer age.
# Each customer assesses the correctness of each of 3 statements about the product.
# The 3 statements are as follows:
#   S1: The product is useful.
#   S2: The product price is acceptable.
#   S3: The customer will, without hesitation, recommend the product to a 
#       person known well by the customer. 
#
# In the present example there are 8 customers.
#
# Now build a data frame for representing the above assessment on the 
#  two products: Product 1 and Product 2. 
#
?c()                                         # Display manual.
Prod_no <- c(1,1,2,1,2,1,2,2 )               # The products assessed by the 
                                             #   customer 1 to 8.
Gender <- c("F","F","M","F","M","M","F","M") # F: Female and M: Male.
Age <- c(37,81,57,79,17,18,67,45)            # The customers ages
S1 <- c(4,3,2,5,NA,3,5,5)                    # Assessments of Statement S1.
S2 <- c(3,4,1,4,3,NA,1,1)                    # Assessments of Statement S2.
S3 <- c(4,3,2,5,3,3,4,5)                     # Assessments of Statement S3.
Assessments <- data.frame(Prod_no, Gender, Age, S1, S2, S3) # Create d. frame.
Assessments                   # Display the values in the complete data frame.
Assessments$Prod_no           # Display the product numbers, assessed.
Assessments$Gender            # Display the customer gender.
Assessments$Age               # Display the customers age.
Assessments$S1                # Display customer replies for Statement 1.
Assessments$S2                # Display customer replies for Statement 2.
Assessments$S3                # Display customer replies for Statement 3.
#
# 2.4.2: Insert a new variable in a data frame ----------------------------------
#
# Example: Extend the Assessments data frame with one more question S4.
#          Insert a new column S4 in the dataframe.
# 
# S4: The product design is attractive.
#
S4 <- c(5 ,3 ,1 ,4 ,3 ,4 ,5 ,NA )
?transform()        # Look into the manual
Assessments_1 <- transform(Assessments, S4=S4)
Assessments_1
# ... alternative solution using cbind() (Bind a new column to the dataframe).
Assessments_2 <- cbind(Assessments, S4)
Assessments_2
#
# 2.4.3: -------------------------------------------------------------------------
#   Merge two sets of observations for the same set of variables.
#      Insert additional rows with observations in a data frame a generate 
#      a new extended dataframe.
#      Notice: In this example the observations from one location is 
#             just repeated at the other location.
#
Assessments_location_A <- Assessments   # Create assessments for one 
                                        # location denoted A.
Assessments_location_B <- Assessments   # Create assessments for one 
                                        # other location B.
# One dataframe with all observations.
Assessments_all <- rbind(Assessments_location_A, Assessments_location_B) 
Assessments_all
#
# 2.4.4: Identifying missing values in a data frame -------------------------------
#
# Example: Identify the observations (rows) in the data frame with 
#          missing values.
#
?is.na()                                # Manual for is.na()
Missing <- is.na(Assessments_1[,4:7])   # Check 4 columns  
Missing
#
# 2.4.5: Excluding missing values from data frame in preparation for analysis.
#
?na.omit()
Assessments_2 <- na.omit(Assessments_1) # Exclude those data frame rows (observations) 
                                        # with NA.
Assessments_2
#
# 2.4.6: Grouping observations into age groups: 
#        Teen, Young, MidAged, MidAgeP, Old
# Teen (13-19), Young (20-39), MidAged (40-69), MidAgeP (70-79), Old (80-)
# Include the age categories in a new variable in the data frame Assessments.
#
Assessments$AgeCat[Assessments$Age >= 13 & Assessments$Age <= 19] <- "Teen"
Assessments$AgeCat[Assessments$Age >= 20 & Assessments$Age <= 39] <- "Young"
Assessments$AgeCat[Assessments$Age >= 40 & Assessments$Age <= 69] <- "MidAge"
Assessments$AgeCat[Assessments$Age >= 70 & Assessments$Age <= 79] <- "MidAgeP"
Assessments$AgeCat[Assessments$Age >= 80]  <- "Old"
Assessments       # Display Assessments with age categories.
#
# 2.4.7: Sorting observations in a data frame according to one variable -----------
#
#
?order()                  # Display the manual for the function order().
# Reuse the data frame with product assessments and sort the assessments 
# according to the customer age.
Prod_no <- c(1,1,2,1,2,1,2,2 )                # The products assessed by the 
                                              # customers.
Gender <- c("F","F","M","F","M","M","F","M")  # F: Female and M: male.
Age <- c(37,81,57,79,17,18,67,45)             # The customers ages
S1 <- c(4,3,2,5,NA,3,5,5 )                    # Assessments of Statement S1.
S2 <- c(3,4,1,4,3,NA,1,1 )                    # Assessments of Statement S2.
S3 <- c(4,3,2,5,3,3,4,5 )                     # Assessments of Statement S3.
Assessments <- data.frame(Prod_no, Gender, Age, S1, S2, S3) # Create the data 
                                                            # frame.
Assessments  # Display the values in the complete data frame.
Assessments_sorted <- Assessments[order(Assessments$Age),]
Assessments_sorted
#
# 2.4.8: Plot selected parts of data frame exemplified by the Assessments 
#        data frame.
#
?plot()           # Display manual for plot()
?with             # Display manual for with()
with(Assessments, {
  Assessments
  plot(Age,S3);title(main = "S3: Customer recommendation of products.")
  plot(Age,Prod_no); title(main = "Product number assessed by customer at 
  given age.")
})
################################################################################
# 2.4.9: Deleting (removing) rows or columns in dataframes.
#
x1 <- c("(row 1, col 1)", "(row 2, col 1)", "(row 3, col 1)", "(row 4, col 1)") 
x2 <- c("(row 1, col 2)", "(row 2, col 2)", "(row 3, col 2)", "(row 4, col 2)")
x3 <- c("(row 1, col 3)", "(row 2, col 3)", "(row 3, col 3)", "(row 4, col 3)")
xx <- data.frame(x1,x2,x3) # Form data frame.
xx
#
# Remove row 2 from xx, generate xx1 and display for verification.
xx1 <- xx[-2,] # Remove row 2.
head(xx1)      # Check that row 2 is removed.
head(xx)       # ... for comparison.
#
# Remove col 2 from xx, generate xx2 and display for verification.
xx2 <- xx[,-2] # Remove col. 2.
head(xx2)      # Check that col 2 is removed.
head(xx)       # ... for comparison
# 
# Remove consequtive rows
xx3 <- xx[-3:-2,] # remove row 2 and 3.
head(xx3)      # Check that row 2 and 3 are deleted.
head(xx)
#
# Remove column 2 from xx.
xx[,2] <- NULL
xx
################################################################################
# 2.5: Exemplifying factors 
#      (factors: Ordinal variables, where only the ordering matters.
#                The numerical values and differences does not matter.)
#      Ref. [Kabacoff, 2015] page 28.  
#
?factor()         # Check manual on factor.
#
# 2.5.1: Example on using the above Likert scale, repeated here for convenience
# Scale value 5: The customer strongly agree in a statement about the product.
# Scale value 4: The customer agree in a statement about the product.
# Scale value 3: The customer is neutral with respect to a statement about 
#                the product.
# Scale value 2: The customer disagree with respect to a statement about 
#                the product.
# Scale value 1: The customer strongly disagree with respect to a statement 
#                about the product.
# Scale value NA: The customer has not assessed the statement.
#
reply <- c("neutral","agree","strongly agree","neutral") # Four replies.
#
c1=c("strongly disagree");c2=c("disagree");c3=c("neutral");c4=c("agree");
c5=c("strongly agree")
levels_1 <- c(c1,c2,c3,c4,c5) # Define levels in ordinal variable.
reply_1 <- factor(reply, order=TRUE, levels=c(c1,c2,c3,c4,c5));reply_1
##########################################################################
# 2.6: Further examples on defining and applying lists.
#      Ref. [Kabacoff, 2015] page 30.
#
# A list is a ordered collection of objects.
#
?list()     # Manual for list()
#
# Using the example [Kabacoff, 2015] page 31, demonstrates example of
# a list with: a string, a numeric vector, a matrix and a character vector.
g <- "first list"
h <- c(25,26,18,39)
j <- matrix(1:10, nrow=5)
k <- c("one","two","three")
newlist <- list(title=g,ages=h,j,k)
newlist
#
# Refer to the second object in the list, by index [2]
newlist[[2]]
# Refer to the second object in the list, by name ["ages"]
newlist[["ages"]]
# Refer to the second named component
newlist$ages
# refer to the first named component
newlist$
##########################################################
# 2.7:  Examples on program control structures|\\
#
# 2.7.1: The if-else condition|
# if (condition) expr1 else expr2
x <- 4; y <- 20
if (x==0) y <- 0 else y <- y/x
y
#--------------------------------------------------------
# 2.7.2: The for-loop
#
for (ii in 2012:2016){
print(paste("The year is", ii))
}
#--------------------------------------------------------
# 2.7.3: The while-loop 
# while (condition) expr 
#
while (x > 0) {print(x); x <- x-1;} 
#
#--------------------------------------------------------
# 2.7.4: The repeat function
# repeat expr, use break to exit the loop
#
x <- 0; xbreak <- 5
repeat {print(x); x <- x+1; if (x>xbreak) break}
#
#--------------------------------------------------------
# 2.7.5: Define an R function returning cubes
#        of a sequence of integers, here
#        cubes of 2, 3 and 4. 
# 
arg1 <- 2; arg2 <- 4;
newfunction <- function(arg1, arg2){  # Define function.
cubes <- (arg1:arg2)^3
return(cubes)
}
result <- newfunction(arg1,arg2)  # Apply function.
result                            # Display result.
#
###############################################################################
# 3.0: Sets, Combinations, Permulations and Probability Distributions.
###############################################################################
.libPaths()
.libPaths("C:/R_packages")
.libPaths()
install.packages("e1071",lib="C:/R_packages/")
library("e1071",lib="C:/R_packages/")
help(package="e1071",lib="C:/R_packages/")
#
#----------------------------------------------------------------------------
# 3.1: Bionomial Distribution and mean and variance.
#
?dbinom()        # Check manual the Binomial Distribution
#
# Before plotting, save the status of the graphical parameters.
# old.par <- par(mar = c(0, 0, 0, 0))
# and use this after the plotting
# par(old.par)
#
# Plot the discrete binomial distribution function for n=1, p=03
x1 <- dbinom(0:1,size=1,prob=0.3)
barplot(x1,names.arg = c(0,1))
title(main="Binominal distribution with n=1, p=0,3")
#
x2 <- dbinom(0:2,size=2,prob=0.3)
barplot(x2,names.arg = c(0:2))
title(main="Binominal distribution with n=2, p=0,3")
#
x5 <- dbinom(0:5,size=5,prob=0.3)
barplot(x5,names.arg = c(0:5))
title(main="Binominal distribution with n=5, p=0,3")
#
x10 <- dbinom(0:10,size=10,prob=0.3)
barplot(x10,names.arg = c(0:10))
title(main="Binominal distribution with n=10, p=0,3")
#
x25 <- dbinom(0:25,size=25,prob=0.3)
barplot(x25,names.arg = c(0:25))
title(main="Binominal distribution with n=25, p=0,3")
#
x100 <- dbinom(0:100,size=100,prob=0.3)
barplot(x100,names.arg = c(0:100))
title(main="Binominal distribution with n=100, p=0,3")
#
#
par(opar)                       # Restore default settings before continuing.
par(mfrow=c(2,3))               # 2 rows and 3 columns.
barplot(x1,names.arg = c(0,1))
title(main="Binom. dist. n=1, p=0,3")
barplot(x2,names.arg = c(0:2))
title(main="Binom. dist. n=2, p=0,3")
barplot(x5,names.arg = c(0:5))
title(main="Binom. dist. n=5, p=0,3")
barplot(x10,names.arg = c(0:10))
title(main="Binom. dist. n=10, p=0,3")
barplot(x25,names.arg = c(0:25))
title(main="Binom. dist. n=25, p=0,3")
barplot(x100,names.arg = c(0:100))
title(main="Binom. dist. n=100, p=0,3")
par(opar)
#
#--------------------------------------------------------------------------
# save plot into file in the working directory.
pdf(file = "fig_2_1_binom.pdf")
par(mfrow=c(2,3))               # 2 rows and 3 columns.
barplot(x1,names.arg = c(0,1))
title(main="Binom. dist. n=1, p=0,3")
barplot(x2,names.arg = c(0:2))
title(main="Binom. dist. n=2, p=0,3")
barplot(x5,names.arg = c(0:5))
title(main="Binom. dist. n=5, p=0,3")
barplot(x10,names.arg = c(0:10))
title(main="Binom. dist. n=10, p=0,3")
barplot(x25,names.arg = c(0:25))
title(main="Binom. dist. n=25, p=0,3")
barplot(x100,names.arg = c(0:100))
title(main="Binom. dist. n=100, p=0,3")
par(opar)
dev.off()
#
#------------------------------------------------------------
# 3.2 Examples of mean and median value of a set of numbers.
#
x <- c(1:10,50);x
?mean()                           # Check manual.
x_mean <- mean(x); x_mean
?median()                         # Check manual.
x_median <- median(x); x_median   # Why is the xmedian= 6?
#
# Examples of variance and standard deviation.
#
?var()                          # Check manual.
x_var <- var(x); x_var
?sd()                           # Check manual.
x_sd  <- sd(x); x_sd            
#---------------------------------------------------------------
# 3.3: Set operations, sampling, union, intersect, difference, 
#
?union()          # Check manual for set operations.
?intersect()
?setdiff()
?setequal()
?sort()           # Check manual.
?sample()         # Check the random sampling function.
#
# sample: Select randomly 9 values from the set 1:20 .
x <- c(sort(sample(1:20, 9)), NA); x
y <- c(sort(sample(3:23, 7)), NA); y
xy_union <- union(x, y); xy_union
xy_intersect <- intersect(x, y); xy_intersect
xy_setdiff <- setdiff(x, y); xy_setdiff
yx_setdiff <- setdiff(y, x); yx_setdiff 
xy_setequal <- setequal(x, y); xy_setequal
#--------------------------------------------------------------
# 3.4: Combinations and Permutations.
#
install.packages("combinat",lib="C:/R_packages/")
library("combinat",lib="C:/R_packages/")
help(package="combinat",lib="C:/R_packages/")
#installed.packages()
#
# Generate all combinations of two letters from a,b,c,d .
# Notice that when generating combinations: the order does not
# matter. This means at the combinations a,b and b,a does only
# count for one.
?combn()              # Check manual
a1 <- combn(letters[1:4], 2); a1
# ... now try two letter combinations from 10 letters.
a2 <- combn(1:10, 2);a2
a2_size <- dim(a2); a2_size
a2_comb_count <- a2_size[2]; a2_comb_count 
#
# Check the count against the formula for the number of
# combinations of n takem r at a time.
?factorial()                # Check n! the factorial function
# --------------------------------------------------------------------
# 3.5: Generate all permutations of the numbers 0:3.
# Notice that when generating permulations: the the order does
# matter. This means at the permutations 0,1,2,3 and 1,0,2,3 are different
# and each contribute with one to the total count of the number of 
# permutations.
a3 <- permn(c(0:3));a3  # Generate a list with permutations.
a3_class <- class(a3); a3_class
a3_length <- length(a3); a3_length
#
# Check that the number of permutations against the formula
# for the number of permulations of a set of distinct elements
# 
perm_4 <- factorial(4);perm_4  
# Notice, as expected perm_4=4!=4*3*2*1=24
# -----------------------------------------------------------------
# 3.6: Central Limit Theorem (CLT) ex. with runif() uniform density seed.
#
# The Central Limit Theorem: 
#  The mean of a set of independent, identically distributed (iid) random 
#  variables where mean and variance exist, will approximate a normal distribution 
#  for increasinbg set size.
#
?runif   # Check manual for generator for random uniform distributions.
#
Nr <- 5000  # Repeat all experiments Nr times

x1_1 <- replicate(Nr, {
  mm <- runif(1)
  sum(mm)
})

x1_2 <- replicate(Nr, {
  mm <- runif(2)
  sum(mm)
})

x1_4 <- replicate(Nr, {
  mm <- runif(4)
  sum(mm)
})

x1_6 <- replicate(Nr, {
  mm <- runif(6)
  sum(mm)
})

x1_10 <- replicate(Nr, {
  mm <- runif(10)
  sum(mm)
})

x1_20 <- replicate(Nr, {
  mm <- runif(20)
  sum(mm)
})

x1_30 <- replicate(Nr, {
  mm <- runif(30)
  sum(mm)
})

x1_50 <- replicate(Nr, {
  mm <- runif(50)
  sum(mm)
})

x1_100 <- replicate(Nr, {
  mm <- runif(100)
  sum(mm)
})

par(opar)                       # Restore original parameters.
par(mfrow=c(3,3))               # 3 rows and 3 columns.
hist(x1_1, breaks=50, main="Nr=5000, u1")
hist(x1_2, breaks=50, main="Nr=5000, u1+u2")
hist(x1_4, breaks=50, main="Nr=5000, u1+u2+u3+u4")
hist(x1_6, breaks=50, main="Nr=5000, u1+...+u6")
hist(x1_10, breaks=50, main="Nr=5000, u1+...+u10")
hist(x1_20, breaks=50, main="Nr=5000, u1+...+u20")
hist(x1_30, breaks=50, main="Nr=5000, u1+...+u30")
hist(x1_50, breaks=50, main="Nr=5000, u1+...+u50")
hist(x1_100, breaks=50, main="Nr=5000, u1+...+u100")
par(opar)
dev.off()
#
#--------------------------------------------------------------------------
# save plot into file in the working directory.
pdf(file = "fig_2_CLT_unif.pdf")
par(opar)                       # Restore original parameters.
par(mfrow=c(3,3))               # 3 rows and 3 columns.
hist(x1_1, breaks=50, main="Nr=5000, u1")
hist(x1_2, breaks=50, main="Nr=5000, u1+u2")
hist(x1_4, breaks=50, main="Nr=5000, u1+u2+u3+u4")
hist(x1_6, breaks=50, main="Nr=5000, u1+...+u6")
hist(x1_10, breaks=50, main="Nr=5000, u1+...+u10")
hist(x1_20, breaks=50, main="Nr=5000, u1+...+u20")
hist(x1_30, breaks=50, main="Nr=5000, u1+...+u30")
hist(x1_50, breaks=50, main="Nr=5000, u1+...+u50")
hist(x1_100, breaks=50, main="Nr=5000, u1+...+u100")
par(opar)
dev.off()
#
# -----------------------------------------------------------------
# 3.7: Central Limit Theorem (CLT) ex. with rbinom() binomial density seed.
#
# The Central Limit Theorem: 
#  The mean of a set of independent, identically distributed (iid) random 
#  variables where mean and variance exist, will approximate a normal distribution 
#  for increasinbg set size.
#
# 
?rbinom()   # Check manual for generator for random binomial distributions.
#
Nr <- 5000   # Repeat all experiments Nr times
p=0.5        # Probability of sucess.
#
x1_1 <- replicate(Nr, {
  mm <- rbinom(1, size=1, prob=p)
  sum(mm)
})

x1_2 <- replicate(Nr, {
  mm <- rbinom(1, size=2, prob=p)
  sum(mm)
})

x1_4 <- replicate(Nr, {
  mm <- rbinom(1, size=4, prob=p)
  sum(mm)
})

x1_6 <- replicate(Nr, {
  mm <- rbinom(1, size=6, prob=p)
  sum(mm)
})

#
x1_10 <- replicate(Nr, {
  mm <- rbinom(1, size=10, prob=p)
  sum(mm)
})

x1_20 <- replicate(Nr, {
  mm <- rbinom(1, size=20, prob=p)
  sum(mm)
})

x1_30 <- replicate(Nr, {
  mm <- rbinom(1, size=30, prob=p)
  sum(mm)
})

x1_50 <- replicate(Nr, {
  mm <- rbinom(1, size=50, prob=p)
  sum(mm)
})

x1_50 <- replicate(Nr, {
  mm <- rbinom(1, size=100, prob=p)
  sum(mm)
})

par(opar)                       # Restore original parameters.
par(mfrow=c(3,3))               # 3 rows and 3 columns.
hist(x1_1, breaks=50, main="Nr=5000, u1")
hist(x1_2, breaks=50, main="Nr=5000, u1+u2")
hist(x1_4, breaks=50, main="Nr=5000, u1+u2+u3+u4")
hist(x1_6, breaks=50, main="Nr=5000, u1+...+u6")
hist(x1_10, breaks=50, main="Nr=5000, u1+...+u10")
hist(x1_20, breaks=50, main="Nr=5000, u1+...+u20")
hist(x1_30, breaks=50, main="Nr=5000, u1+...+u30")
hist(x1_50, breaks=50, main="Nr=5000, u1+...+u50")
hist(x1_100, breaks=50, main="Nr=5000, u1+...+u100")
par(opar)
dev.off()
#--------------------------------------------------------------------------
# save plot into file in the working directory.
pdf(file = "fig_2_CLT_binom.pdf")
par(opar)                       # Restore original parameters.
par(mfrow=c(3,3))               # 3 rows and 3 columns.
hist(x1_1, breaks=50, main="Nr=5000, u1")
hist(x1_2, breaks=50, main="Nr=5000, u1+u2")
hist(x1_4, breaks=50, main="Nr=5000, u1+u2+u3+u4")
hist(x1_6, breaks=50, main="Nr=5000, u1+...+u6")
hist(x1_10, breaks=50, main="Nr=5000, u1+...+u10")
hist(x1_20, breaks=50, main="Nr=5000, u1+...+u20")
hist(x1_30, breaks=50, main="Nr=5000, u1+...+u30")
hist(x1_50, breaks=50, main="Nr=5000, u1+...+u50")
hist(x1_100, breaks=50, main="Nr=5000, u1+...+u100")
par(opar)
dev.off()
#-----------------------------------------------------------------------
# 3.8: The standard normal density function, mean=0, variance=1.
# 
?rnorm()     # Check manual for normal distribution.
Ns=100000    # Number of samples.
mean <- 0; sd <- 1
z1 <- rnorm(Ns, mean, sd)  # 
(class(z1))
plot(z1)
par(opar)
hist(z1, breaks=100)        # Plot hist with 50 bins=breaks.
par(opar)
#
x <- seq(-3,3,0.1)
# density
d1 <- dnorm(x, mean = 0, sd = 1)
# distribution
p1 <- pnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
plot(x,d1, main="Std. normal density function, pnorm(), m=0, sd=1");
plot(x,p1, main="Std. normal distribution function, dnorm(), m=0, sd=1")
#
# Plot to pdf files
pdf(file = "fig_2_4_Std_Norm_Density.pdf")
plot(x,d1, main="Std. normal density function, pnorm(), m=0, sd=1");
dev.off()
par(opar)
pdf(file = "fig_2_5_Std_Norm_Distribution.pdf")
plot(x,p1, main="Std. normal distribution function, dnorm(), m=0, sd=1")
dev.off()
par(opar)
#
?qnorm()   # Quantile function.
x<-seq(0,1,0.01)  
q1 <- qnorm(x, mean=0, sd=1)
plot(x,q1, main="Inverse cumulative std. normal distribution, qnorm()")
#
# Plot to pdf files
par(opar)
pdf(file = "fig_2_6_Inv_Std_Norm_Cumulative.pdf")
plot(x,q1, main="Inverse cumulative std. normal distribution, qnorm()")
dev.off()
par(opar)
#
# Limits such that P(x>limit) is 0.5%, 1%, 2.5%, 5%, 10%, 25%, 50%.
# NOTICE: lower.tail = FALSE => the upper tail is used.
#
(q_0.005 <- qnorm(0.005, mean=0, sd=1, lower.tail=FALSE))
(q_0.01 <- qnorm(0.01, mean=0, sd=1,lower.tail=FALSE))
(q_0.025 <- qnorm(0.025, mean=0, sd=1, lower.tail=FALSE))
(q_0.05 <- qnorm(0.05, mean=0, sd=1,lower.tail=FALSE))
(q_0.1 <- qnorm(0.1, mean=0, sd=1, lower.tail=FALSE))
(q_0.25 <- qnorm(0.25, mean=0, sd=1,lower.tail=FALSE))
(q_0.50 <- qnorm(0.5, mean=0, sd=1, lower.tail=FALSE))
#
#########################################################################