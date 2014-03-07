###Accediendo a los Trending Topics de Twitter
library(twitteR)
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "http://api.twitter.com/oauth/authorize"
consumerKey <- "h4uQdaETG3oTNHHV1qQ"
consumerSecret <- "hMDaoOgKmXZCvRx19y7mANoMwVovKzGmLONFnFKCkBI"
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL)
twitCred$handshake()
registerTwitterOAuth(twitCred)
setwd("/home/david/itam-temas-selectos/proyectos/enchulame_zeitgeits/")
save(list="twitCred", file="twitteR_credentials")

###Con las credenciales precargadas
setwd("/home/david/itam-temas-selectos/proyectos/enchulame_zeitgeits/")
load("twitteR_credentials")
library(twitteR)
registerTwitterOAuth(twitCred)

###Obtiene los 10 trending Topics de México (woeid=23424900)
trend <- getTrends(23424900)
tt <- trend$name
mich <- searchTwitter("Michoacan", 100)
telcel <- searchTwitter("telcel",100)

###Accediendo a los Trends de Google
#library(devtools)
#install_bitbucket("GTrendsR", "persican")
library(GTrendsR)
help(GTrendsR)
usr = "temas.selectos.itam@gmail.com"
psw = "zeitgeist"
ch = gConnect(usr, psw)
data(countries)
location = "MX"
query = "templarios"
data = gTrends(ch, geo = location, query = query)
serie <- data[[1]]
ts(serie)
plot(ts(serie))
busquedas <- data.frame(data[[1]])
renglones <- 1:nrow(busquedas)
menciones <- cbind(renglones,busquedas)
library(ggplot2)
ggplot(menciones,aes(x=renglones,mario.bautista)) + geom_point()

#gTrendsMap(data)