library(httr)
library(stringr)
library(jsonlite)
library(dplyr)
library(ggplot2)

un="thorwulf"
pw="d5pljrtr!"

# PR Box
lomin=-123.132580
lomax=-122.581077
lamin=37.870829
lamax=38.255746

baseurl = "https://opensky-network.org/api/states/all"
querystrpr=paste0("lamin=",lamin,"&lomin=",lomin,"&lamax=",lamax,"&lomax=",lomax)
totalurl=paste0(baseurl,"?",querystrpr)

prres = httr::GET(totalurl,authenticate(un,pw))
prraw = httr::content(prres,as="text")
prjson = jsonlite::fromJSON(prraw)
dfpr = as.data.frame(prjson$states)

### now introduce while-loop
# sleep for x seconds
sleeptime = 1
# retrieve data and add timestamp and data to list
listofprflights=list()

while (TRUE) {
  ts = format(Sys.time(),"%m-%d-%Y %H:%M:%S")
  prres = httr::GET(totalurl,authenticate(un,pw))
  prraw = httr::content(prres,as="text")
  prjson = jsonlite::fromJSON(prraw)
  dfpr = list(prjson$states)
  #dfpr = append(dfpr,ts)
  #dfpr = list(prjson$states)
  listofprflights = append(listofprflights,dfpr)
  Sys.sleep(5)
}
totaldf = unlist(lapply(listofprflights,function(x) as.data.frame(x[[1]])))
totaldf = as.data.frame(unlist(lapply(listofprflights,function(x) length(x)/17)))
dfall=do.call(rbind,listofprflights)
dfall = as.data.frame(dfall)


# plot
#ggplot(dfp1,aes(x=dfp1$time,y=dfp1$values,group=geo,color=geo))+
#geom_line() + labs(x="year",y="gas price euro/kwh", title="Gas prices in Europe")

#dfall$ydate=lapply(dfall$V4, function(x) as.POSIXct(as.numeric(x), origin="1970-01-01"))
###
for (i in (1:length(dfall$V4))) {
  dfall[i,'xdate']=as.POSIXct(as.numeric(dfall[i,'V4']), origin="1970-01-01")
  print(as.POSIXct(as.numeric(dfall[i,'V4']), origin="1970-01-01"))
}


###
tbl <- with(dfall, table(dfall$xdate))
ggplot(dfall,aes('factor(V4)',fill='factor(V4)'))+
  geom_bar()
