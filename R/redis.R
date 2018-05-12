library(reshape2)
library(ggplot2)
# source
# https://stackoverflow.com/questions/17288197/reading-a-csv-file-organized-horizontally/17289991#17289991
read.tcsv = function(file, header=TRUE, sep=",", ...) {
  
  n = max(count.fields(file, sep=sep), na.rm=TRUE)
  x = readLines(file)
  
  .splitvar = function(x, sep, n) {
    var = unlist(strsplit(x, split=sep))
    length(var) = n
    return(var)
  }
  
  x = do.call(cbind, lapply(x, .splitvar, sep=sep, n=n))
  x = apply(x, 1, paste, collapse=sep) 
  out = read.csv(text=x, sep=sep, header=header, ...)
  return(out)
  
}

redis_patched.txt <- read.tcsv("~/Desktop/R/redis_patched.csv")
redis_vulnerable.txt <- read.tcsv("~/Desktop/R/redis_vulnerable.csv")

redis_patched <- as.table(as.matrix(redis_patched.txt))
redis_vulnerable <- as.table(as.matrix(redis_vulnerable.txt))



df.txt  <- rbind(redis_patched.txt, redis_vulnerable.txt)
df<- as.table(as.matrix(df.txt))


par(oma = c(4, 1, 1, 1))  # outside margins (b, l, t, r)
par(mar = c(4, 5, 2, 10))  # plot margins
par(xpd=TRUE)
barplot(df,
        beside=TRUE,
        horiz  = FALSE,
        las    = 2,  #
        col    = c("grey","black"),
        # border = NA,
        main   = "Redis", 
        ylim = c(0,14000)
        # xlab   = "type"
        )
legend(25, 6000,  # Plot legend
       c("patched", "vulnerable"),
       col = c("grey", "black"),
       lty = 1,
       lwd = 2,
       bty = "n"
       )
df
df[1, 1:8] #patched
df[2, 1:8] #vulnerable
sd(df[1, 1:8])
sd(df[2, 1:8])

t.test(df[1, 1:8], df[2, 1:8])
