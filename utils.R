library(SnowballC)
library(tm)

createPartition <- function (filename, trainPortion=0.6, holdOutPortion=0.2) {
  con <- file(filename)
  total <- length(readLines(con))
  
  sample <- floor(total * trainPortion)
  sample_holdout <- floor(total * holdOutPortion)
  
  corpus <- scan(con, what="character", skip= 0, nlines=total, sep="\n", fileEncoding = 'UTF-8')
  close(con)
  train <- corpus[1:sample]
  holdout <- corpus[(sample + 1): (sample + sample_holdout)]
  test <- corpus[(sample + sample_holdout + 1) : total]
  
  result <- list(train=train, holdout=holdout, test=test)
  return(result)
}


decode <- function(text) {
  t1 <- iconv(text, from = "UTF-8", to = "ASCII")
  t1 <- gsub("[^0-9A-Za-z///' ]", "", t1)
  return(t1)
}

clean <- function(docs) {
  docs <- removeNumbers(docs)
  docs <- removePunctuation(docs)
  docs <- stripWhitespace(docs)
  docs <- stemDocument(docs)
  
  return(docs)
}