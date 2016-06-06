multiline <- TRUE
library(oce)
mscData <- "
month,action
1,form Advisory Committe ; submit Graduate Student Program Form
6,meet with Advisory Committee
12.5,meet with Advisory Committee ; submit (and possibly defend) Thesis Proposal ; submit Annual Progress Report
18,meet with Advisory Committee
22,pre-defence tasks (nominal time)
24,defend Thesis (nominal time)
36,mandatory program end
"

msc <- read.csv(text=mscData, header=TRUE)
msc

year <- 2016                           # Won't matter
mon <- 9                               # Sept term
day <- 5                               # A guess; won't matter

start <- ISOdatetime(year=year, month=9, day=5, hour=0, min=0, sec=0, tz="UTC")
t <- start + msc$month*28*86400
t
n <- length(msc$action)

if (!interactive()) pdf("timeline_msc_sept.pdf", width=4)
par(mar=c(1, 2.5, 1, 1))
plot(c(0,1), range(t), xlab="", ylab="", type="n", axes=FALSE)
box()
oce.axis.POSIXct(2, drawTimeRange=FALSE, tformat="%b")
#axis(2)
abline(h=start+(1:3)*365*86400, lty='dotted', col='gray')
if (multiline) {
    text(rep(0, n), t, sprintf("Month %d: %s", msc$month, gsub(";","\n",msc$action)), adj=0, cex=3/4)
} else {
    text(rep(0, n), t, sprintf("Month %d: %s", msc$month, msc$action), adj=0, cex=3/4)
}
mtext("MSc program starting in September", line=0, adj=1)
if (!interactive()) dev.off()

