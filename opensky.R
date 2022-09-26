library(httr)
library(stringr)
library(jsonlite)
library(dplyr)
library(ggplot2)

un="thorwulf"
pw="d5pljrtr!"

#6.453577,54.551898,15.572230,57.843784
#dkq="https://opensky-network.org/api/states/all?lamin=45.8389&lomin=5.9962&lamax=47.8229&lomax=10.5226"

#DK box
lomin=6.453577
lomax=15.572230
lamin=54.551898
lamax=57.843784

# PR Box
#-123.132580,37.870829,-122.581077,38.255746
lomin=-123.132580
lomax=-122.581077
lamin=37.870829
lamax=38.255746

baseurl = "https://opensky-network.org/api/states/all"
querystr=paste0("lamin=",lamin,"&lomin=",lomin,"&lamax=",lamax,"&lomax=",lomax)
querystrpr=paste0("lamin=",lamin,"&lomin=",lomin,"&lamax=",lamax,"&lomax=",lomax)
totalurl=paste0(baseurl,"?",querystr)
totalurl=paste0(baseurl,"?",querystrpr)

nres = httr::GET(totalurl,authenticate(un,pw))
prres = httr::GET(totalurl,authenticate(un,pw))
allres = httr::GET(baseurl,authenticate(un,pw))

nresraw = httr::content(res,as="text")
allresraw = httr::content(allres,as="text")
prraw = httr::content(prres,as="text")

prjson = jsonlite::fromJSON(prraw)
ndfres = jsonlite::fromJSON(resraw)
alldfres = jsonlite::fromJSON(allresraw)
dfres = as.data.frame(ndfres$states)
dfpr = as.data.frame(prjson$states)

allflightdfres = as.data.frame(alldfres$states)
str_count(allflightdfres$V2,"SAS")

skylist = list(resraw,nresraw)
# now introduce loop

