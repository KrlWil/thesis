cpu_patched.txt <- read.table("~/Desktop/R/vmstat_patched.dat", skip = 1, header = TRUE, sep = "")
cpu_vulnerable.txt <- read.table("~/Desktop/R/vmstat_vulnerable.dat", skip = 1, header = TRUE, sep = "")

myvarsUS <- "us"
myvarsSY <- "sy"

newdatapatched <- cpu_patched.txt[myvarsUS] + cpu_patched.txt[myvarsSY]

newdatavulnerable <- cpu_vulnerable.txt[myvarsUS] + cpu_vulnerable.txt[myvarsSY]


cpu_patched <- newdatapatched[,]
cpu_vulnerable <- newdatavulnerable[,]

plot(cpu_patched, ylim=c(0,100), type='l', col='red', main ='CPU usage patched', xlab='Second', ylab='Percentage')

plot(cpu_vulnerable, ylim=c(0,100),  type='l', col='red', main ='CPU usage vulnerable', xlab='Second', ylab='Percentage')


#patched + vulnerable
plot(cpu_patched, ylim=c(0,100), type='l', col='red', main ='CPU usage patched', xlab='Second', ylab='Percentage')
lines(cpu_vulnerable, type="l", col="blue")

legend(5, 20,  # Plot legend
       c("vulnerable", "patched"),
       col = c("blue", "red"),
       lty = 1,
       lwd = 2)

