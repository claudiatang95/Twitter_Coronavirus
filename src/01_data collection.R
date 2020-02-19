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

data0204_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-04", until="2020-02-05",n=30000,retryonratelimit = TRUE)
save(data0204_coro,file="data/data0204_coro.Rdata")

data0206_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-06", until="2020-02-07",n=30000,retryonratelimit = TRUE)
save(data0206_coro,file="data/data0206_coro.Rdata")

data0208_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-08", until="2020-02-09",n=30000,retryonratelimit = TRUE)
save(data0208_coro,file="data/data0208_coro.Rdata")

data0210_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-10", until="2020-02-11",n=30000,retryonratelimit = TRUE)
save(data0210_coro,file="data/data0210_coro.Rdata")

data0212_coro <- search_tweets(q = "#coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-12", until="2020-02-13",n=30000,retryonratelimit = TRUE)
save(data0212_coro,file="data/data0212_coro.Rdata")
