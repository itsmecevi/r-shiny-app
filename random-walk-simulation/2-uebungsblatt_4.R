###### 
#A
#Erzeugen Sie 4 Realisierungen (st) eines Random Walks
#der L�nge N = 100 mit Drift � = 0.01 und var = 1

#skript 2-2 bis 2-3 f�r White Noise und 2-8 bis 2-12 f�r Random Walk
#Random Walk ohne drift: EW=0
#EW(1)+EW(const=0.01)=0+0.01= RW mit drift dh. EW=0.01

#erstmal install quantmod and astsa package!!!

#Random-Walk Simulation
rm(list=ls())
par(mfrow=c(1,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0)) #praparing for 4 graph
WN_d<-rnorm(100,0.01,1) # 100 Beobachtungen EW=0.01 Var=1, mit drift
WN_d
RW_d<-cumsum(WN_d)
RW_d
plot(RW_d, type="l", main="Random Walk", xlab="Perioden", ylab="")


######
#Passen Sie jeweils eine lineare Regression st = ??t + ut
#an jede Realisierung mittels der Methode der kleinsten Quadrate an. 

#skript 3-12 bis 3-22
#st = bt + ut direkt mit lm()n funktion

#Plotten Sie f�r jede Realisierung jeweils die Daten, 
#den wahren Trend (mt = 0.01t) 
#und die Regressionsgerade (insgesamt 4 Bilder). 

rm(list=ls())
par(mfrow=c(4,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0)) #praparing for 4 graph
WN1<-rnorm(100,0.01,1) # 100 Beobachtungen EW=0.01 Var=1
WN2<-rnorm(100,0.01,1)# 100 Beobachtungen EW=0.01 Var=1
WN3<-rnorm(100,0.01,1) # 100 Beobachtungen EW=0.01 Var=1
WN4<-rnorm(100,0.01,1) # 100 Beobachtungen EW=0.01 Var=1
RW1<-cumsum(WN1)
RW2<-cumsum(WN2)
RW3<-cumsum(WN3)
RW4<-cumsum(WN4)

t<-c(1:(100))
t

plot(RW1, type="l", main="Random Walk 1", xlab="Perioden", ylab="")
fit1<-lm(RW1~t)
abline(fit1,col="2")
trend1<-0.01*(1:length(1:100))
trend1
abline(a=0,b=trend1,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)


plot(RW2, type="l", main="Random Walk 2", xlab="Perioden", ylab="")
fit2<-lm(RW2~t)
abline(fit2,col="2")
trend2<-0.01*(1:length(1:100))
trend2
abline(a=0,b=trend2,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)

plot(RW3, type="l", main="Random Walk 3", xlab="Perioden", ylab="")
fit3<-lm(RW3~t)
abline(fit3,col="2")
trend3<-0.01*(1:length(1:100))
trend3
abline(a=0,b=trend3,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)

plot(RW4, type="l", main="Random Walk 4", xlab="Perioden", ylab="")
fit4<-lm(RW4~t)
abline(fit4,col="2")
trend4<-0.01*(1:length(1:100))
trend4
abline(a=0,b=trend4,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)


summary(fit1)
summary(fit2)
summary(fit3)
summary(fit4)
AIC(fit1,fit2,fit3,fit4)
BIC(fit1,fit2,fit3,fit4)


#########################################################################
#B

#Erzeugen Sie 4 Realisierungen (xt) 
#eines Trends plus Rauschen xt = 0.01t+??t 
#der L�nge N = 100 mit Drift � = 0.01 und ??2 
#skript 2-9



rm(list=ls())
par(mfrow=c(4,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0)) #praparing for 4 graph
WN1<-rnorm(100,0,1) # 100 Beobachtungen EW=0 Var=1
WN2<-rnorm(100,0,1) # 100 Beobachtungen EW=0 Var=1
WN3<-rnorm(100,0,1) # 100 Beobachtungen EW=0 Var=1
WN4<-rnorm(100,0,1) # 100 Beobachtungen EW=0 Var=1

t<-c(1:100)
t

xt1<-0.01*t+WN1
xt2<-0.01*t+WN2
xt3<-0.01*t+WN3
xt4<-0.01*t+WN4


plot(xt1, type="l", main="Trend + Rauschen 1", xlab="Perioden", ylab="")
fit1<-lm(xt1~t)
abline(fit1,col="2")
trend1<-0.01*(1:length(1:100))
trend1
abline(a=0,b=trend1,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)


plot(xt2, type="l", main="Trend + Rauschen 2", xlab="Perioden", ylab="")
fit2<-lm(xt2~t)
abline(fit2,col="2")
trend2<-0.01*(1:length(1:100))
trend2
abline(a=0,b=trend2,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)

plot(xt3, type="l", main="Trend + Rauschen 3", xlab="Perioden", ylab="")
fit3<-lm(xt3~t)
abline(fit3,col="2")
trend3<-0.01*(1:length(1:100))
trend3
abline(a=0,b=trend3,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)

plot(xt4, type="l", main="Trend + Rauschen 4", xlab="Perioden", ylab="")
fit4<-lm(xt4~t)
abline(fit4,col="2")
trend4<-0.01*(1:length(1:100))
trend4
abline(a=0,b=trend4,col="green")
legend("topleft",legend=c("lin. reg","Trend"),lty=rep(1,4),col=c("red","green"),cex=0.7, ncol=2)
#abline(h=1)


summary(fit1)
summary(fit2)
summary(fit3)
summary(fit4)
AIC(fit1,fit2,fit3,fit4)
BIC(fit1,fit2,fit3,fit4)





