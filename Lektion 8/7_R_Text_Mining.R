# 7_R_Text_Mining_v9_CV_2017_03_23.R
#
#      Verify a single txt document analysis example using the
#      packages "tm", "wordcloud" and their required packages.
#      Required txt document in RStudio working directory: doc_1.csv
#      which is a csv file extracted from the pdf file
#      R_data_export_import.pdf acquired from [R Core, 2015a].
#
#      The pdf document file conversion to csv are using
#      the following: 
#         Save pdf file from Adobe Acrobat Pro DC -> format *.xlsx
#         Save file from Excel -> CSV (Comma delimited) *.csv
#
#                    REFERENCES
# [R Core, 2015a] R Core Team, "R Data Import/Export", 
#     https://cran.r-project.org/doc/manuals/R-data.pdf
#
# 7.1: Wordcloud on a single document.
# 7.2: Read a folder with pdf files and convert these to txt files in 
#      the same folder. Requires installation of pdftotext.exe
#
##########################################################################
# Enter the main R Language documentation.
#
help.start()   # This is the main entry to the R project documentation.
opar.org <- par(no.readonly=TRUE) # Remember original parameters.
loc <- 'c:/Users/tobiasp/Documents/Big Data/R_packages/'              # Use this folder for packages.
home <- 'c:/Users/tobiasp/Documents/Big Data/R-code/Lektion 8/'

setwd(home)
#
##########################################################################
# 7.1: Wordcloud on a single document
#
#      Notice: This section does not require a pdf2txt conversion.
#
install.packages("tm",lib=loc)           # Text mining package.
install.packages("NLP",lib=loc)          # Natural Language Processing package.
install.packages("wordcloud",lib=loc)    # Wordcloud package.
install.packages("RColorBrewer",lib=loc) # Color package.
#
library("NLP",lib=loc)
library("tm",lib=loc)
library("RColorBrewer",lib=loc)
library("wordcloud", lib=loc)
#
#----------------------------------------------------------------------------
docs <- read.csv("doc_1.csv", colClasses="character", stringsAsFactors=FALSE)
head(docs,20)
str(docs)              # Inspect the first lines in the doc_1.csv file
class(docs)            # docs is a data frame
attributes(docs)       # 
(nrow(docs))           # Print the number of rows in data frame.
docs[1:100,]           # Inspect the 100 top lines in document.
docs[200:209,]         # Print 10 rows from row no. 200 in dataframe docs.
#-------------------------------------------------------------------------
# Paste all lines with a space into one vector.
#
docs_txt <- paste(docs, collapse=" ")
str(docs_txt)
class(docs_txt)
attributes(docs_txt)
summary(docs)
#
# Create a corpus with one document.
#
docs_source <- VectorSource(docs_txt)
str(docs_source)
corpus <- Corpus(docs_source) # Convert into a corpus.
corpus                        # List what's in the corpus.
str(corpus)
head(corpus,15)
## Write document no. 1 in the corpus with one document.
writeLines(as.character(corpus[[1]]))

#
# Cleaning the corpus
corpus <- tm_map(corpus, content_transformer(tolower))
?tm_map()
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
str(corpus)            # Inspect structure of corpus
#
# Create the document term matrix.
?DocumentTermMatrix()         # Inspect the manual.
#
# Create a document term matrix with one row.
dtm <- DocumentTermMatrix(corpus)
inspect(dtm[1,1:3])          # Display 51 positions in dtm
inspect(dtm[1,1700:1750])     # Display 51 positions in dtm
str(dtm)                      # Inspect internal structure.
dtm2 <- as.matrix(dtm)
str(dtm2)                     # Inspect internal structure. 
#
# Frequency
frequency <- colSums(dtm2)
str(frequency)
class(frequency)
#
# Sort to find the words with highest frequency.
frequency <- sort(frequency, decreasing=TRUE)
frequency
# 
# Inspect the 30 most frequently represented words.
head(frequency,30)
#
# List the 200 most frequent words.
words <- names(frequency) # List words to be cluttered.
words[1:200]
#
# Plot the top 200 words in a wordcloud. 
# The word size is representing the frequency of that word.
# random.order=TRUE => the words are plotted in random order.
# rot.per= 0.5 => half of the words are rotated 90 degrees.
#
par(opar.org)
wordcloud(words[1:200], frequency[1:200], random.order=TRUE,
          rot.per=0.50)
par(opar.org)
#
# Plot the top 200 words in a wordcloud. 
# The word size is representing the frequency of that word.
# random.order=FALSE => the words are plotted in order of
#                       decreasing frequency.
# rot.per = 0 => no rotation of the words.
#
wordcloud(words[1:200], frequency[1:200], random.order=FALSE,
          rot.per=0)
#
par(opar.org)
pdf("fig_7_1_200_words_random.pdf")
wordcloud(words[1:200], frequency[1:200], random.order=TRUE,
          rot.per=0.5)
dev.off()
par(opar.org)
#
par(opar.org)
pdf("fig_7_1_200_words_not_random.pdf")
wordcloud(words[1:200], frequency[1:200], random.order=FALSE,
          rot.per=0)
dev.off()
par(opar.org)
#
par(mfrow=c(1,3))        # 1 rows and 3 columns.
wordcloud(words[1:3], frequency[1:3], rot.per=0, random.order=FALSE)
wordcloud(words[1:10], frequency[1:10], rot.per=0, random.order=FALSE)
wordcloud(words[1:30], frequency[1:30], rot.per=0, random.order=FALSE)
par(opar.org)
#
par(opar.org)            # Restore original parameters.
pdf(file = "fig_7_2_wcloud.pdf")
par(mfrow=c(1,3))        # 1 row and 3 columns.
wordcloud(words[1:3], frequency[1:3], rot.per=0, random.order=FALSE)
wordcloud(words[1:10], frequency[1:10], rot.per=0, random.order=FALSE)
wordcloud(words[1:30], frequency[1:30], rot.per=0, random.order=FALSE)
dev.off()
par(opar.org)
#
#####################################################################
# 7.2: Read a folder with pdf files and convert these to txt files in 
#      the same folder.
#
# Set path and verify path to the source folder for PDF files
# The source folder is a subfolder of the current working directory.
# This folder should be created before continuing from here.
#
pdf_sc <- paste(getwd(),"/pdf_source_2",sep="") 
pdf_sc
#
# List all PDF file names in a vector
pdffiles <- list.files(path = pdf_sc, pattern = "pdf",  full.names = TRUE) 
pdffiles
#
#----------------------------------------------------------------
# NOTICE before continuing first time: 
#   Install pdftotext.exe in an appropriate folder, 
#   e.g. "C:/R_misc/pdftotext.exe" as used in this script.
#----------------------------------------------------------------
# Now convert pdf files into txt files.
# lapply(): apply a function over a list or vector.
# pdffiles: Folder with pdffiles and resulting txt files.
#
lapply(pdffiles, function(i) system(paste('"C:/R_misc/pdftotext.exe"', 
                                          paste0('"', i, '"')), wait = FALSE))
#
# read txt files into R
txtfiles <- list.files(path = pdf_sc, pattern = "txt", full.names = TRUE)
txtfiles
str(txtfiles)
head(txtfiles,5)
#################################################################################
