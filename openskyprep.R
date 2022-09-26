listofobs = list()
# introduce timer
counter = 0
f2counter = 0
limit = 9
delay = 1
startxpos=1000
startypos=1000
xspeed=100
yspeed=100
#f2
f2startxpos=1000
f2startypos=1000
f2xspeed=100

xtol=10
ytol=10
xdir=1
ydir=1
shift=limit-2

reslist = list()
while (counter < limit) {
  tmpkeeper = list()
  counter = counter + 1
  f2counter = f2counter + 1
  #f1
  startxpos = startxpos+(xspeed*xdir)
  startypos = startypos+(yspeed*ydir)
  if (counter == shift) {
    xdir=xdir*-1
    ydir=ydir*-1
  }
  #f2
  f2startxpos = f2startxpos+(f2xspeed)
  f2startypos = f2startypos+(f2xspeed)
  
  #print(Sys.time())
  tmplist = list(startxpos,startypos,tjekcoll(startxpos,startypos),"123.321")
  f2tmplist = list(f2startxpos,f2startypos,FALSE,"322.111")
  tmpkeeper = list(tmplist,f2tmplist)
  ts = Sys.time()
  tmpins = list('timestamp'=ts, 'states'= tmpkeeper)
  #tmpins = list('timestamp'=ts, 'states'= tmplist)
  reslist[[counter]]=tmpins
  Sys.sleep(delay)
  #print(counter)
}

tjekcoll <- function(x,y) {
  retval = FALSE
  found = FALSE
  lcounter=1
  lc=length(reslist)
  while (found == FALSE && lcounter <= lc) {
    #print(c(reslist[[lcounter]][[4]], reslist[[lcounter]][[2]] ))
    #print(c(reslist[[lcounter]]['states'][[2]]))
    #tval= as.numeric(paste0(reslist[[lcounter]][['states']][[2]]))
    #print(c("test: ",tval))
    #if (abs(tval - x) < xtol) {
    #  print(c("crossing ..",tval,"-",x,"<",xtol))
    #  found=TRUE
    #  retval=TRUE
    #}
    
    #print(c("LE; ",lc))
    lcounter = lcounter+1
  }
  return(retval)
}


