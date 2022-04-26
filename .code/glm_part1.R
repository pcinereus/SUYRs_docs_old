## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----libraries, results='markdown', eval=TRUE, warning=TRUE, message=FALSE----
library(tidyverse) #for data wrangling and plotting
library(gganimate) #for animations
library(gridExtra) #for additional plotting routines


## ----mod1, results='markdown', eval=TRUE, echo=FALSE, fig.height=3,fig.width=3, warning=FALSE----
x=1:10
y=2+5*x
ggplot(data=NULL, aes(y=y, x=x)) + geom_line() + theme_classic() +
    theme(axis.text=element_blank(), axis.ticks=element_blank())


## ----compareModels, results='markdown', eval=TRUE, echo=FALSE, fig.height=3,fig.width=6, warning=FALSE----
set.seed(234)
x=1:10
y=2+5*x
y1=2+5*x + rnorm(10,0,4) 
g1=ggplot(data=NULL, aes(y=y, x=x)) + geom_line() + theme_classic() +
    annotate(geom='text', y=40, x=2, label=expression(y==2+5*x), parse=TRUE, hjust=0)
g2=ggplot(data=NULL, aes(y=y1, x=x)) + geom_point() + geom_smooth(method='lm', se=FALSE) + theme_classic() +
    annotate(geom='text', y=40, x=2, label=expression(y==2+5*x+epsilon), parse=TRUE, hjust=0) +
    scale_y_continuous('y')
grid.arrange(g1, g2, nrow=1)


## ----sim, results='markdown', eval=TRUE, fig.width=3, fig.height=3------------
set.seed(234)
dat = data.frame(x=1:10) %>%
    mutate(y = round(2 + 5*x + rnorm(10, 0, 4), 2))
dat
ggplot(data=dat) + geom_point(aes(y=y, x=x))


## ----stats1, results='markdown', eval=TRUE------------------------------------
mean(dat$y)
var(dat$y)
sd(dat$y)


## ----sim2, results='markdown', eval=TRUE, fig.width=3, fig.height=3-----------
set.seed(123)
beta = c(2, 1.20)
beta=log(beta)
n = 10
dat2 = data.frame(x=seq(1,10,len=n)) %>%
    mutate(y = rpois(n, lambda=exp(beta[1] + beta[2]*x)))
dat2
ggplot(data=dat2) + geom_point(aes(y=y, x=x)) 


## ----olsSim, results='markdown', eval=TRUE------------------------------------
mu = seq(15,40,len=1000)
rss = vector('numeric', length(mu))
for (i in 1:length(mu)) {
    rss[i] = sum((dat$y - mu[i])^2)
}
mu[which(rss==min(rss))]
ggplot(data=NULL) + geom_line(aes(y=rss, x=mu))


## ----mm, results='markdown', eval=TRUE----------------------------------------
## Generate the single column matrix of 1s
X = cbind(rep(1,length(dat$y)))
## perform the matrix multiplications to solve for beta
## beta = (X'X)^-1 X'Y
beta = solve(t(X) %*% X) %*% t(X) %*% dat$y
beta


## ----ex2, results='markdown', eval=TRUE---------------------------------------
dat


## ----mm1, results='markdown', eval=TRUE---------------------------------------
## Generate the model matrix
X = model.matrix(~x, data=dat)
## Solve for beta
beta = solve(t(X) %*% X) %*% t(X) %*% dat$y
beta


## ----lm, results='markdown', eval=TRUE----------------------------------------
lm(y~x, data=dat)


## ----ex1, results='markdown', eval=TRUE---------------------------------------
dat$y


## ----LL, results='markdown', eval=TRUE----------------------------------------
LL.gaus = function(theta, x) {
    m=theta[1]
    s=theta[2]
    ll = -(length(x)/2)*(log(2*pi*s^2)) + (-1/(2*s^2)) * sum((x-m)^2)
    ##OR
    ## ll = sum(dnorm(x, mean=m, sd=s, log=TRUE))
    return(-ll)
}


## ----mle, results='markdown', eval=TRUE---------------------------------------
mu = seq(15,40,len=1000)
theta=cbind(mu=mu,sigma=1)
B=apply(theta, 1, LL.gaus, dat$y)
theta[which(B==min(B)),]
ggplot(data=NULL) + geom_line(aes(y=B, x=theta[,'mu']))


## ----bruteForce, results='markdown', eval=TRUE, fig.width=4, fig.height=4-----
mu = seq(15,40,len=100)
sigma=seq(10,20,len=100)
theta = expand.grid(mu=mu, sigma=sigma)
theta$LL=apply(theta, 1, LL.gaus, x=dat$y)
ggplot(data=theta,aes(y=mu, x=sigma, fill=LL)) +
    geom_tile(show.legend=FALSE) + geom_contour(aes(z=LL)) +
    geom_point(data=theta[which(theta$LL==min(theta$LL)),], aes(y=mu, x=sigma), fill='black') +
    scale_fill_gradientn(colors=terrain.colors(12)) +
    scale_x_continuous(expand=c(0,0)) +
    scale_y_continuous(expand=c(0,0))
theta[which(theta$LL==min(theta$LL)),]


## ----optimNM, results='markdown', eval=TRUE-----------------------------------
get.optim.NM <- function(X.vert, params.init, objective.fn, iter.max=250, abs.tol=0.0001, x, control=list(fnscale=1,refl=1,expan=2,contr=-0.5,shrink=0.5))
{
                                        # input dimension
    X.len <- length(params.init)
                                        # initialize controls before iterations of searching
    iter <- 0; not.converged <- 1; not.max.iter <- 1
    X.optim <- params.init; f_X.optim <- control$fnscale*objective.fn(X.optim, x=x)
                                        # while loop, iterations
    while (not.converged & not.max.iter)
    {
                                        # get values at vertices
        f_X.vert <- control$fnscale*apply(X = X.vert, MARGIN = 1, FUN = objective.fn, x) 
                                        # order ascending X.vert and f(X.vert), by f(X.vert)
        X.order <- sort(f_X.vert, index.return = TRUE)$ix
        X.vert <- X.vert[X.order, ]
        f_X.vert <- f_X.vert[X.order]
                                        # get centroid (mean on each dimension) of all points except the worst
        X.centr <- apply(X = X.vert[1:X.len, ], MARGIN = 2, FUN = mean)
                                        # get reflected point
        X.refl <- X.centr + control$refl*(X.centr - X.vert[X.len+1, ])
        f_X.refl <- control$fnscale*objective.fn(X.refl,x)
        if ((f_X.vert[1] <= f_X.refl) & (f_X.refl < f_X.vert[X.len]))
        { 
                                        # if the reflected point is better than the second worst, but not better than the best...
                                        # ... then obtain a new simplex by replacing the worst point with the reflected point
            X.vert[X.len+1, ] <- X.refl 
        } else if (f_X.refl < f_X.vert[1]) {
                                        # if the reflected point is the best point so far
                                        # ... then compute the expanded point
            X.expan <- X.centr + control$expan*(X.centr - X.vert[X.len+1, ])
            f_X.expan <- control$fnscale*objective.fn(X.expan,x)
                                        # ... if the expanded point is better than the reflected point
            if (f_X.expan < f_X.refl)
            {
                                        # ... then obtain a new simplex by replacing the worst point with the expanded point
                X.vert[X.len+1, ] <- X.expan   
            } else {
                                        # ... else obtain a new simplex by replacing the worst point with the reflected point
                X.vert[X.len+1, ] <- X.refl
            }
        } else {
                                        # ... reflected point is not better than second worst
                                        # ... then compute the contracted point
            X.contr <- X.centr + control$contr*(X.centr - X.vert[X.len+1, ])
            f_X.contr <- control$fnscale*objective.fn(X.contr,x)
                                        # ... if the contracted point is better than the worst point
            if (f_X.contr < f_X.vert[X.len+1])
            {
                                        # ... then obtain a new simplex by replacing the worst point with the contracted point
                X.vert[X.len+1, ] <- X.contr
            } else {
                                        # ... shrink the simplex: X = X1 + coef.shrink(X-X1)
                X.vert <- sweep(control$shrink*sweep(X.vert, 2, X.vert[1, ], FUN = "-"), 2, X.vert[1, ], FUN="+")
            }    
        }
                                        # get values at vertices
        f_X.vert <- control$fnscale*apply(X = X.vert, MARGIN = 1, FUN = objective.fn, x) 
                                        # order asc X.vert and f(X.vert)
        X.order <- sort(f_X.vert, index.return = TRUE)$ix
        X.vert <- X.vert[X.order, ]
        f_X.vert <- f_X.vert[X.order]   
                                        # update controls
        iter <- iter + 1 
        not.max.iter <- (iter < iter.max)*1
        not.converged <- (abs(control$fnscale*objective.fn(X.vert[X.len, ],x)- control$fnscale*objective.fn(X.vert[1, ],x)) > abs.tol)*1
        
        X.optim <- X.vert[1, ]; f_X.optim <- control$fnscale*objective.fn(X.optim,x)
    }
    return(list(X.optim=X.optim, f_X.optim=f_X.optim, X.vert=X.vert, iter=iter))   
}


## ----simplexAnim, results='markdown', eval=TRUE, warning=FALSE, message=FALSE, cache=TRUE----
## Starting values at the center of the vectices
params.init=c(mu=20, sigma=12)
d.mu=0.5
d.sigma=0.3
simplex = rbind(Vertex1=params.init + c(d.mu,d.sigma),
                Vertex2=params.init + c(-d.mu,d.sigma),
                Vertex3=params.init + c(-d.mu,-d.sigma)) %>%
    data.frame
base.plot = ggplot(data=theta,aes(y=mu, x=sigma)) +
    geom_tile(aes(fill=LL), show.legend=FALSE) + geom_contour(aes(z=LL)) +
    scale_fill_gradientn(colors=terrain.colors(12)) +
    scale_x_continuous(expand=c(0,0)) +
    scale_y_continuous(expand=c(0,0))

newdata =vector('list', 15)
a=get.optim.NM(X.vert=as.matrix(simplex), params.init, objective.fn=LL.gaus, x=dat$y, iter.max=1, control=list(fnscale=1,refl=1,expan=2,contr=-0.5,shrink=0.5))
newdata[[1]] =data.frame(a$X.vert)
for (i in 2:15) {
    a=get.optim.NM(X.vert=a$X.vert, params.init=a$X.optim, objective.fn=LL.gaus, x=dat$y, iter.max=1, control=list(fnscale=1,refl=1,expan=2,contr=-0.5,shrink=0.5))
    newdata[[i]] = data.frame(a$X.vert)
}
newdata = bind_rows(newdata, .id='Iter') %>% mutate(Iter=factor(Iter, levels=unique(Iter)))
g=base.plot + 
    geom_polygon(data=newdata, aes(y=mu, x=sigma, group=Iter), color='black', fill='grey40') +
    transition_manual(Iter) + shadow_trail(distance=0.1,alpha=0.4, color='grey40', fill=NA) + labs(title='Iter: {current_frame}')
ga=animate(g, fps = 20, duration = 15)
#ga=animate(g, renderer=av_renderer())
anim_save('simplexAnim.gif', animation=ga, path='../tut/glm_part1_files',  renderer=av_renderer())


## ----simplexOptimNM, results='markdown', eval=TRUE----------------------------
get.optim.NM(X.vert=as.matrix(simplex), params.init, objective.fn=LL.gaus, x=dat$y, iter.max=250, abs.tol=1e-08, control=list(fnscale=1,refl=1,expan=2,contr=-0.5,shrink=0.5))
get.optim.NM(X.vert=as.matrix(simplex - c(-0.5,0.2)), params.init, objective.fn=LL.gaus, x=dat$y, iter.max=250, abs.tol=1e-08, control=list(fnscale=1,refl=1,expan=2,contr=-0.5,shrink=0.5))


## ----simplexOptim, results='markdown', eval=TRUE------------------------------
optim(par=c(20,12), LL.gaus, x=dat$y, control=list(fnscale=1))


## ----eg3, results='markdown', eval=TRUE---------------------------------------
NR = function(f, x, return.grid=FALSE) {
    if (is.function(f)) f=body(f)[[2]]    
    f_x = eval(f)
    f._x = eval(D(f,'x'))
    if (return.grid) {
        list(x1=x - f_x/f._x, f_x=f_x, f._x=f._x)
    }else {
        list(x1=x - f_x/f._x)
    }
}
optim.NR = function(f, x0, abs.tol=1.0E-6, iter.max=250, return.grid=FALSE) {
    iter <- 0; not.converged <- 1; not.max.iter <- 1
    fgrid = list()
    while (not.converged & not.max.iter) {
        nr=NR(f, x=x0,return.grid)
        x1=nr$x1
        iter <- iter + 1 
        not.max.iter <- (iter < iter.max)*1
        not.converged=(abs(x0-x1)>abs.tol)*1
        if (return.grid) fgrid[[iter]] = c(x0=x0, x1=x1, f_x=nr$f_x, f._x=nr$f._x)
        x0=x1
    }
    list(X.optim=x0,iter=iter, grid=do.call('rbind',fgrid))
}

## ----NManim, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
f = function(x) {0.1*x^4 + x^3 - x^2 + 10*x + 30} 
a=optim.NR(f, x0=3, abs.tol=0.001, return.grid=TRUE)

x = seq(-4,4,len=100)
dat1 = data.frame(x=x, y=f(x))
gdat = a$grid %>% as.data.frame %>%
    mutate(Iter=1:n(),
           x=ifelse(x0>0,x0+1, x0-1),
           y=f_x + (x-x0)*f._x)

g=ggplot() + geom_line(data=dat1, aes(y=y, x=x)) +
    geom_hline(yintercept=0, linetype='dashed') +
    geom_segment(data=gdat, aes(x=x,y=y,xend=x1,yend=0), color='red') +
    geom_segment(data=gdat, aes(x=x0,xend=x0,y=0,yend=f_x), linetype='dashed')+
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x0, y=-5, label="x[0]"), parse=TRUE) +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x1, y=-5, label="x[1]"), parse=TRUE) +
    geom_point(data=gdat, aes(x=x0, y=f_x)) +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x0, y=f_x, label="f(x)"), parse=TRUE, nudge_x=0.1, nudge_y=-5, hjust=0, vjust=0) +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x0+0.3+(x1-x0)/2, y=(f_x/2)-5, label="f*minute*(x)"), parse=TRUE, color='red') +
    geom_text(data=gdat, aes(x=-4,y=140, label=paste0("Iter == ", Iter)), parse=TRUE, hjust=0) +
    geom_text(data=gdat, aes(x=-4,y=120, label=paste0("x[1] == ", round(x1,3))), parse=TRUE, hjust=0) +
    transition_manual(Iter)
ga=animate(g, fps = 20, duration = 5)
anim_save('NMAnim1.gif', animation=ga, path='../tut/glm_part1_files')


## ----NMOptim, results='markdown', eval=TRUE-----------------------------------
optim.NR(f, x0=3)


## ----NManim1, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=8, fig.height=4----
f = function(x) {0.001*x^3 - 0.001*x^2 -0.3*x + 5}
f1=D(body(f)[[2]], 'x')
x = seq(0,20,len=100)
dat1 = data.frame(x=x, y=f(x))
g1=ggplot() + geom_line(data=dat1, aes(y=y, x=x)) 

g2=ggplot() + geom_line(data=data.frame(x=x, y=eval(f1, envi=list(x=x))), aes(y=y, x=x)) +
    geom_hline(yintercept=0, linetype='dashed')
grid.arrange(g1,g2, nrow=1)
(a=optim.NR(f1, x0=3, abs.tol=0.001, return.grid=TRUE))


## ----NManim1a, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=4, fig.height=4----
dat1 = data.frame(x, y=eval(f1, env=list(x=x)))
gdat = a$grid %>% as.data.frame %>%
    mutate(Iter=1:n(),
           x=ifelse(x0>0,x0+1, x0-1),
           y=f_x + (x-x0)*f._x)

g2=ggplot() + geom_line(data=dat1, aes(y=y, x=x)) +
    geom_hline(yintercept=0, linetype='dashed') +
    geom_segment(data=gdat, aes(x=x,y=y,xend=x1,yend=0), color='red') +
    geom_segment(data=gdat, aes(x=x0,xend=x0,y=0,yend=f_x), linetype='dashed') +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x0, y=-0.05, label="x[0]"), parse=TRUE) +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x1, y=-0.05, label="x[1]"), parse=TRUE) +
    geom_point(data=gdat, aes(x=x0, y=f_x)) +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x0, y=f_x, label="f(x)"), parse=TRUE, nudge_x=0.1, nudge_y=-0.05, hjust=0, vjust=0) +
    geom_text(data=gdat %>% filter(Iter<4), aes(x=x0+0.3+(x1-x0)/2, y=(f_x/2)-0.05, label="f*minute*(x)"), parse=TRUE, color='red') +
    geom_text(data=gdat, aes(x=0,y=0.8, label=paste0("Iter == ", Iter)), parse=TRUE, hjust=0) +
    geom_text(data=gdat, aes(x=-0,y=1, label=paste0("x[1] == ", round(x1,3))), parse=TRUE, hjust=0) +
    transition_manual(Iter)
ga=animate(g2, fps = 20, duration = 6)
anim_save('NMAnim2.gif', animation=ga, path='../tut/glm_part1_files')


## ----NManim2, results='markdown', eval=FALSE, echo=FALSE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
## #Code that works if we have a formula
## f = function(x1,x2,x3,x4) {(x1 + 10*x2)^2 + 5*(x3-x4)^2 + (x2-2*x3)^4 + 10*(x1-x4)^4}
## x0 = list(x1=3,x2=-1,x3=0,x4=1)
## xs = c('x1','x2','x3','x4')
## xsg = expand.grid(xs,xs)
## 
## iter <- 0; not.converged <- 1; not.max.iter <- 1
## while (not.converged & not.max.iter) {
##     a=apply(as.matrix(xs), 1, function(x) D(body(f)[[2]], x[1]))
##     g=do.call('c',lapply(a, eval, x0))
## 
##     a=apply(as.matrix(xsg), 1, function(x) D(D(body(f)[[2]], x[1]),x[2]))
##     F=lapply(a,function(x) as.numeric(eval(x, x0)))
##     F=do.call('c',F)
##     F=matrix(F, nrow=length(xs))
##     F_inv=solve(F)
##     x1=as.list(unlist(x0) - F_inv %*% (g))
##     f._x=do.call('f',x1)
##     iter <- iter + 1
##     not.max.iter <- (iter < iter.max)*1
##     not.converged=(f._x>abs.tol)*1
##     x0=x1
##     names(x0) = xs
## }


## ----NManim3, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
params.init=c(mu=20, sigma=12)

## The following function calculates the difference-quotient approximation of gradient
approx.grad = function(theta, fn, eps=1e-05) {
    p = length(theta)
    nf = length(fn(theta))
    eps.mat = diag(p) * (eps/2)
    Gmat = array(0, dim=c(nf,p))
    for (i in 1:p) {
        Gmat[,i] = (fn(theta + eps.mat[,i]) - fn(theta - eps.mat[,i]))/eps
    }
    if (nf>1) Gmat else c(Gmat)
}


optim.NR = function(params.init, fn, x, iter.max=250, abs.tol=1e-05, control=list(eps=1e-06)) {
    fnc = function(bb) t(approx.grad(bb, fn))
    eps = control$eps
    gradfn = function(x) approx.grad(x, fnc, eps)
    iter <- 0; not.converged <- 1; not.max.iter <- 1
    newpar = params.init
    oldpar = params.init - 1
    while (not.converged & not.max.iter) {
        oldpar = newpar
        newpar = oldpar - solve(gradfn(oldpar), t(fnc(oldpar)))
        iter = iter + 1
        not.max.iter <- (iter < iter.max)*1
        not.converged = (abs(fn(oldpar) - fn(newpar))>abs.tol)*1
    }
    list(iter=iter, final=as.vector(newpar), LL=fn(as.vector(newpar)), gradient = fnc(newpar), hessian = gradfn(newpar))
}


#optim.NR(params.init, fn=function(t) LL.gaus(t, x=y), iter.max=1)

mu = seq(15,040,len=100)
sigma=seq(10,20,len=100)
theta = expand.grid(mu=mu, sigma=sigma)
theta$LL=apply(theta, 1, LL.gaus, x=dat$y)

base.plot = ggplot(data=theta,aes(y=mu, x=sigma)) +
    geom_tile(aes(fill=LL), show.legend=FALSE) + geom_contour(aes(z=LL)) +
    scale_fill_gradientn(colors=terrain.colors(12)) +
    scale_x_continuous(expand=c(0,0)) +
    scale_y_continuous(expand=c(0,0))

newdata =vector('list', 10)
newdata[[1]] =data.frame(t(setNames(params.init, c('mu','sigma'))))
p.i = params.init
for (i in 2:10) {
    a=optim.NR(params.init=p.i, fn=function(t) LL.gaus(t, x=dat$y), iter.max=1)
    newdata[[i]] = data.frame(t(setNames(a$final,c('mu','sigma'))))
    p.i = as.vector(a$final)
}
newdata = bind_rows(newdata, .id='Iter') %>% mutate(Iter=factor(Iter, levels=unique(Iter)), nIter=as.numeric(Iter))
g=base.plot + 
    geom_point(data=newdata, aes(y=mu, x=sigma, group=Iter), color='black') +
    geom_path(data=newdata, aes(y=mu, x=sigma), color='black') +
    transition_reveal(nIter) +
    labs(title = "Iteration: {frame_along}")
ga=animate(g, nframes=10, fps=1)

anim_save('NMAnim3.gif', animation=ga, path='../tut/glm_part1_files')


## ----NManim4, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
optim.NR(params.init, fn=function(t) LL.gaus(t, x=dat$y))


## ----NManim5, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
H=optim.NR(params.init, fn=function(t) LL.gaus(t, x=dat$y))$hessian
sqrt(diag(solve(H)))


## ----NManim6, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
nlm(LL.gaus, params.init, x=dat$y, hessian=TRUE, gradtol=1e-03)
H=nlm(LL.gaus, params.init, x=dat$y, hessian=TRUE, gradtol=1e-06*2)$hessian
sqrt(diag(solve(H)))


## ----SANN, results='markdown', eval=TRUE--------------------------------------
optim.SANN = function(params.init, fn, iter.max=2500, jump=0.05, k=100) {
    bestpar <- newpar <- oldpar <- params.init
    iter=0; not.max.iter <- 1
    inck=k/10
    while(not.max.iter) {
        ## jump to new parameter set
        newpar = oldpar + replicate(length(params.init), runif(1,-jump,jump))
        deltaL = fn(newpar)-fn(oldpar)
        if (deltaL<0) { #improvement
            oldpar=newpar
        } else {
            rnd = runif(1)
            if (rnd <= exp(-deltaL/k)) oldpar=newpar
        }
        if (fn(newpar)<fn(bestpar)) bestpar=newpar
        iter=iter+1
        if ((iter %% inck)==0) k = k/10
        not.max.iter = (iter < iter.max)*1
    }
    list(iter=iter, final=as.vector(bestpar), LL=fn(bestpar), last=as.vector(oldpar), LL=fn(bestpar))
}
#optim.SANN(params.init=c(-0.25,1), fn=function(p) LL.gaus(p, x=y), iter.max=2500)


## ----SANNanim1, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
p.i = params.init
iter.cnt = 1
iters = 2500
newdata =vector('list', iters)
bestpar = p.i
for (i in 1:iters) {
    a=optim.SANN(params.init=p.i, fn=function(t) LL.gaus(t, x=dat$y), iter.max=1, jump=0.5, k=0.1)
    if (LL.gaus(a$last, x=dat$y)<LL.gaus(bestpar, x=dat$y)) bestpar=a$last
    newdata[[i]] = data.frame(t(setNames(a$last,c('mu','sigma'))), iter=floor(log2(i))+1, t(setNames(bestpar,c('bestmu','bestsigma'))))
    p.i = as.vector(a$last)
}
newdata = bind_rows(newdata, .id='Iter') %>% mutate(iter=factor(iter, levels=unique(iter)), nIter=as.numeric(as.character(iter)))
g=base.plot + 
    geom_point(data=newdata, aes(y=mu, x=sigma, group=iter), color='black') +
    geom_path(data=newdata, aes(y=mu, x=sigma), color='black') +
    geom_point(data=newdata, aes(y=bestmu, x=bestsigma), color='red') + 
    transition_reveal(nIter) +
    labs(title = "Iteration: {2^frame_along}")
ga=animate(g, nframes=12, fps=1)
#ga
anim_save('SANNAnim1.gif', animation=ga, path='../tut/glm_part1_files')


## ----SANNoptim, results='markdown', eval=TRUE, cache=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=4----
optim.SANN(params.init=c(20,12), fn=function(t) LL.gaus(t, x=dat$y), iter.max=2500, jump=0.5, k=0.1)


## ----ex2, results='markdown', eval=TRUE---------------------------------------
dat


## ----LL1, results='markdown', eval=TRUE---------------------------------------
LL.gaus <- function(theta, y, X){
  k           <- ncol(X) # get the number of columns (independent vars)
  beta        <- theta[1:k] # vector of weights intialized with starting values
  mu          <- X %*% beta  # X is dimension (n x k) and beta is dimension (k x 1)
  sigma       <- theta[k+1] # should be pulled from the last of the starting values vector
  ll          <- sum(dnorm(y, mean = mu, sd = sigma, log = TRUE)) # sum of the PDF over each observation
  return(-ll)
}


## ----modelMatrix, results='markdown', eval=TRUE-------------------------------
X = model.matrix(~x, data=dat)


## ----simplexGLM, results='markdown', eval=TRUE--------------------------------
optim(c(1,1,1), LL.gaus, y=dat$y, X=X, method='Nelder-Mead')
optim(c(277,1,100), LL.gaus, y=dat$y, X=X, method='Nelder-Mead')


## ----NRGLM, results='markdown', eval=TRUE, warning=FALSE----------------------
nlm(LL.gaus, c(1,1,1), y=dat$y, X=X, hessian=TRUE)
nlm(LL.gaus, c(277,1,100), y=dat$y, X=X, hessian=TRUE)


## ----SANNGLM, results='markdown', eval=TRUE-----------------------------------
optim(c(1,1,1), LL.gaus, y=dat$y, X=X, method='SANN')
optim(c(277,1,100), LL.gaus, y=dat$y, X=X, method='SANN')


## ----optim.IRLS, results='markdown', eval=TRUE--------------------------------
optim.IRLS = function(X, y, family, iter.max=25, abs.tol=1e-06) {
    oldpar <- newpar <- rep(0, ncol(X))
    iter <- 0; not.converged <- 1; not.max.iter <- 1
    while (not.converged & not.max.iter) {
        eta = X %*% newpar         # calculate (update) the linear predictor
        g = family()$linkinv(eta)  # calculate (update) the linear predictor on the natural scale (inverse link)
        g. = family()$mu.eta(eta)  # calculate (update) the derivative of linear predictor on natural scale
        z = eta + (y - g) / g.     # calculate (update) the  adjusted response
        W = as.vector(g.^2 / family()$variance(g))  # calculate (update) the weights
        oldpar = newpar
        newpar = solve(crossprod(X,W*X), crossprod(X,W*z), tol=2*.Machine$double.eps)
        iter = iter + 1
        not.max.iter <- (iter < iter.max)*1
        not.converged=(max(abs((1-newpar/oldpar)))>abs.tol)*1
    }
    list(B.optim=newpar, Iter=iter-1)
}


## ----optim.IRLS.fit1, results='markdown', eval=TRUE---------------------------
optim.IRLS(cbind(rep(1,length(dat$y))), dat$y, family=gaussian)


## ----optim.IRLS.fit2, results='markdown', eval=TRUE---------------------------
optim.IRLS(cbind(rep(1,length(dat2$y))), dat2$y, family=poisson)
exp(optim.IRLS(cbind(rep(1,length(dat2$y))), dat2$y, family=poisson)$B.optim)


## ----optim.IRLS.fit3, results='markdown', eval=TRUE---------------------------
glm(y ~ 1, data=dat2, family=poisson)


## ----optim.IRLS.fit4, results='markdown', eval=TRUE---------------------------
X = model.matrix(~x, dat2)
irls = optim.IRLS(X, dat2$y, family=poisson)
irls
exp(irls$B.optim)


## ----optim.IRLS.fit5, results='markdown', eval=TRUE---------------------------
glm(y ~ x, data=dat2, family=poisson)

