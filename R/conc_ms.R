#autobench --single_host --host1 192.168.33.100 --quiet               --low_rate 20 --high_rate 200 --rate_step 2 --num_call 1           --num_conn 50 --timeout 5 --file autobench_patched.tsv
#autobench --single_host --host1 192.168.33.101 --quiet               --low_rate 20 --high_rate 200 --rate_step 2 --num_call 1           --num_conn 50 --timeout 5 --file autobench_vulnerable.tsv

#require("ggplot2")

#patched
resultspatched.tsv <- read.table("~/Desktop/R/autobench_patched.tsv", header = TRUE, sep = "\t")
resultsvulnerable.tsv <- read.table("~/Desktop/R/autobench_vulnerable.tsv", header = TRUE, sep = "\t")

myvarspatched <- c("dem_req_rate", "resp_time_192.168.33.100")
myvarsvulnerable <- c("dem_req_rate", "resp_time_192.168.33.101")

newdatapatched <- resultspatched.tsv[myvarspatched]
newdatavulnerable <- resultsvulnerable.tsv[myvarsvulnerable]

mspatched <- newdatapatched[,]
msvulnerable <- newdatavulnerable[,]

#patched
plot(mspatched,  type='l', col='red', main ='Response time Patched', xlab='Concurrent connections', ylab='ms')
grid(col = "lightgray", lty = "dotted")

#vulnerable
plot(msvulnerable,  type='l', col='red', main ='Response time Vulnerable', xlab='Concurrent connections', ylab='ms')
grid(col = "lightgray", lty = "dotted")


#patched + vulnerable

plot(mspatched,  type='l', col='red', main ='Response time Patched', xlab='Concurrent connections', ylab='ms')
lines(msvulnerable, type="l", col="blue")

legend(150, 200,  # Plot legend
       c("vulnerable", "patched"),
       col = c("blue", "red"),
       lty = 1,
       lwd = 2)

sd(mspatched$resp_time_192.168.33.100)
sd(msvulnerable$resp_time_192.168.33.101)

t.test(mspatched$resp_time_192.168.33.100, msvulnerable$resp_time_192.168.33.101)

