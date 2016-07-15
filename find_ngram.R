library(tau)

download.file('https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip')
unzip('Coursera-SwiftKey.zip')

blogs <- createPartition("/Users/ara/dev/personal/r/final/en_US/en_US.blogs.txt")
news <- createPartition("/Users/ara/dev/personal/r/final/en_US/en_US.news.txt")
twitter <- createPartition("/Users/ara/dev/personal/r/final/en_US/en_US.twitter.txt")

data <- list()
data$train <- decode(clean(paste(blogs$train, news$train, twitter$train)))
data$holdout <- decode(clean(paste(blogs$holdout, news$holdout, twitter$holdout)))
data$test <- decode(clean(paste(blogs$test, news$test, twitter$test)))

save(data, file="SwiftKeyCleanData.RData")

rm(blogs)
rm(news)
rm(twitter)

load("SwiftKeyCleanData.RData")
engram_tau <- textcnt(data$train, n = 1L, method = "string", recursive = TRUE, lower = 19L, tolower=TRUE)
engram <- data.frame(counts = unclass(engram_tau))
rm(engram_tau)
save(engram, file="SwiftKeyEngram.RData")
rm(engram)
gc()

bigram_tau <- textcnt(data$train, n = 2L, method = "string", recursive = TRUE, lower = 29L, tolower=TRUE)
bigram <- data.frame(counts = unclass(bigram_tau))
rm(bigram_tau)
save(bigram, file="SwiftKeyBigram.RData")
rm(bigram)
gc()

trigram_tau <- textcnt(data$train, n = 3L, method = "string", recursive = TRUE, lower = 39L, tolower=TRUE)
trigram <- data.frame(counts = unclass(trigram_tau))
rm(trigram_tau)
save(trigram, file="SwiftKeyTrigram.RData")
rm(trigram)
gc()
