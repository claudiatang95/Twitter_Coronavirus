library(rio)
library(tidyverse)
# First dataset, tweets posted from Jan 25 to Feb 2
data0125 <- import(here::here("data","data0125_coro.Rdata"))
data0127 <- import(here::here("data","data0127_coro.Rdata"))
data0129 <- import(here::here("data","data0129_coro.Rdata"))
data0131 <- import(here::here("data","data0131_coro.Rdata"))
data0202 <- import(here::here("data","data0202_coro.Rdata"))
data_0125_0202 <- rbind(data0125,data0127,data0129,data0131,data0202)
save(data_0125_0202,file="data/data_0125_0202.Rdata")

# Second dataset, tweets posted from Feb 4 to Feb 12
data0204 <- import(here::here("data","data0204_coro.Rdata"))
data0206 <- import(here::here("data","data0206_coro.Rdata"))
data0208 <- import(here::here("data","data0208_coro.Rdata"))
data0210 <- import(here::here("data","data0210_coro.Rdata"))
data0212 <- import(here::here("data","data0212_coro.Rdata"))
data_0204_0212 <- rbind(data0204,data0206,data0208,data0210,data0212)
data_0204_0212 <- arrange(data_0204_0212,created_at)
save(data_0204_0212,file="data/data_0204_0212.Rdata")

# The complete dataset,tweets posted from Jan 25 to Feb 12
data_0125_0202 <- import(here::here("data","data_0125_0202.Rdata"))
data_0204_0212 <- import(here::here("data","data_0204_0212.Rdata"))
data_coronavirus <- rbind(data_0125_0202,data_0204_0212)
save(data_coronavirus,file="data/data_coronavirus.Rdata")

# Draw the sample (10% of the total tweets) from the complete dataset
sample <- sample_frac(data_coronavirus,0.1)
sample <- arrange(sample,created_at)
save(sample,file="data/sample.Rdata")

