library(rtweet)
library(tidyverse)
# rumor tweets collection 1: falsenumber----
falsenumber1<- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                       include_rts = FALSE,since="2020-01-25", until="2020-01-29",n=5000)
falsenumber2<- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                       include_rts = FALSE,since="2020-01-29", until="2020-02-03",n=5000)
falsenumber3 <- search_tweets(q = '"90,000 infected" OR "90,000 people" OR "90,000 sick" OR "90,000 cases"', lang="en", 
                             include_rts = FALSE,since="2020-02-03",until="2020-02-08",n=5000)
rumor_falsenumber <- rbind(falsenumber1,falsenumber2,falsenumber3)
rumor_falsenumber <- arrange(rumor_falsenumber,created_at)
save(rumor_falsenumber,file="data/falsenumber_0207.Rdata")

# rumor tweets collection 2: biowarfare and bioweapon---- 
# keyword:biowarfare
test7 <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                       include_rts = FALSE,since="2020-01-25", until="2020-01-29",n=5000)
save(test7,file="data/biowarfare rumor.Rdata")
biowarfare <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                            include_rts = FALSE,since="2020-01-29", until="2020-02-03",n=5000)
save(biowarfare,file="data/biowarfare_0202.Rdata")
biowarfare0207 <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                                include_rts = FALSE,since="2020-02-03", until="2020-02-08",n=5000)
biowarfare_rumor <- rbind(test7,biowarfare,biowarfare0207)
biowarfare_rumor <- arrange(biowarfare_rumor,created_at)
save(biowarfare_rumor,file="data/biowarfare_rumor.Rdata")

# keyword: bio weapon
test <- search_tweets(q = "bio weapon AND coronavirus", lang="en", 
                      include_rts = FALSE,since="2020-01-25", until="2020-01-29",n=5000)
save(test,file="data/bioweapon.Rdata")
bioweapon <- search_tweets(q = "bio weapon AND coronavirus", lang="en", 
                           include_rts = FALSE,since="2020-01-29", until="2020-02-03",n=5000)
save(bioweapon,file="data/bioweapon_0202.Rdata")
bioweapon_0207 <- search_tweets(q = "biowarfare AND coronavirus", lang="en", 
                                include_rts = FALSE,since="2020-02-03", until="2020-02-08",n=5000)
bioweapon_rumor <- rbind(test,bioweapon,bioweapon_0207)
bioweapon_rumor <- arrange(bioweapon_rumor,created_at)
save(bioweapon_rumor,file="data/bioweapon_rumor.Rdata")





