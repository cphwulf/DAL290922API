library(httr)
library(jsonlite)
library(dplyr)
library(ggplot2)

un="thorwulf"
pw="d5pljrtr!"

#6.453577,54.551898,15.572230,57.843784
#dkq="https://opensky-network.org/api/states/all?lamin=45.8389&lomin=5.9962&lamax=47.8229&lomax=10.5226"


lomin=6.453577
lomax=15.572230
lamin=54.551898
lamax=57.843784
baseurl = "https://opensky-network.org/api/states/all?"
querystr=paste0("lamin=",lamin,"&lomin=",lomin,"&lamax=",lamax,"&lomax=",lomax)
totalurl=paste0(baseurl,querystr)

res = httr::GET(totalurl,authenticate(un,pw))
resraw = httr::content(res,as="text")
dfres = jsonlite::fromJSON(resraw)
