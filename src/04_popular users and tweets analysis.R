library(rio)
library(tidyverse)
library(stringr)

data_coronavirus<- import(here::here("data","data_coronavirus.Rdata"))
# Add a new variable "twitter engagement", the sum of favorite counts and retweet counts
data_coronavirus<- data_coronavirus %>% mutate(twitter_engagement=favorite_count+retweet_count) %>% 
  arrange(desc(twitter_engagement))


# Analyze which twitter users get more favorite and retweet counts and extract the top 100 users----
by_user <- data_coronavirus %>% group_by(screen_name) %>% 
  summarise(count=n(),average_favorite=mean(favorite_count),
            average_retweet=mean(retweet_count),
            average_engagement=mean(twitter_engagement),
            followers=max(followers_count),
            verified=isTRUE(verified))%>% 
            arrange(desc(average_engagement)) %>% ungroup()
topusers <- by_user[1:100,] 

# How many users among top 100 are verified
sum(topusers$verified)
# The average followers and twitter engagement of unverified and verified users among top 100 users
topuser_mean <- topusers %>% group_by(verified) %>% summarise(mean(followers),average_engagement=mean(average_engagement)) %>% ungroup()

# To analyze if there is association between number of followers and popularity of tweets(i.e twitter engagement value)
ggplot(topusers, aes(y = average_engagement, x = followers,color=verified))+geom_point()+scale_x_log10()
##Use regression model
m.v <- lm(average_engagement~followers,data=topusers)  
summary(m.v)
# Use ANOVA to see if there is difference between unverified users' twitter engagement and verfied users' twitter engagement
anova <- aov(average_engagement~verified,data=topusers)
summary(anova)


# Analyze top 1000 tweets that have larger twitter engagement count----
toptweets <- data_coronavirus[1:1000,]
save(toptweets,file="data/toptweets.Rdata")

# To see how many users are verified users
sum(toptweets$verified)
# Summary statistics of twitter engagement of unverified and verified users
toptweets_unverified <- toptweets %>% filter(verified=="FALSE")
summary(toptweets_unverified$twitter_engagement)
toptweets_verified <- toptweets %>% filter(verified=="TRUE") 
summary(toptweets_verified$twitter_engagement)

# Scatter plot of twitter engagement of unverified and verified users
ggplot(toptweets, aes(y = twitter_engagement, x = verified,size=followers_count))+geom_point()+
  ggtitle("Twitter engagement of unverified and verified users") 

# The average followers and twitter engagement of unverified and verified users 
toptweets_mean <- toptweets %>% group_by(verified) %>% summarise(mean(followers_count),mean(twitter_engagement)) %>% ungroup()

# Test again if there is association between the number of followers and popularity among top 1000 tweets
m.v2 <- lm(twitter_engagement~followers_count,data=toptweets)  
summary(m.v2)





