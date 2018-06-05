install.packages("quantmod")
install.packages("astsa")

library(quantmod)
library(astsa)


wn1 = rnorm(500,0,1) # simuliert 500 N(0,1)-Variablen
wn2=rnorm(300,0,1)
wn3=rnorm(100,0,1)
wn4=rnorm(50,0,1)
par(mfrow=c(4,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0))
plot.ts(wn1, main="Zwei Pfade eines Gausschen White noise", ylab="")
plot.ts(wn2, ylab="")
plot.ts(wn3, ylab="")
plot.ts(wn4, ylab="")
acf(wn1,10)
acf(wn1,20)
acf(wn1,30)
acf(wn1,40)


rm(list=ls())
wn1 = rnorm(500,0,1)
x<-cumsum(wn1)
par(mfrow=c(3,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0))
plot.ts(wn1, main="Gauss White Noise und Cumsum", ylab="")
plot.ts(x, ylab="")
acf(wn1,20)


