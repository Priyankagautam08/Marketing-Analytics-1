# Use Existing Twitter Authentication Stored
# Marketing Analytics


library("twitteR")
library("ROAuth")

# Certificate not Required
#load("twitter authentication.Rdata")

AccessToken="843344776254709760-KKgUU8K1lccB36jZfUulr2Qz6UBArDm"
AccessTokenSecret="xMjL6GYVEPNHX2thopBasAssEax53rhlfu7xHiiH2wrAv"
ConsumerKey="5TKBUGr2TCe6cjaTztFlW3u5k"
ConsumerSecret="tbnchgAFFU0DlyTDrhbzJ2ZO4DJapjtIqtrhkCZq4SLPb7ZdAq"

load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(ConsumerKey, ConsumerSecret, AccessToken, AccessTokenSecret)

search.string <- "#marketinganalytics"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets


homeTimeline(n=15)  #my tweets
mentions(n=15)   # my tags
