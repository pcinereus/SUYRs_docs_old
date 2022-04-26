## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----loadLibraries, results='markdown', eval=TRUE, message=FALSE, warning=FALSE----
library(splines)
library(ggfortify)
library(ggeffects)
library(mgcv)
library(gratia)
library(emmeans)
library(gridExtra)
library(tidyverse)


## ----Intro1, results='markdown', eval=TRUE, fig.width=6, fig.height=3---------
set.seed(123)
x = seq(0,2*pi, len=50)
yp=sin(x)
y = sin(x) + rnorm(length(x), mean=0, sd=0.5)
dat = data.frame(yp=yp, y=y, x=x)
g1=ggplot(dat, aes(y=y, x=x)) + geom_point() +
    geom_line(aes(y=yp), linetype='dashed') + ggtitle('Example 1')

set.seed(123)
x = seq(0,3*pi, len=50)
yp = 2 - 0.5*x + sin(x)
y = 2 - 0.5*x + sin(x) + rnorm(length(x), mean=0, sd=0.5)
dat2 = data.frame(yp=yp, y=y, x=x)
g2=ggplot(dat2, aes(y=y, x=x)) + geom_point() +
    geom_line(aes(y=yp), linetype='dashed') + ggtitle('Example 2')

grid.arrange(g1,g2, nrow=1)


## ----mod1, results='markdown', eval=TRUE, fig.height=3, fig.width=6-----------
dat.lm = lm(y~x, data=dat)
dat2.lm = lm(y~x, data=dat2)
autoplot(list(dat.lm, dat2.lm), which=1)


## ----modPartial1, results='markdown', eval=TRUE, fig.width=6, fig.height=3----
grid.arrange(
    ggpredict(dat.lm, ~x) %>% plot(rawdata=TRUE),
    ggpredict(dat2.lm, ~x) %>% plot(rawdata=TRUE),
    nrow=1
    )


## ----mod2, results='markdown', eval=TRUE, fig.height=3, fig.width=6-----------
dat.lm2 = lm(y~x+I(x^2)+I(x^3), data=dat)
dat2.lm2 = lm(y~x+I(x^2)+I(x^3), data=dat2)
autoplot(list(dat.lm2,dat2.lm2), which=1)

## ----modPartial2, results='markdown', eval=TRUE, fig.width=6, fig.height=3----
grid.arrange(
    ggpredict(dat.lm2, ~x) %>% plot(rawdata=TRUE),
    ggpredict(dat2.lm2, ~x) %>% plot(rawdata=TRUE),
    nrow=1)


## ----mod3, results='markdown', eval=TRUE, fig.height=3, fig.width=6-----------
dat.lm3 = lm(y~poly(x,3), data=dat)
autoplot(dat.lm3, which=1)

## ----modPartial3, results='markdown', eval=TRUE, fig.width=3, fig.height=3----
ggpredict(dat.lm3, ~x) %>% plot(rawdata=TRUE)
summary(dat.lm3)


## ----mod3a, results='markdown', eval=TRUE, fig.width=3, fig.height=3----------
mid=mean(dat2$x)-0.5
dat3a = dat2 %>% filter(x<=mid)
dat3a.lm = lm(y~poly(x,3), data=dat3a)
dat3b = dat2 %>% filter(x>mid)
dat3b.lm = lm(y~poly(x,3), data=dat3b)

fita=data.frame(x=seq(min(dat3a$x), mid, len=100)) %>%
    cbind(predict(dat3a.lm, newdata=., interval='confidence'))
fitb=data.frame(x=seq(mid, max(dat3b$x), len=100)) %>%
    cbind(predict(dat3b.lm, newdata=., interval='confidence'))

ggplot() +
    geom_ribbon(data=fita, aes(ymin=lwr, ymax=upr, x=x, fill='1'), alpha=0.3, show.legend=FALSE) +
    geom_ribbon(data=fitb, aes(ymin=lwr, ymax=upr, x=x, fill='2'), alpha=0.3, show.legend=FALSE) +
    geom_line(data=fita, aes(y=fit, x=x, color='1'), show.legend=FALSE) +
    geom_line(data=fitb, aes(y=fit, x=x, color='2'), show.legend=FALSE) +
    geom_point(data=dat2, aes(y=y, x=x))


## ----mod3b, results='markdown', eval=TRUE, fig.width=3, fig.height=3----------
mid=mean(dat2$x)-0.5
dat3 = dat2 %>% mutate(x2=ifelse(x-mid > 0, x, 0))
dat3.lm = lm(y~poly(x,3) + poly(x2,3), data=dat3)
newdata=with(dat2, data.frame(x=seq(min(x), max(x), len=1000))) %>%
    mutate(x2=ifelse(x-mid > 0, x, 0))

dat3 = newdata %>% cbind(predict(dat3.lm, newdata=newdata, interval='confidence')) %>%
    mutate(Part=ifelse(x2==0, '1', '2'))

ggplot(dat3, aes(y=fit, x=x)) +
    geom_ribbon(aes(ymin=lwr, ymax=upr, fill=Part), alpha=0.3, show.legend=FALSE) +
    geom_line(aes(color=Part), show.legend=FALSE) +
    geom_point(data=dat2, aes(y=y, x=x))


## ----splineBasis1, results='markdown', eval=TRUE, fig.width=4, fig.height=3----
k=mid
basis = with(dat2, data.frame(x=x, bs(x, knots=k, degree = 3))) %>%
    gather(key=Basis, value=Value, -x)

basis %>% ggplot(aes(y=Value, x=x, color=Basis)) + geom_line()


## ----mod4, results='markdown', eval=FALSE, echo=FALSE-------------------------
## dat.lm4 = lm(y~bs(x), data=dat)
## autoplot(dat.lm4, which=1)
## ggpredict(dat.lm4, ~x) %>% plot(rawdata=TRUE)


## ----mod4a, results='markdown', eval=TRUE-------------------------------------
k=mid
dat2.lm4 = lm(y~bs(x, knots=k, degree=3), data=dat2)
summary(dat2.lm4)


## ----splineBasis2, results='markdown', eval=TRUE, fig.width=4, fig.height=3----
basis = cbind(1,bs(dat2$x, knots=k, degree=3))
basis = sweep(basis, MARGIN=2, coef(dat2.lm4), '*')
#basis = basis + coef(dat2.lm4)[1]
fit = rowSums(basis)
basis = basis %>% as.data.frame %>% 
    gather(key=Basis, value=Value) %>%
    cbind(x=dat2$x)

ggplot() + geom_line(data=basis, aes(y=Value, x=x,color=Basis)) +
    geom_line(data=NULL, aes(y=fit, x=dat2$x)) +
    geom_point(data=dat2, aes(y=y, x=x))


## ----name, results='markdown', eval=TRUE--------------------------------------
ggpredict(dat2.lm4, ~x) %>% plot(rawdata=TRUE) 


## ----mod5a, results='markdown', eval=TRUE, fig.width=6, fig.height=3----------
k=with(dat2, seq(min(x), max(x), len=12))
k=k[c(-1,-length(k))]
dat2.lm5 = lm(y~bs(x, knots=k, degree=3), data=dat2)

k=with(dat2, seq(min(x), max(x), len=22))
k=k[c(-1,-length(k))]
dat2.lm6 = lm(y~bs(x, knots=k, degree=3), data=dat2)

grid.arrange(
    ggpredict(dat2.lm5, ~x) %>% plot(rawdata=TRUE),
    ggpredict(dat2.lm6, ~x) %>% plot(rawdata=TRUE), 
    nrow=1)


## ----Intro2, results='markdown', eval=TRUE------------------------------------
bs = smoothCon(s(x, bs='cr'), data=dat2)
B=bs[[1]]$X
B = cbind(x=dat2$x, B) %>%
    as.data.frame %>%
    gather(key=Basis, value=y, -x) %>%
    mutate(Basis = factor(Basis, levels=unique(Basis)))


## ----Intro2a, results='markdown', eval=TRUE-----------------------------------
ggplot(B, aes(y=y, x=x)) + geom_line() + facet_wrap(~Basis)


## ----Intro2b, results='markdown', eval=TRUE, fig.height=3, fig.width=6, out.height=250, out.width=500----
ggplot(B, aes(y=y, x=x)) + geom_line(aes(color=Basis))


## ----Intro2c, results='markdown', eval=TRUE-----------------------------------
bs = smoothCon(s(x, bs='cr'), absorb.cons=TRUE, data=dat2)
dat2.glm = glm(y ~ bs[[1]]$X, data=dat2)
coef(dat2.glm)


## ----Intro3, results='markdown', eval=TRUE------------------------------------
dat2.gam = gam(y ~ s(x, bs='cr', k=10, fx=TRUE), data=dat2)
coefs = coef(dat2.gam)
coefs


## ----Intro4, results='markdown', eval=TRUE,fig.height=3, fig.width=6, out.height=250, out.width=500----
newdata = data.frame(x=seq(0,3*pi, len=100))
Xmat = predict(dat2.gam, type='lpmatrix', newdata=newdata)
fits = sweep(Xmat,MARGIN=2,coefs,'*')
newdata = newdata %>% mutate(fit=rowSums(fits))
fits %>% as.data.frame %>% 
    bind_cols(newdata) %>% 
    gather(key=Basis, value=y, -x,-fit) %>%
    ggplot(aes(y=y, x=x)) + geom_line(aes(color=Basis)) +
    geom_line(aes(y=fit)) +
    geom_point(data=dat2) +
    geom_line(data=dat2, aes(y=yp), linetype='dashed')


## ----Intro5, results='markdown', eval=TRUE,fig.height=3, fig.width=6, out.height=250, out.width=500----
dat2.gam = gam(y ~ s(x, bs='cr', k=3, fx=TRUE), data=dat2)
coefs = coef(dat2.gam)
newdata = data.frame(x=seq(0,3*pi, len=100))
Xmat = predict(dat2.gam, type='lpmatrix', newdata=newdata)
fits = sweep(Xmat,MARGIN=2,coefs,'*')
newdata = newdata %>% mutate(fit=rowSums(fits))
fits %>% as.data.frame %>% 
    bind_cols(newdata) %>% 
    gather(key=Basis, value=y, -x,-fit) %>%
    ggplot(aes(y=y, x=x)) + geom_line(aes(color=Basis)) +
    geom_line(aes(y=fit)) +
    geom_point(data=dat2) +
    geom_line(data=dat2, aes(y=yp), linetype='dashed')


## ----Intro6, results='markdown', eval=TRUE,fig.height=3, fig.width=6, out.height=250, out.width=500----
dat2.gam = gam(y ~ s(x, bs='cr'), data=dat2, method='REML')
coefs = coef(dat2.gam)
newdata = data.frame(x=seq(0,3*pi, len=100))
Xmat = predict(dat2.gam, type='lpmatrix', newdata=newdata)
fits = sweep(Xmat,MARGIN=2,coefs,'*')
newdata = newdata %>% mutate(fit=rowSums(fits))
fits %>% as.data.frame %>% 
    bind_cols(newdata) %>% 
    gather(key=Basis, value=y, -x,-fit) %>%
    ggplot(aes(y=y, x=x)) + geom_line(aes(color=Basis)) +
    geom_line(aes(y=fit)) +
    geom_point(data=dat2) +
    geom_line(data=dat2, aes(y=yp), linetype='dashed')


## ----Diagnostics1, results='markdown', eval=TRUE------------------------------
k.check(dat2.gam)


## ----Diagnostics2, results='markdown', eval=TRUE,fig.height=6, fig.width=6, out.height=500, out.width=500----
gratia::appraise(dat2.gam)


## ----Diagnostics3, results='markdown', eval=TRUE,fig.height=6, fig.width=6, out.height=500, out.width=500----
concurvity(dat2.gam)
concurvity(dat2.gam, full=FALSE)



## ----Model1, results='markdown', eval=TRUE------------------------------------
gratia::draw(dat2.gam)


## ----Model2, results='markdown', eval=TRUE------------------------------------
summary(dat2.gam)


## ----Emmeans, results='markdown', eval=TRUE-----------------------------------
data.list = with(dat2, list(x=seq(min(x), max(x), len=100)))
newdata = emmeans(dat2.gam, ~x, at=data.list) %>% as.data.frame
newdata %>%
    ggplot(aes(y=emmean, x=x)) +
    geom_ribbon(aes(ymin=lower.CL, ymax=upper.CL), fill='blue', color=NA, alpha=0.3) +
    geom_line() +
    geom_point(data=dat2, aes(y=y)) +
    theme_bw()


## ----Manually, results='markdown', eval=TRUE----------------------------------
newdata = with(dat2, data.frame(x=seq(min(x), max(x), len=100)))
Xmat = predict(dat2.gam, newdata=newdata, type='lpmatrix')
coefs = coef(dat2.gam)
Fit = as.vector(coefs %*% t(Xmat))
SE = sqrt(diag(Xmat %*% vcov(dat2.gam) %*% t(Xmat)))
Q = qt(0.975, df=df.residual(dat2.gam))
newdata = newdata %>% mutate(fit = Fit,
                             lower = Fit-Q*SE,
                             upper = Fit+Q*SE)
newdata %>%
    ggplot(aes(y=Fit, x=x)) +
    geom_ribbon(aes(ymin=lower, ymax=upper), fill='blue', color=NA, alpha=0.3) +
    geom_line() +
    geom_point(data=dat2, aes(y=y)) +
    theme_bw()

