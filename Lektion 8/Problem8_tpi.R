#

opar.org <- par(no.readonly=TRUE) # Remember original parameters.
loc <- 'c:/Users/tobiasp/Documents/Big Data/R_packages/'              # Use this folder for packages.
home <- 'c:/Users/tobiasp/Documents/Big Data/R-code/Lektion 8/'

setwd(home)
#
##########################################################################
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

################################################################################
#read all the coloplast reports
doc1 <- read.csv("Coloplast_Annual report 2011-12.csv", colClasses="character", stringsAsFactors=FALSE)
doc2 <- read.csv("Coloplast_Annual report 2012-13.csv", colClasses="character", stringsAsFactors=FALSE)
doc3 <- read.csv("Coloplast_Annual report 2013-14.csv", colClasses="character", stringsAsFactors=FALSE)
doc4 <- read.csv("Coloplast_Annual report 2014-15.csv", colClasses="character", stringsAsFactors=FALSE)

-------------------------------------------------------------------------
doc.txt <- sapply(list(doc1,doc2,doc3,doc4),
                  paste,sep="") #create list over all docs

#doc1.txt <- paste(doc1, collapse=" ")
#doc2.txt <- paste(doc2, collapse=" ")
#doc3.txt <- paste(doc3, collapse=" ")
#doc4.txt <- paste(doc4, collapse=" ")

#
# Create a corpus with one document.
#
doc.source <- sapply(doc.txt,VectorSource)
doc.corpus <- sapply(doc.source,Corpus)

#
# Cleaning the corpus(es)

doc1.corpus <- tm_map(doc1.corpus, content_transformer(tolower))
doc2.corpus <- tm_map(doc2.corpus, content_transformer(tolower))
doc3.corpus <- tm_map(doc3.corpus, content_transformer(tolower))
doc4.corpus <- tm_map(doc4.corpus, content_transformer(tolower))

doc1.corpus <- tm_map(doc1.corpus, removePunctuation)
doc2.corpus <- tm_map(doc2.corpus, removePunctuation)
doc3.corpus <- tm_map(doc3.corpus, removePunctuation)
doc4.corpus <- tm_map(doc4.corpus, removePunctuation)

corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

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
