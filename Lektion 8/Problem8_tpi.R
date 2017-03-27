#  Exercise 8.2 
rm(list=ls())
opar.org <- par(no.readonly=TRUE) # Remember original parameters.
loc <-"c:/Users/tpiechowiak/Documents/R/win-library/3.3/"              # Use this folder for packages.
home <- "c:/Users/tpiechowiak/R code/R-code/Lektion 8/"

setwd(home)
#
##########################################################################
#
#install.packages("tm",lib=loc)           # Text mining package.
#install.packages("NLP",lib=loc)          # Natural Language Processing package.
#install.packages("wordcloud",lib=loc)    # Wordcloud package.
#install.packages("RColorBrewer",lib=loc) # Color package.
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

# Create a corpus and clean them 
corpus1 <- Corpus(VectorSource(doc.txt[[1]]))
corpus2 <- Corpus(VectorSource(doc.txt[[2]]))
corpus3 <- Corpus(VectorSource(doc.txt[[3]]))
corpus4 <- Corpus(VectorSource(doc.txt[[4]]))

writeLines(as.character(corpus1))
writeLines(as.character(corpus2))
writeLines(as.character(corpus3))
writeLines(as.character(corpus4))


tmp1 <- tm_map(tm_map(tm_map(tm_map(corpus1, content_transformer(tolower)),removePunctuation), stripWhitespace),removeWords,stopwords("english"))
tmp2 <- tm_map(tm_map(tm_map(tm_map(corpus2, content_transformer(tolower)),removePunctuation),stripWhitespace),removeWords,stopwords("english"))
tmp3 <- tm_map(tm_map(tm_map(tm_map(corpus3, content_transformer(tolower)),removePunctuation),stripWhitespace),removeWords,stopwords("english"))
tmp4 <- tm_map(tm_map(tm_map(tm_map(corpus4, content_transformer(tolower)),removePunctuation),stripWhitespace),removeWords,stopwords("english"))

#
# Frequency
freq <- list(colSums(as.matrix(DocumentTermMatrix(tmp1))),colSums(as.matrix(DocumentTermMatrix(tmp2))),
             colSums(as.matrix(DocumentTermMatrix(tmp3))),colSums(as.matrix(DocumentTermMatrix(tmp4))))

freq.sort <- sapply(freq,sort,decreasing=TRUE)

#obtain the actual words
words <- sapply(freq.sort,names)

#plot the stuff 
pdf("coloplast word frequencies.pdf")
par(mfrow=c(2,2))        # 2 rows and 2 columns.
wordcloud(words[[1]][1:30], freq.sort[[1]][1:30], rot.per=0, random.order=FALSE,main="2011")
wordcloud(words[[2]][1:30], freq.sort[[2]][1:30], rot.per=0, random.order=FALSE,main="2012")
wordcloud(words[[3]][1:30], freq.sort[[3]][1:30], rot.per=0, random.order=FALSE,main="2013")
wordcloud(words[[4]][1:30], freq.sort[[4]][1:30], rot.per=0, random.order=FALSE,main="2014")
dev.off()
par(opar.org)

end.list <- data.frame(freq.sort[[1]][1:50],freq.sort[[2]][1:50],freq.sort[[3]][1:50],freq.sort[[4]][1:50])
end.list["crisis",]        

#not a big difference in word usage across years and reports but slight differences 
#no use of word crisis ;-)
#
#


