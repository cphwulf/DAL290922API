listofobs = list()
# introduce timer
counter = 0
limit = 9
delay = 1
startxpos=1000
startypos=1000
xspeed=100
yspeed=100
xtol=10
ytol=10
xdir=1
ydir=1
shift=limit-2

reslist = list()
while (counter < limit) {
  counter = counter + 1
  startxpos = startxpos+(xspeed*xdir)
  startypos = startypos+(yspeed*ydir)
  if (counter == shift) {
    xdir=xdir*-1
    ydir=ydir*-1
  }
  
  #print(Sys.time())
  tmplist = list(startxpos,startypos,tjekcoll(startxpos,startypos),"123.321")
  ts = Sys.time()
  tmpins = list('timestamp'=ts, 'states'= tmplist)
  reslist[[counter]]=tmpins
  tjekcoll(startxpos,startypos)
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
    tval= as.numeric(paste0(reslist[[lcounter]][['states']][[2]]))
    print(c("test: ",tval))
    if (abs(tval - x) < xtol) {
      print(c("crossing ..",tval,"-",x,"<",xtol))
      found=TRUE
      retval=TRUE
    }
    
    #print(c("LE; ",lc))
    lcounter = lcounter+1
  }
  return(retval)
}


