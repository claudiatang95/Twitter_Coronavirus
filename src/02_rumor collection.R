library(rtweet)
library(tidyverse)
# rumor tweets collection 1: falsenumber----
falsenumber1<- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                       include_rts = FALSE,since="2020-01-25", until="2020-01-29",n=5000)
save(falsenumber1,file="data/falsenumber1.Rdata")
falsenumber2<- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                       include_rts = FALSE,since="2020-01-29", until="2020-02-03",n=5000)
save(falsenumber2,file="data/falsenumber2.Rdata")
falsenumber3 <- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                             include_rts = FALSE,since="2020-02-03",until="2020-02-08",n=5000)
save(falsenumber3,file="data/falsenumber3.Rdata")

falsenumber0213 <- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                                 include_rts = FALSE,since="2020-02-08",until="2020-02-14",n=5000)
save(falsenumber0213,file="data/falsenumber0213.Rdata")

# combing 4 datasets
falsenumber1 <- import(here::here("data","falsenumber1.Rdata"))
falsenumber2 <- import(here::here("data","falsenumber2.Rdata"))
falsenumber3 <- import(here::here("data","falsenumber3.Rdata"))
falsenumber4 <- import(here::here("data","falsenumber0213.Rdata"))
falsenumber <- rbind(falsenumber1,falsenumber2,falsenumber3,falsenumber4)
falsenumber <- arragne(falsenumber,created_at)
save(falsenumber,file="data/falsenumber.Rdata")




# rumor tweets collection 2: biowarfare and bioweapon---- 
# keyword:biowarfare
test7 <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                       include_rts = FALSE,since="2020-01-25", until="2020-01-29",n=5000)
save(test7,file="data/biowarfare rumor1.Rdata")
biowarfare <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                            include_rts = FALSE,since="2020-01-29", until="2020-02-03",n=5000)
save(biowarfare,file="data/biowarfare_0202.Rdata")
biowarfare0207 <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                                include_rts = FALSE,since="2020-02-03", until="2020-02-08",n=5000)
save(biowarfare0207,file="data/biowarfare_0207.Rdata")
biowarfare0213 <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                                include_rts = FALSE,since="2020-02-08", until="2020-02-14",n=5000)
save(biowarfare0213,file="data/biowarfare0213.Rdata")

# combining 4 datasets
biowarfare1 <- import(here::here("data","biowarfare rumor1.Rdata"))
biowarfare2 <- import(here::here("data","biowarfare_0202.Rdata"))
biowarfare3 <- import(here::here("data","biowarfare_0207.Rdata"))
biowarfare4 <- import(here::here("data","biowarfare0213.Rdata"))
biowarfare <- rbind(biowarfare1,biowarfare2,biowarfare3,biowarfare4)
biowarfare <- arrange(biowarfare,created_at)


# keyword: bio weapon
test <- search_tweets(q = "bio weapon AND coronavirus", lang="en", 
                      include_rts = FALSE,since="2020-01-25", until="2020-01-29",n=5000)
save(test,file="data/bioweapon.Rdata")
bioweapon <- search_tweets(q = "bio weapon AND coronavirus", lang="en", 
                           include_rts = FALSE,since="2020-01-29", until="2020-02-03",n=5000)
save(bioweapon,file="data/bioweapon_0202.Rdata")
bioweapon_0207 <- search_tweets(q = "bio weapon AND coronavirus", lang="en", 
                                include_rts = FALSE,since="2020-02-03", until="2020-02-08",n=5000)
save(bioweapon_0207,file="data/bioweapon_0207.Rdata")
bioweapon_0213 <-search_tweets(q = "bio weapon AND coronavirus", lang="en", 
                               include_rts = FALSE,since="2020-02-08", until="2020-02-14",n=5000) 
save(bioweapon_0213,file="data/bioweapon_0213.Rdata")

# combining 4 datasets
bioweapon1 <- import(here::here("data","bioweapon.Rdata"))
bioweapon2 <- import(here::here("data","bioweapon_0202.Rdata"))
bioweapon3 <- import(here::here("data","bioweapon_0207.Rdata"))
bioweapon4 <- import(here::here("data","bioweapon_0213.Rdata"))
bioweapon <- rbind(bioweapon1,bioweapon2,bioweapon3,bioweapon4)
bioweapon <- arrange(bioweapon, created_at)

# combing biowarfare and bioweapon datasets and remove duplicates
biowarfare_rumor <- rbind(biowarfare,bioweapon)
biowarfare_rumor <- unique(biowarfare_rumor)
save(biowarfare_rumor,file="data/biowarfare_rumor.Rdata")








