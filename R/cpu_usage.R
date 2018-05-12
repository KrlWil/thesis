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
plot(cpu_patched, ylim=c(0,100), type='l', col='red', main ='CPU usage', xlab='Second', ylab='Percentage')
lines(cpu_vulnerable, type="l", col="blue")

legend(5, 20,  # Plot legend
       c("vulnerable", "patched"),
       col = c("blue", "red"),
       lty = 1,
       lwd = 2)

mean(cpu_patched)
mean(cpu_vulnerable)
sd(cpu_patched)
sd(cpu_vulnerable)

t.test(cpu_patched, cpu_vulnerable)
format(2.2e-16, scientific=FALSE)

#system time

sysdatapatched <- cpu_patched.txt[myvarsSY]

sysdatavulnerable <- cpu_vulnerable.txt[myvarsSY]

cpu_patched_sys <- sysdatapatched[,]
cpu_vulnerable_sys <- sysdatavulnerable[,]

plot(cpu_patched_sys, ylim=c(0,100), type='l', col='red', main ='CPU usage system', xlab='Second', ylab='Percentage')
lines(cpu_vulnerable_sys, type="l", col="blue")

legend(5, 20,  # Plot legend
       c("vulnerable", "patched"),
       col = c("blue", "red"),
       lty = 1,
       lwd = 2)

mean(cpu_patched_sys)
mean(cpu_vulnerable_sys)
sd(cpu_patched_sys)
sd(cpu_vulnerable_sys)


t.test(cpu_patched_sys, cpu_vulnerable_sys)
#format(9.314e-07, scientific=FALSE)

# user time

usdatapatched <- cpu_patched.txt[myvarsUS]

usdatavulnerable <- cpu_vulnerable.txt[myvarsUS]

cpu_patched_us <- usdatapatched[,]
cpu_vulnerable_us <- usdatavulnerable[,]

plot(cpu_patched_us, ylim=c(0,100), type='l', col='red', main ='CPU usage user', xlab='Second', ylab='Percentage')
lines(cpu_vulnerable_us, type="l", col="blue")

legend(5, 20,  # Plot legend
       c("vulnerable", "patched"),
       col = c("blue", "red"),
       lty = 1,
       lwd = 2)

mean(cpu_patched_us)
mean(cpu_vulnerable_us)
sd(cpu_patched_us)
sd(cpu_vulnerable_us)

t.test(cpu_patched_us, cpu_vulnerable_us)
