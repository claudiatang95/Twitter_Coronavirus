library(rio)
library(quanteda)
library(quanteda.dictionaries)
library(tidyverse)
# Load the sample data to do the sentiment analysis
sample <- import(here::here("data","sample.Rdata"))
corpus <- corpus(sample)
tokens <- tokens(corpus,
                 what = 'word',
                 remove_punct = TRUE,
                 remove_url = TRUE,
                 remove_separators = TRUE,
                 remove_numbers=T
) %>%
  tokens_select(c("#*","@*","amp"),selection="remove") %>%
  tokens_remove(stopwords("english"))

# Use NRC dictionary to analyse emotions  
dfm_NRC<- dfm(tokens,ngrams = 1, 
              dictionary = data_dictionary_NRC) 
emotions <- as_tibble(dfm_NRC) %>% summarise(anger=mean(anger),disgust=mean(disgust),
                                             fear=mean(fear),sadness=mean(sadness),
                                             anticipation=mean(anticipation),joy=mean(joy),
                                             surprise=mean(surprise),trust=mean(trust),
                                             negative=mean(negative),positive=mean(positive))
emotions <- as_tibble(dfm_NRC) %>% summarise(anger=sum(anger),disgust=sum(disgust),
                                             fear=sum(fear),sadness=sum(sadness),
                                             anticipation=sum(anticipation),joy=sum(joy),
                                             surprise=sum(surprise),trust=sum(trust),
                                             negative=sum(negative),positive=sum(positive))
emotion_plot <- gather(emotions,key="emotions",value="words_count",anger:positive)
ggplot(emotion_plot[1:8,])+geom_bar(aes(x=emotions,y=words_count,fill=emotions),stat="identity")+
  ggtitle("Emotions analysis based on words count")








