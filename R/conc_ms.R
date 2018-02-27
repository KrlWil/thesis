#autobench --single_host --host1 192.168.33.100 --quiet               --low_rate 20 --high_rate 200 --rate_step 2 --num_call 1           --num_conn 50 --timeout 5 --file autobench_patched.tsv
#autobench --single_host --host1 192.168.33.101 --quiet               --low_rate 20 --high_rate 200 --rate_step 2 --num_call 1           --num_conn 50 --timeout 5 --file autobench_vulnerable.tsv

#require("ggplot2")

#patched
results.tsv <- read.table("~/Desktop/R/results_patched.tsv", header = TRUE, sep = "\t")
myvars <- c("dem_req_rate", "resp_time_192.168.33.100")
newdata <- results.tsv[myvars]

ms <- newdata[,]
plot(ms,  type='l', col='red', main ='Response time', xlab='Concurrent connections', ylab='ms')
grid(col = "lightgray", lty = "dotted")

