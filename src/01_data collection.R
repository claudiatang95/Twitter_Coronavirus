library(rtweet)
library(tidyverse)
data0125_coro <- search_tweets(q = "#coronavirus", lang="en", 
                            include_rts = FALSE,since="2020-01-25", until="2020-01-26",n=20000)
save(data0125_coro,file="data/data0125_coro.Rdata")

data0127_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-01-27", until="2020-01-28",n=20000,retryonratelimit = TRUE)
save(data0127_coro,file="data/data0127_coro.Rdata")

data0129_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-01-29", until="2020-01-30",n=30000,retryonratelimit = TRUE)
save(data0129_coro,file="data/data0129_coro.Rdata")

data0131_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-01-31", until="2020-02-01",n=30000,retryonratelimit = TRUE)
save(data0131_coro,file="data/data0131_coro.Rdata")

data0202_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-02", until="2020-02-03",n=30000,retryonratelimit = TRUE)
save(data0202_coro,file="data/data0202_coro.Rdata")