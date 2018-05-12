#ab -n 1000 -g ab_patched.txt http://192.168.33.100/
#ab -n 1000 -g ab_vulnerable.txt http://192.168.33.101/

#require("ggplot2")


#patched
ab_patched.txt <- read.table("~/Desktop/R/ab_patched.txt", header = TRUE, sep = "\t")
myvarspatched <- "ttime"
newdatapatched <- ab_patched.txt[myvarspatched]

ms_patched <- newdatapatched[,]
plot(ms_patched,  type='l', col='red', main ='Response time patched', xlab='request', ylab='ms')

#vulnerable
ab_vulnerable.txt <- read.table("~/Desktop/R/ab_vulnerable.txt", header = TRUE, sep = "\t")
myvarsvulnerable <- "ttime"
newdatavulnerable <- ab_vulnerable.txt[myvarsvulnerable]

ms_vulnerable <- newdatavulnerable[,]
plot(ms_vulnerable, type='l', col='red', main ='Response time vulnerable', xlab='request', ylab='ms')


#patched + vulnerable
plot(ms_vulnerable, type='l', col='red', main ='Response time', xlab='request', ylab='ms')
lines(ms_patched, type="l", col="blue")

legend(200, 24,  # Plot legend
       c("vulnerable", "patched"),
       col = c("red", "blue"),
       lty = 1,
       lwd = 2)

sd(ms_patched)
sd(ms_vulnerable)

t.test(ms_patched, ms_vulnerable)

