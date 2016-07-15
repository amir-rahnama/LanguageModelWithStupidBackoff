### Language Modelling With Stupid Backoff in R
In this project, we are building a language model using the [Stupid Backoff Model](http://www.aclweb.org/anthology/D07-1090.pdf)

####Demo

####scripts
Here are the list of script in this project with their description:

####find_ngrams.R
This script downloads the data file and create a ```data``` object to be used later for creating 1-3 grams. We are using the ```tau``` package to handle ngram creation. It's written in C and it's approximately fast.

####backoff.R
This script calculates backoff score of 1-3 grams using Stupid Backoff Model

###server.R
Shiny app's server code

###ui.R
Shiny app's UI code

###utils.R
Utility script for creating partitions, cleaning up text from numbers and punctuations and etc.

###SwiftKeyEngram.RData
Data frame inlcuding engrams and their count to be used by backoff.R

###SwiftKeyBigram.RData
Data frame inlcuding bigrams and their count to be used by backoff.R

###SwiftKeyTrigram.RData
Data frame inlcuding trigrams and their count to be used by backoff.R


