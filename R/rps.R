#autobench --single_host --host1 192.168.33.100 --quiet               --low_rate 20 --high_rate 240 --rate_step 2 --num_call 1           --num_conn 50 --timeout 5 --file autobench_patched.tsv
#autobench --single_host --host1 192.168.33.101 --quiet               --low_rate 20 --high_rate 240 --rate_step 2 --num_call 1           --num_conn 50 --timeout 5 --file autobench_vulnerable.tsv

#require("ggplot2")

#patched
resultspatched.tsv <- read.table("~/Desktop/R/autobench_patched.tsv", header = TRUE, sep = "\t")
resultsvulnerable.tsv <- read.table("~/Desktop/R/autobench_vulnerable.tsv", header = TRUE, sep = "\t")

myvarspatched <- c("dem_req_rate", "req_rate_192.168.33.100")
myvarsvulnerable <- c("dem_req_rate", "req_rate_192.168.33.101")

newdatapatched <- resultspatched.tsv[myvarspatched]
newdatavulnerable <- resultsvulnerable.tsv[myvarsvulnerable]

rpspatched <- newdatapatched[,]
rpsvulnerable <- newdatavulnerable[,]

#patched
plot(rpspatched,  type='l', col='red', main ='Request per second Patched', xlab='Concurrent connections', ylab='Request per second')
grid(col = "lightgray", lty = "dotted")

#vulnerable
plot(rpsvulnerable,  type='l', col='red', main ='Request per second Vulnerable', xlab='Concurrent connections', ylab='Request per second')
grid(col = "lightgray", lty = "dotted")


#patched + vulnerable

plot(rpsvulnerable,  type='l', col='blue', main ='Request per second', xlab='Concurrent connections', ylab='Request per second')
lines(rpspatched, type="l", col="red")

legend(75, 30,  # Plot legend
       c("vulnerable", "patched"),
       col = c("blue", "red"),
       lty = 1,
       lwd = 2)


sd(rpspatched$req_rate_192.168.33.100)
sd(rpsvulnerable$req_rate_192.168.33.101)

t.test(rpspatched$req_rate_192.168.33.100, rpsvulnerable$req_rate_192.168.33.101)

