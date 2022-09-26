library(httr)
library(jsonlite)
library(dplyr)
library(ggplot2)

apinewskey="d02cbfbac75e4967ac4c66a1d2ff3085"
qparam = "airlines AND emergency"
qparam = "EXS45UN"
ndate="2022-09-20"
url=paste0("https://newsapi.org/v2/everything?q=",qparam,"&from=",ndate,"&language=en&sortBy=publishedAt&apiKey=",apinewskey)
res=httr::GET(url)
dfnews <- res %>%  
  httr::content(as = "text") %>% 
  jsonlite::fromJSON()

dfcontent=dfnews$articles
