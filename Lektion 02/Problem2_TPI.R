
## problem 2  Tobias P.

## define the individual columns of the data frame
customerID <- c(1, 2, 3, 4, 5, 6, 1, 4, 7, 8, 9, 10, 9, 5)
location <-
  c(
    "west",
    "south",
    "east",
    "west",
    "south",
    "south",
    "west",
    "west",
    "west",
    "south",
    "east",
    "south",
    "east",
    "south"
  )
gender <-
  c(
    "male",
    "female",
    "male",
    "male",
    "male",
    "female",
    "male",
    "male",
    "male",
    "male",
    "female",
    "male",
    "female",
    "male"
  )

age <- c(
  "LA",
  "LA",
  "MAD",
  "VOA",
  "VOA",
  "LAD",
  "LA",
  "VOA",
  "LA",
  "MAD",
  "MAD",
  "MAD",
  "MAD",
  "VOA"
)
#later adolescence = LA
#early adulthood = EAD
#middle adulthood = MAD
#later adulthood = LAD
#very old age = VOA

a <- "Agree"
b <- "Neither Agree nor Disagree"
c <- "Disagree"
assessment <- c(a,a,b,c,a,c,b,a,b,a,a,c,c,b)
assessment <- factor(assessment,order=TRUE,levels = c(c,b,a))

## Q1 create first frame
frame1 <- data.frame(customerID,age,gender,location,assessment)

## Q2 sort frame (example)
orderedFrame <- frame1[order(frame1$assessment),]


## Q3 add parameter (income low, middle, high)
a <- "low"
b <- "middle"
c <- "high"
income <- c(c,a,b,a,b,a,c,a,b,b,b,c,b,b)
extendedFrame <- cbind(frame1,income)

## Q4 merge two data frames 
frame2 <- data.frame(customerID,income) #customerID taken as common parameter 

mergedFrame <- merge(frame1,frame2)  #ADDS ALL MULTIPLE OCCURENCES OF CUSTOMER ID 
#TO THE MERGED FRAME (??)



