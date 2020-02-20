library(rio)
library(quanteda)
library(quanteda.dictionaries)
library(tidyverse)
library(wordcloud2)
# Load the sample data to do the sentiment analysis and text analysis
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

# Use NRC dictionary to analyse emotions----  
dfm_NRC<- dfm(tokens,ngrams = 1, 
              dictionary = data_dictionary_NRC) 

emotions <- as_tibble(dfm_NRC) %>% summarise(anger=sum(anger),disgust=sum(disgust),
                                             fear=sum(fear),sadness=sum(sadness),
                                             anticipation=sum(anticipation),joy=sum(joy),
                                             surprise=sum(surprise),trust=sum(trust),
                                             negative=sum(negative),positive=sum(positive))
emotion_plot <- gather(emotions,key="emotions",value="words_count",anger:positive)
ggplot(emotion_plot[1:8,])+geom_bar(aes(x=emotions,y=words_count,fill=emotions),stat="identity")+
  ggtitle("Emotions analysis based on words count")


# Text analysis----
# To analyze the most frequent words
dfm <- dfm(tokens) %>% dfm_select(min_nchar = 2) %>% dfm_trim(min_termfreq = 10)
freq_words <- textstat_frequency(dfm,n=50)
# visulization
ggplot(freq_words,aes(x=reorder(feature,frequency),y=frequency))+geom_point()+coord_flip()+
  labs(x = NULL, y = "Frequency")
wordcloud2(freq_words,size=0.5)

# To analyze the most frequent hashtags
dfm_hashtag <- dfm(corpus,select="#*") %>% dfm_select(min_nchar = 2)
freq_hashtag <- textstat_frequency(dfm_hashtag,n=50)
set.seed(132)
textplot_wordcloud(dfm_hashtag,max_words = 50)
# visulization
ggplot(freq_hashtag,aes(x=reorder(feature,-frequency),y=frequency))+
  geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1))
wordcloud2(freq_hashtag ,size=6)

# To analyze the most frequently mentioned accounts 
user_dfm <- dfm(corpus,select="@*")%>% dfm_select(min_nchar = 2)
fre_user <- textstat_frequency(user_dfm,n=20)
# visulization
ggplot(fre_user,aes(x=reorder(feature,frequency),y=frequency))+
  geom_point()+coord_flip()










