load("SwiftKeyEngram.RData") 
load("SwiftKeyBigram.RData")
load("SwiftKeyTrigram.RData")

stupid_backoff <- function (sentence, k=3) {
  token <- strsplit(sentence, split=" ")[[1]]
  val <- paste(token[(length(token) - k + 1): (length(token))], collapse= " ")
  enumerator <- trigram[val,]
  
  if (!is.na(enumerator) && enumerator > 0) {
    denominator <- bigram[paste(token[(length(token) - k + 2): (length(token))], collapse= " "),]
    res <- enumerator / denominator
  }
  else {
    res <- 0.4 * stupid_backoff_bigram(sentence, original_sentence = val) 
  }
  
  return(list(name=val, count = res))
}

stupid_backoff_bigram <- function (sentence, k=3, original_sentence="") {
  token <- strsplit(sentence, split=" ")[[1]]
  val <- paste(token[(length(token) - k): (length(token)- k + 2) ], collapse= " ")
  enumerator <- bigram[val,]
  en_val <- token[length(token) - k + 1]
  denominator <- engram[en_val,]
  check <- !is.na(enumerator) && enumerator > 0
  
  if (check) {
    res <- enumerator / denominator
  }
  else {
    denominator <- ifelse(is.na(denominator), 0, denominator)
    res <- 0.4 * denominator / train_length
  }
  
  return(res)
}

predict <- function (seq) {
  indices <- grep(paste('^', seq, ' ', sep=''), rownames(trigram), perl=TRUE)
  result <- lapply(rownames(trigram)[indices], stupid_backoff)
  df <- data.frame(t(sapply(result,c)))  
  prediction <- df[which.max(df$count),]
  result <- unlist(prediction$name)
  token <- strsplit(result, split=' ')[[1]]
  predictionValue <- token[length(token)]
  
  return(list(value=predictionValue, score= prediction$count))
}