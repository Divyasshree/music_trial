library(tidyverse)
library(tidytext)
library(httpuv)
library(httr)
library(rtweet)
rt <- search_tweets(
  "shapeofyou", n = 180, include_rts = FALSE
)
tagslist<-rt$hashtags
tags<-unlist(tagslist,TRUE)
tags1<-tagslist[!is.na(tagslist)]
tags2<-unlist(tags1,TRUE)
#View(tags2)
corp<-Corpus(VectorSource(tags2))

library(tm)
stopping<-readLines("stop.txt")
corp1 <- tm_map(corp,removeWords,c(stopwords("english"),stopping))
corp<-unlist(corp)
corp1<-unlist(corp1)
ans<-setdiff(corp,corp1)
