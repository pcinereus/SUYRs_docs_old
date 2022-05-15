## ----setup, include=FALSE,warning=FALSE, message=FALSE------------------------
knitr::opts_chunk$set(echo = TRUE,warning=FALSE, message=FALSE, cache = TRUE, comment = "")
options(tinytex.engine = 'xelatex')
cleanRmdInput <- function(x) {
#x <- gsub("```\\{r","```markdown\n`r ''```\\{r",x)
x <- gsub("^```$","`` `",x)  # the Makefile will then change this back to ``` after pandoc
x
}
library(tidyverse)
library(pander)
FIG_PATH <- 'data_manipulations/figure-html/'


## ----makeData, echo=FALSE-----------------------------------------------------
## dat.1
set.seed(1)
dat.1 <- expand.grid(Time = 1:4, Dose=c("H", "M", "L"), Plot = paste0("P", 1:4)) %>%
    mutate(Dose = factor(as.character(Dose)),
           Treatment = gl(2, 24, 48, lab=c("Control", "Exclusion")),
           ## Time=rep(1:4, 3),
           M1 = ifelse(Treatment == "Control", 1, 2),
           M2 = ifelse(Dose == "H", 1, ifelse(Dose == "M", 2, 3)),
           Resp1 = round(rnorm(n(), (10 * M1) * M2 * Time, 3), 2),
           Resp2 = round(rnorm(n(), (rnorm(n(), 10, 5) * M1) * M2 * Time, 5), 2)) %>%
    dplyr::select(Treatment, Plot, Dose, Time, Resp1, Resp2)

## tikus    
data(tikus,package='mvabund')
tikus <- cbind(tikus$x,tikus$abund)

## data.w
set.seed(1)
data.w <- expand.grid(Plot = paste("P", 1:4, sep = "")) %>%
    mutate(Between = gl(2, 2, 4, lab = paste("A", 1:2, sep = ""))) %>%
    cbind(matrix(rpois(12, 10),
                 ncol = 3,
                 dimnames = list(paste("R", 1:4, sep = ""),
                                 paste("Time", 0:2, sep = "."))))

##data
set.seed(1)
data <- expand.grid(Within = paste("B", 1:2, sep = ""),
                    Subplot = paste("S", 1:2, sep = ""),
                    Plot = paste("P", 1:6, sep = "")) %>%
    mutate(Subplot = gl(12, 2, 24,lab = paste("S", 1:12, sep = "")),
           Between = gl(3, 4, 24, lab = paste("A", 1:3, sep="")),
           Resp1 = rpois(24, 10),
           Resp2 = rpois(24, 20)) %>%
    dplyr::select(Resp1, Resp2, Between, Plot, Subplot, Within)

## data.d
set.seed(1)
data.d = data.frame(Date=sample(seq(as.Date('2008-01-01'),
                                    as.Date('2009-12-31'),
                                    by='day'), size=10),
                    Resp1=rnbinom(10,5,mu=30) * as.numeric(replicate(5,rbinom(2,1,0.8)))) %>%
    separate(Date,into=c('year','month','day'))

## data.c
data.c <- data.frame(Year=paste0(sample(c('M','F'),10,replace=TRUE),rpois(10,30)),
                     Resp1=rnbinom(10,5,mu=30) * as.numeric(replicate(5,rbinom(2,1,0.8))))

## data.bio
set.seed(1)
data.bio <- expand.grid(Subplot = paste("S", 1:2, sep = ""),
                        Plot = paste("P", 1:6, sep = "")) %>%
    mutate(Subplot = gl(12, 1, 12, lab = paste("S", 1:12, sep = "")),
           Between =  gl(3, 4, 12, lab = paste("A", 1:3, sep = "")),
           Resp1 = rpois(12, 10),
           Resp2 = rpois(12, 20)) %>%
    select(Resp1, Resp2, Between, Plot, Subplot) %>%
    slice(-3)

## data.chem
set.seed(1)
data.chem <- expand.grid(Subplot = paste("S", 1:2, sep = ""),
                         Plot = paste("P", 1:6, sep = "")) %>%
    mutate(Subplot = gl(12, 1, 12, lab = paste("S", 1:12, sep="")),
           Between = gl(3, 4, 12, lab = paste("A", 1:3, sep = "")),
           Chem1 = rlnorm(12, 1),
           Chem2 = rlnorm(12, 0.5)) %>%
    select(Chem1, Chem2, Between, Plot, Subplot) %>%
    slice(-7)

## data.geo
set.seed(1)
data.geo <- expand.grid(Plot = paste("P", 1:6, sep = "")) %>%
    mutate(LAT = c(17.9605, 17.5210, 17.0011, 18.235, 18.9840, 20.1154),
           LONG = c(145.4326, 146.1983, 146.3839, 146.7934, 146.0345, 146.4672))

## nasa
nasa = as.data.frame(GGally::nasa)


## ----saveData, results='markdown', eval=TRUE, echo=FALSE----------------------
if (!dir.exists('../docs/data')) dir.create('../docs/data')
save(
    dat.1,
    data,
    data.d,
    data.c,
    data.bio,
    data.chem,
    data.geo,
    data.w,
    nasa,
    tikus,
    file = "../docs/data/manipulationDatasets.RData")

dump(c('dat.1',
       'tikus',
       'data.w',
       'data',
       'data.d',
       'data.c',
       'data.bio',
       'data.chem',
       'data.geo',
       'nasa'
       ),
     file='../docs/data/manipulationDatasets.R')



## \usetikzlibrary{matrix,positioning,calc}

## 
## \tikzstyle{Title} = [font={\fontspec[Scale=2,  ExternalLocation=../resources/]{Complete in Him.ttf}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{code} = [font={\fontspec[Scale=2]{Inconsolata}}]

## 
## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 1/.style={

##             nodes={text width=4em,font=\bfseries}

##         },

##         column 2/.style={

##             nodes={text width=4em}

##         },

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## Var1&Var2&Var3\\

## &  & \\

## &  & \\

## &  & \\

## &  & \\

## };

## 
## \draw[latex-latex,line width=5pt] (first-2-1.north) --(first-5-1.south);

## \draw[latex-latex,line width=5pt] (first-2-2.north) --(first-5-2.south);

## \draw[latex-latex,line width=5pt] (first-2-3.north) --(first-5-3.south);

## 
## \matrix (second) [right=2cm of first,anchor=west,table,text width=4em]{

## Var1&Var2&Var3\\

## &  & \\

## &  & \\

## &  & \\

## &  & \\

## };

## \draw[latex-latex,line width=5pt] (second-2-1.west) --(second-2-3.east);

## \draw[latex-latex,line width=5pt] (second-3-1.west) --(second-3-3.east);

## \draw[latex-latex,line width=5pt] (second-4-1.west) --(second-4-3.east);

## \draw[latex-latex,line width=5pt] (second-5-1.west) --(second-5-3.east);

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (Variables)  {Variables in Columns};

## \node [Title,above=0.75cm of second.north,anchor=north] (Observations)  {Observations in Rows};

## 
## \end{tikzpicture}


## ----GetData, eval = FALSE----------------------------------------------------
## source("https://github.com/pcinereus/SUYRs_docs/raw/main/data/manipulationDatasets.R")
## ##OR
## load(url("https://github.com/pcinereus/SUYRs_docs/raw/main/data/manipulationDatasets.RData"))


## ----GetLocalData, eval = FALSE-----------------------------------------------
## source(file="data/manipulationDatasets.R")
## ##OR
## load(file = "data/manipulationDatasets.RData")


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{Messy} = [decorate,decoration={random steps,segment length=3pt, amplitude=0.3pt},thick]

## 
## \begin{tikzpicture}

## \coordinate (A) at (0,0);

## 
## \begin{scope}[local bounding box=P1a,anchor=north west, shift=(A),on background layer]

## \node [draw, minimum width=1cm, minimum height=1cm, Title, Messy] (P1D1) {H};

## \node [draw, minimum width=1cm, minimum height=1cm, anchor=north west, Title, Messy] at ($(P1D1.south east) +(0.2,0)$) (P1D2) {M};

## \node [draw, minimum width=1cm, minimum height=1cm, anchor=south west, Title, Messy] at ($(P1D2.north east) +(0.2,0)$) (P1D3) {L};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1D1) (P1D2) (P1D3)}, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick] (P1) {};

## \draw [Messy, thick] (P1.north west) -- (P1.south west) -- (P1.south east) -- (P1.north east) -- cycle;

## \node [Title, anchor = south] at (P1.north) {P3};

## \end{scope}

## 
## \begin{scope}[anchor=north, shift=(P1D3.south), yshift=-1.5cm, xshift=-2.5cm]

## \node [draw, Title, Messy] (T1) {T1};

## \node [draw, anchor=north west, xshift=0.15cm, Title, Messy] at (T1.north east) (T2) {T2};

## \node [draw, anchor=north west, xshift=0.15cm, Title, Messy] at (T2.north east) (T3) {T3};

## \node [draw, anchor=north west, xshift=0.15cm, Title, Messy] at (T3.north east) (T4) {T4};

## \draw [latex-,Messy] (T1) -- (P1D2);

## \draw [latex-,Messy] (T2) -- (P1D2);

## \draw [latex-,Messy] (T3) -- (P1D2);

## \draw [latex-,Messy] (T4) -- (P1D2);

## \draw [Messy] (T1.south) -- ($(T1.south) +(0,-1)$);

## \draw ($(T1.south) +(0,-0.5)$) -- ($(T1.south) +(0.5,-0.5)$) node [anchor=west, code]{Resp1};

## \draw ($(T1.south) +(0,-1)$) -- ($(T1.south) +(0.5,-1)$) node [anchor=west, code]{Resp2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P2a, anchor=north west, shift=(P1a.north east), xshift=1cm]

## \node [draw, minimum width=1cm, minimum height=1cm, Title, Messy] (P2D1) {L};

## \node [draw, minimum width=1cm, minimum height=1cm, anchor=north west, Title, Messy] at ($(P2D1.south east) + (0.2,0)$) (P2D2) {H};

## \node [draw, minimum width=1cm, minimum height=1cm, anchor=south west, Title, Messy] at ($(P2D2.north east) + (0.2,0)$) (P2D3) {M};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2D1) (P2D2) (P2D3)}, draw, thick, Messy]  (P2) {};

## \node [Title, anchor = south] at (P2.north) {P1};

## \end{scope}

## 
## \begin{scope}[local bounding box=P3a, anchor=north west, shift=(P2a.north east), xshift=1cm]

## \node [draw, minimum width=1cm, minimum height=1cm, Title, Messy] (P3D1) {M};

## \node [draw, minimum width=1cm, minimum height=1cm, Title, anchor=north west, Messy] at ($(P3D1.south east) + (0.2,0)$) (P3D2) {H};

## \node [draw, minimum width=1cm, minimum height=1cm, Title, anchor=south west, Messy] at ($(P3D2.north east) + (0.2,0)$) (P3D3) {L};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3D1) (P3D2) (P3D3)}, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick]  (P3) {};

## \draw [Messy, thick] (P3.north west) -- (P3.south west) -- (P3.south east) -- (P3.north east) -- cycle;

## \node [Title, anchor = south] at (P3.north) {P4};

## \end{scope}

## 	

## \begin{scope}[local bounding box=P4a, anchor=north west, shift=(P3a.north east), xshift=1cm]

## \node [draw, minimum width=1cm, minimum height=1cm, Title, Messy] (P4D1) {L};

## \node [draw, minimum width=1cm, minimum height=1cm, Title, anchor=north west, Messy] at ($(P4D1.south east) +(0.2,0)$) (P4D2) {M};

## \node [draw, minimum width=1cm, minimum height=1cm, Title, anchor= west, Messy] at ($(P4D2.north east) +(0.2,0)$) (P4D3) {H};

## \end{scope}

## \node [fit={(P4D1) (P4D2) (P4D3)}, draw, Messy, thick]  (P4) {};

## \node [Title, anchor = south] at (P4.north) {P2};

## \end{tikzpicture}


## ----dat.1, echo=FALSE, results = 'asis'--------------------------------------
knitr::kable(dat.1, table.attr = "class=\"plainTable\"", format='html')


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{Messy} = [decorate,decoration={random steps,segment length=3pt, amplitude=0.3pt},thick]

## 
## \begin{tikzpicture}

## \coordinate (A) at (0,0);

## 
## \begin{scope}[local bounding box=P1a,anchor=north west, shift=(A),on background layer]

## \node [minimum width=1cm, minimum height=1cm, Title, Messy] (P1D1) {};

## \node [ minimum width=1cm, minimum height=1cm, anchor=north west, Title, Messy] at ($(P1D1.south east) +(0.2,0)$) (P1D2) {};

## \node [minimum width=1cm, minimum height=1cm, anchor=south west, Title, Messy] at ($(P1D2.north east) +(0.2,0)$) (P1D3) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1D1) (P1D2) (P1D3)}, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick] (P1) {};

## \draw [Messy, thick] (P1.north west) -- (P1.south west) -- (P1.south east) -- (P1.north east) -- cycle;

## \node [Title, anchor = south] at (P1.north) {P1};

## \end{scope}

## 
## \begin{scope}[anchor=north, shift=(P1D3.south), yshift=-2cm, xshift=-3cm]

## \node [draw, Title, Messy] (T1) {Time.0};

## \node [draw, anchor=north west, xshift=0.15cm, Title, Messy] at (T1.north east) (T2) {Time.1};

## \node [draw, anchor=north west, xshift=0.15cm, Title, Messy] at (T2.north east) (T3) {Time.2};

## \draw [latex-,Messy] (T1) -- (P1);

## \draw [latex-,Messy] (T2) -- (P1);

## \draw [latex-,Messy] (T3) -- (P1);

## \draw [Messy] (T1.south) -- ($(T1.south) +(0,-0.5)$);

## \draw ($(T1.south) +(0,-0.5)$) -- ($(T1.south) +(0.5,-0.5)$) node [anchor=west, code]{Count};

## \end{scope}

## 
## \begin{scope}[local bounding box=P2a, anchor=north west, shift=(P1a.north east), xshift=1cm]

## \node [minimum width=1cm, minimum height=1cm, Title, Messy] (P2D1) {};

## \node [minimum width=1cm, minimum height=1cm, anchor=north west, Title, Messy] at ($(P2D1.south east) + (0.2,0)$) (P2D2) {};

## \node [minimum width=1cm, minimum height=1cm, anchor=south west, Title, Messy] at ($(P2D2.north east) + (0.2,0)$) (P2D3) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2D1) (P2D2) (P2D3)}, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick]  (P2) {};

## \draw [Messy, thick] (P2.north west) -- (P2.south west) -- (P2.south east) -- (P2.north east) -- cycle;

## \node [Title, anchor = south] at (P2.north) {P2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P3a, anchor=north west, shift=(P2a.north east), xshift=1cm]

## \node [minimum width=1cm, minimum height=1cm, Title, Messy] (P3D1) {};

## \node [minimum width=1cm, minimum height=1cm, Title, anchor=north west, Messy] at ($(P3D1.south east) + (0.2,0)$) (P3D2) {};

## \node [minimum width=1cm, minimum height=1cm, Title, anchor=south west, Messy] at ($(P3D2.north east) + (0.2,0)$) (P3D3) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3D1) (P3D2) (P3D3)}, draw, Messy, thick]  (P3) {};

## \draw [Messy, thick] (P3.north west) -- (P3.south west) -- (P3.south east) -- (P3.north east) -- cycle;

## \node [Title, anchor = south] at (P3.north) {P3};

## \end{scope}

## 	

## \begin{scope}[local bounding box=P4a, anchor=north west, shift=(P3a.north east), xshift=1cm]

## \node [minimum width=1cm, minimum height=1cm, Title, Messy] (P4D1) {};

## \node [minimum width=1cm, minimum height=1cm, Title, anchor=north west, Messy] at ($(P4D1.south east) +(0.2,0)$) (P4D2) {};

## \node [minimum width=1cm, minimum height=1cm, Title, anchor= west, Messy] at ($(P4D2.north east) +(0.2,0)$) (P4D3) {};

## \end{scope}

## \node [fit={(P4D1) (P4D2) (P4D3)}, draw, Messy, thick]  (P4) {};

## \node [Title, anchor = south] at (P4.north) {P4};

## \end{tikzpicture}


## ----data.w, echo=FALSE, results = 'asis'-------------------------------------
knitr::kable(data.w, table.attr = "class=\"plainTable\"", format='html')


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{Messy} = [decorate,decoration={random steps,segment length=3pt, amplitude=0.3pt},thick]

## 
## \begin{tikzpicture}

## \coordinate (A) at (0,0);

## \begin{scope}[local bounding box=P1a,anchor=north west, shift=(A),on background layer]

## \node [draw, minimum width=2cm, minimum height=2cm, Title, Messy, fill=orange, opacity=0.7] (P1S1B1) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north east) +(0.2,0)$) (P1S1B2) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north west) +(0,2.-5.5)$) (P1S2B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, fill=orange,opacity=0.7,Title, Messy] at ($(P1S2B1.north east) +(0.2,0)$) (P1S2B2) {B1};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1B1) (P1S1B2) +(0,1)}, draw, Messy, thick, Title, text height=0.5cm] (P1S1) {S1};

## \node [fit={(P1S2B1) ($(P1S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P1S2) {S2};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1) (P1S2) }, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick] (P1) {};

## \draw [Messy, thick] (P1.north west) -- (P1.south west) -- (P1.south east) -- (P1.north east) -- cycle;

## \node [Title, anchor = south] at (P1.north) {P1};

## \end{scope}

## 
## \begin{scope}[anchor=north, shift=(P1S2.south), yshift=-1.5cm, xshift=-2.5cm]

## \draw [Messy] (P1S2B1.south) -- ($(P1S2B1.south) +(0,-1.5)$);

## \draw ($(P1S2B1.south) +(0,-1)$) -- ($(P1S2B1.south) +(0.5,-1)$) node [anchor=west, code]{Resp1};

## \draw ($(P1S2B1.south) +(0,-1.5)$) -- ($(P1S2B1.south) +(0.5,-1.5)$) node [anchor=west, code]{Resp2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P2a,anchor=north west, shift=(P1a.north east),xshift =1cm, on background layer]

## \node [draw, minimum width=2cm, minimum height=2cm, Title, Messy, fill=orange, opacity=0.7] (P2S1B1) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S1B1.north east) +(0.2,0)$) (P2S1B2) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west,fill=orange,opacity=0.7, Title, Messy] at ($(P2S1B1.north west) +(0,2.-5.5)$) (P2S2B1) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S2B1.north east) +(0.2,0)$) (P2S2B2) {B2};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1B1) ($(P2S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P2S1) {S4};

## \node [fit={(P2S2B1) ($(P2S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P2S2) {S3};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1) (P2S2) }, draw,  Messy, thick] (P2) {};

## \draw [Messy, thick] (P2.north west) -- (P2.south west) -- (P2.south east) -- (P2.north east) -- cycle;

## \node [Title, anchor = south] at (P2.north) {P2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P3a,anchor=north west, shift=(P2a.north east),xshift =1cm, on background layer]

## \node [draw, minimum width=2cm, minimum height=2cm, Title, Messy] (P3S1B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy, fill=orange, opacity=0.7] at ($(P3S1B1.north east) +(0.2,0)$) (P3S1B2) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west,fill=orange,opacity=0.7, Title, Messy] at ($(P3S1B1.north west) +(0,2.-5.5)$) (P3S2B1) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S2B1.north east) +(0.2,0)$) (P3S2B2) {B2};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1B1) ($(P3S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P3S1) {S5};

## \node [fit={(P3S2B1) ($(P3S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P3S2) {S6};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1) (P3S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P3) {};

## \draw [Messy, thick] (P3.north west) -- (P3.south west) -- (P3.south east) -- (P3.north east) -- cycle;

## \node [Title, anchor = south] at (P3.north) {P3};

## \end{scope}

## 
## \begin{scope}[local bounding box=P4a,anchor=north west, shift=(P3a.north east),xshift =1cm, on background layer]

## \node [draw, minimum width=2cm, minimum height=2cm, Title, Messy] (P4S1B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy, fill=orange, opacity=0.7] at ($(P4S1B1.north east) +(0.2,0)$) (P4S1B2) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P4S1B1.north west) +(0,2.-5.5)$) (P4S2B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, fill=orange,opacity=0.7, Title, Messy] at ($(P4S2B1.north east) +(0.2,0)$) (P4S2B2) {B1};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1B1) ($(P4S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P4S1) {S8};

## \node [fit={(P4S2B1) ($(P4S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P4S2) {S7};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1) (P4S2) }, draw,  pattern=grid, pattern color=blue, opacity=0.2,Messy, thick] (P4) {};

## \draw [Messy, thick] (P4.north west) -- (P4.south west) -- (P4.south east) -- (P4.north east) -- cycle;

## \node [Title, anchor = south] at (P4.north) {P4};

## \end{scope}

## 
## \begin{scope}[local bounding box=P5a,anchor=north west, shift=(P4a.north east),xshift =1cm, on background layer]

## \node [draw, minimum width=2cm, minimum height=2cm, Title, Messy, fill=orange, opacity=0.7] (P5S1B1) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P5S1B1.north east) +(0.2,0)$) (P5S1B2) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S1B1.north west) +(0,2.-5.5)$) (P5S2B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west,fill=orange,opacity=0.7,  Title, Messy] at ($(P5S2B1.north east) +(0.2,0)$) (P5S2B2) {B1};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1B1) ($(P5S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P5S1) {S9};

## \node [fit={(P5S2B1) ($(P5S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P5S2) {S10};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1) (P5S2) }, draw,  Messy, thick] (P5) {};

## \draw [Messy, thick] (P5.north west) -- (P5.south west) -- (P5.south east) -- (P5.north east) -- cycle;

## \node [Title, anchor = south] at (P5.north) {P5};

## \end{scope}

## 
## \begin{scope}[local bounding box=P6a,anchor=north west, shift=(P5a.north east),xshift =1cm, on background layer]

## \node [draw, minimum width=2cm, minimum height=2cm, Title, Messy] (P6S1B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy, fill=orange, opacity=0.7] at ($(P6S1B1.north east) +(0.2,0)$) (P6S1B2) {B1};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P6S1B1.north west) +(0,2.-5.5)$) (P6S2B1) {B2};

## \node [draw, minimum width=2cm, minimum height=2cm, anchor=north west, fill=orange,opacity=0.7, Title, Messy] at ($(P6S2B1.north east) +(0.2,0)$) (P6S2B2) {B1};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1B1) ($(P6S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P6S1) {S5};

## \node [fit={(P6S2B1) ($(P6S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P6S2) {S6};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1) (P6S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P6) {};

## \draw [Messy, thick] (P6.north west) -- (P6.south west) -- (P6.south east) -- (P6.north east) -- cycle;

## \node [Title, anchor = south] at (P6.north) {P6};

## \end{scope}

## \end{tikzpicture}


## ----data, echo=FALSE, results = 'asis'---------------------------------------
knitr::kable(data, table.attr = "class=\"plainTable\"", format='html')


## ----data.d, echo=FALSE, results = 'asis'-------------------------------------
knitr::kable(data.d, table.attr = "class=\"plainTable\"", format='html')


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{Messy} = [decorate,decoration={random steps,segment length=3pt, amplitude=0.3pt},thick]

## 
## \begin{tikzpicture}

## \coordinate (A) at (0,0);

## 
## \begin{scope}[local bounding box=P1a,anchor=north west, shift=(A),on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P1S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north east) +(0.2,0)$) (P1S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north west) +(0,2.-5.5)$) (P1S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S2B1.north east) +(0.2,0)$) (P1S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1B1) (P1S1B2) +(0,1)}, draw, Messy, thick, Title, text height=0.5cm] (P1S1) {S1};

## \node [fit={(P1S2B1) ($(P1S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P1S2) {S2};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1) (P1S2) }, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick] (P1) {};

## \draw [Messy, thick] (P1.north west) -- (P1.south west) -- (P1.south east) -- (P1.north east) -- cycle;

## \node [Title, anchor = south] at (P1.north) {P1};

## \end{scope}

## 
## \begin{scope}[anchor=north, shift=(P1S2.south), yshift=-1.5cm, xshift=-2.5cm]

## \draw [Messy] (P1S2B1.south) -- ($(P1S2B1.south) +(0,-1.5)$);

## \draw ($(P1S2B1.south) +(0,-1)$) -- ($(P1S2B1.south) +(0.5,-1)$) node [anchor=west, code]{Resp1};

## \draw ($(P1S2B1.south) +(0,-1.5)$) -- ($(P1S2B1.south) +(0.5,-1.5)$) node [anchor=west, code]{Resp2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P2a,anchor=north west, shift=(P1a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P2S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S1B1.north east) +(0.2,0)$) (P2S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P2S1B1.north west) +(0,2.-5.5)$) (P2S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S2B1.north east) +(0.2,0)$) (P2S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1B1) ($(P2S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P2S1) {S4};

## \node [fit={(P2S2B1) ($(P2S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P2S2) {S3};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1) (P2S2) }, draw,  Messy, thick] (P2) {};

## \draw [Messy, thick] (P2.north west) -- (P2.south west) -- (P2.south east) -- (P2.north east) -- cycle;

## \node [Title, anchor = south] at (P2.north) {P2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P3a,anchor=north west, shift=(P2a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P3S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S1B1.north east) +(0.2,0)$) (P3S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P3S1B1.north west) +(0,2.-5.5)$) (P3S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S2B1.north east) +(0.2,0)$) (P3S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1B1) ($(P3S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P3S1) {S5};

## \node [fit={(P3S2B1) ($(P3S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P3S2) {S6};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1) (P3S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P3) {};

## \draw [Messy, thick] (P3.north west) -- (P3.south west) -- (P3.south east) -- (P3.north east) -- cycle;

## \node [Title, anchor = south] at (P3.north) {P3};

## \end{scope}

## 
## \begin{scope}[local bounding box=P4a,anchor=north west, shift=(P3a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P4S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P4S1B1.north east) +(0.2,0)$) (P4S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P4S1B1.north west) +(0,2.-5.5)$) (P4S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P4S2B1.north east) +(0.2,0)$) (P4S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1B1) ($(P4S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P4S1) {S8};

## \node [fit={(P4S2B1) ($(P4S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P4S2) {S7};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1) (P4S2) }, draw,  pattern=grid, pattern color=blue, opacity=0.2,Messy, thick] (P4) {};

## \draw [Messy, thick] (P4.north west) -- (P4.south west) -- (P4.south east) -- (P4.north east) -- cycle;

## \node [Title, anchor = south] at (P4.north) {P4};

## \end{scope}

## 
## \begin{scope}[local bounding box=P5a,anchor=north west, shift=(P4a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P5S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P5S1B1.north east) +(0.2,0)$) (P5S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S1B1.north west) +(0,2.-5.5)$) (P5S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S2B1.north east) +(0.2,0)$) (P5S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1B1) ($(P5S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P5S1) {S9};

## \node [fit={(P5S2B1) ($(P5S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P5S2) {S10};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1) (P5S2) }, draw,  Messy, thick] (P5) {};

## \draw [Messy, thick] (P5.north west) -- (P5.south west) -- (P5.south east) -- (P5.north east) -- cycle;

## \node [Title, anchor = south] at (P5.north) {P5};

## \end{scope}

## 
## \begin{scope}[local bounding box=P6a,anchor=north west, shift=(P5a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P6S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P6S1B1.north east) +(0.2,0)$) (P6S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P6S1B1.north west) +(0,2.-5.5)$) (P6S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P6S2B1.north east) +(0.2,0)$) (P6S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1B1) ($(P6S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P6S1) {S5};

## \node [fit={(P6S2B1) ($(P6S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P6S2) {S6};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1) (P6S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P6) {};

## \draw [Messy, thick] (P6.north west) -- (P6.south west) -- (P6.south east) -- (P6.north east) -- cycle;

## \node [Title, anchor = south] at (P6.north) {P6};

## \end{scope}

## 
## \end{tikzpicture}


## ----data.bio, echo=FALSE, results = 'asis'-----------------------------------
knitr::kable(data.bio, table.attr = "class=\"plainTable\"", format='html')


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{Messy} = [decorate,decoration={random steps,segment length=3pt, amplitude=0.3pt},thick]

## 
## \begin{tikzpicture}

## \coordinate (A) at (0,0);

## 
## \begin{scope}[local bounding box=P1a,anchor=north west, shift=(A),on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P1S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north east) +(0.2,0)$) (P1S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north west) +(0,2.-5.5)$) (P1S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S2B1.north east) +(0.2,0)$) (P1S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1B1) (P1S1B2) +(0,1)}, draw, Messy, thick, Title, text height=0.5cm] (P1S1) {S1};

## \node [fit={(P1S2B1) ($(P1S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P1S2) {S2};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1) (P1S2) }, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick] (P1) {};

## \draw [Messy, thick] (P1.north west) -- (P1.south west) -- (P1.south east) -- (P1.north east) -- cycle;

## \node [Title, anchor = south] at (P1.north) {P1};

## \end{scope}

## 
## \begin{scope}[anchor=north, shift=(P1S2.south), yshift=-1.5cm, xshift=-2.5cm]

## \draw [Messy] (P1S2B1.south) -- ($(P1S2B1.south) +(0,-1.5)$);

## \draw ($(P1S2B1.south) +(0,-1)$) -- ($(P1S2B1.south) +(0.5,-1)$) node [anchor=west, code]{Chem1};

## \draw ($(P1S2B1.south) +(0,-1.5)$) -- ($(P1S2B1.south) +(0.5,-1.5)$) node [anchor=west, code]{Chem2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P2a,anchor=north west, shift=(P1a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P2S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S1B1.north east) +(0.2,0)$) (P2S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P2S1B1.north west) +(0,2.-5.5)$) (P2S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S2B1.north east) +(0.2,0)$) (P2S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1B1) ($(P2S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P2S1) {S4};

## \node [fit={(P2S2B1) ($(P2S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P2S2) {S3};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1) (P2S2) }, draw,  Messy, thick] (P2) {};

## \draw [Messy, thick] (P2.north west) -- (P2.south west) -- (P2.south east) -- (P2.north east) -- cycle;

## \node [Title, anchor = south] at (P2.north) {P2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P3a,anchor=north west, shift=(P2a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P3S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S1B1.north east) +(0.2,0)$) (P3S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P3S1B1.north west) +(0,2.-5.5)$) (P3S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S2B1.north east) +(0.2,0)$) (P3S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1B1) ($(P3S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P3S1) {S5};

## \node [fit={(P3S2B1) ($(P3S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P3S2) {S6};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1) (P3S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P3) {};

## \draw [Messy, thick] (P3.north west) -- (P3.south west) -- (P3.south east) -- (P3.north east) -- cycle;

## \node [Title, anchor = south] at (P3.north) {P3};

## \end{scope}

## 
## \begin{scope}[local bounding box=P4a,anchor=north west, shift=(P3a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P4S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P4S1B1.north east) +(0.2,0)$) (P4S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P4S1B1.north west) +(0,2.-5.5)$) (P4S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P4S2B1.north east) +(0.2,0)$) (P4S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1B1) ($(P4S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P4S1) {S8};

## \node [fit={(P4S2B1) ($(P4S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P4S2) {S7};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1) (P4S2) }, draw,  pattern=grid, pattern color=blue, opacity=0.2,Messy, thick] (P4) {};

## \draw [Messy, thick] (P4.north west) -- (P4.south west) -- (P4.south east) -- (P4.north east) -- cycle;

## \node [Title, anchor = south] at (P4.north) {P4};

## \end{scope}

## 
## \begin{scope}[local bounding box=P5a,anchor=north west, shift=(P4a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P5S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P5S1B1.north east) +(0.2,0)$) (P5S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S1B1.north west) +(0,2.-5.5)$) (P5S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S2B1.north east) +(0.2,0)$) (P5S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1B1) ($(P5S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P5S1) {S9};

## \node [fit={(P5S2B1) ($(P5S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P5S2) {S10};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1) (P5S2) }, draw,  Messy, thick] (P5) {};

## \draw [Messy, thick] (P5.north west) -- (P5.south west) -- (P5.south east) -- (P5.north east) -- cycle;

## \node [Title, anchor = south] at (P5.north) {P5};

## \end{scope}

## 
## \begin{scope}[local bounding box=P6a,anchor=north west, shift=(P5a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P6S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P6S1B1.north east) +(0.2,0)$) (P6S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P6S1B1.north west) +(0,2.-5.5)$) (P6S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P6S2B1.north east) +(0.2,0)$) (P6S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1B1) ($(P6S1B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P6S1) {S5};

## \node [fit={(P6S2B1) ($(P6S2B2) +(1,2)$)}, draw, Messy, thick, Title, text height=0.5cm] (P6S2) {S6};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1) (P6S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P6) {};

## \draw [Messy, thick] (P6.north west) -- (P6.south west) -- (P6.south east) -- (P6.north east) -- cycle;

## \node [Title, anchor = south] at (P6.north) {P6};

## \end{scope}

## 
## \end{tikzpicture}


## ----data.chem, echo=FALSE, results = 'asis'----------------------------------
knitr::kable(data.chem, table.attr = "class=\"plainTable\"", format='html')


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzstyle{Messy} = [decorate,decoration={random steps,segment length=3pt, amplitude=0.3pt},thick]

## 
## \begin{tikzpicture}

## \coordinate (A) at (0,0);

## 
## \begin{scope}[local bounding box=P1a,anchor=north west, shift=(A),on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P1S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north east) +(0.2,0)$) (P1S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S1B1.north west) +(0,2.-5.5)$) (P1S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P1S2B1.north east) +(0.2,0)$) (P1S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1B1) (P1S1B2) +(0,1)}, draw, thick, Title, text height=0.5cm] (P1S1) {};

## \node [fit={(P1S2B1) ($(P1S2B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P1S2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P1S1) (P1S2) }, draw, pattern = grid, pattern color=blue, opacity=0.2, Messy, thick] (P1) {};

## \draw [Messy, thick] (P1.north west) -- (P1.south west) -- (P1.south east) -- (P1.north east) -- cycle;

## \node [Title, anchor = south] at (P1.north) {P1};

## \end{scope}

## 
## \begin{scope}[anchor=north, shift=(P1S2.south), yshift=-1.5cm, xshift=-2.5cm]

## \draw [Messy] (P1S2B1.south) -- ($(P1S2B1.south) +(0,-1.5)$);

## \draw ($(P1S2B1.south) +(0,-1)$) -- ($(P1S2B1.south) +(0.5,-1)$) node [anchor=west, code]{LAT};

## \draw ($(P1S2B1.south) +(0,-1.5)$) -- ($(P1S2B1.south) +(0.5,-1.5)$) node [anchor=west, code]{LONG};

## \end{scope}

## 
## \begin{scope}[local bounding box=P2a,anchor=north west, shift=(P1a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P2S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S1B1.north east) +(0.2,0)$) (P2S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P2S1B1.north west) +(0,2.-5.5)$) (P2S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P2S2B1.north east) +(0.2,0)$) (P2S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1B1) ($(P2S1B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P2S1) {};

## \node [fit={(P2S2B1) ($(P2S2B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P2S2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P2S1) (P2S2) }, draw,  Messy, thick] (P2) {};

## \draw [Messy, thick] (P2.north west) -- (P2.south west) -- (P2.south east) -- (P2.north east) -- cycle;

## \node [Title, anchor = south] at (P2.north) {P2};

## \end{scope}

## 
## \begin{scope}[local bounding box=P3a,anchor=north west, shift=(P2a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P3S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S1B1.north east) +(0.2,0)$) (P3S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P3S1B1.north west) +(0,2.-5.5)$) (P3S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P3S2B1.north east) +(0.2,0)$) (P3S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1B1) ($(P3S1B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P3S1) {};

## \node [fit={(P3S2B1) ($(P3S2B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P3S2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P3S1) (P3S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P3) {};

## \draw [Messy, thick] (P3.north west) -- (P3.south west) -- (P3.south east) -- (P3.north east) -- cycle;

## \node [Title, anchor = south] at (P3.north) {P3};

## \end{scope}

## 
## \begin{scope}[local bounding box=P4a,anchor=north west, shift=(P3a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P4S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P4S1B1.north east) +(0.2,0)$) (P4S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P4S1B1.north west) +(0,2.-5.5)$) (P4S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P4S2B1.north east) +(0.2,0)$) (P4S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1B1) ($(P4S1B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P4S1) {};

## \node [fit={(P4S2B1) ($(P4S2B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P4S2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P4S1) (P4S2) }, draw,  pattern=grid, pattern color=blue, opacity=0.2,Messy, thick] (P4) {};

## \draw [Messy, thick] (P4.north west) -- (P4.south west) -- (P4.south east) -- (P4.north east) -- cycle;

## \node [Title, anchor = south] at (P4.north) {P4};

## \end{scope}

## 
## \begin{scope}[local bounding box=P5a,anchor=north west, shift=(P4a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P5S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P5S1B1.north east) +(0.2,0)$) (P5S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S1B1.north west) +(0,2.-5.5)$) (P5S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P5S2B1.north east) +(0.2,0)$) (P5S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1B1) ($(P5S1B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P5S1) {};

## \node [fit={(P5S2B1) ($(P5S2B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P5S2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P5S1) (P5S2) }, draw,  Messy, thick] (P5) {};

## \draw [Messy, thick] (P5.north west) -- (P5.south west) -- (P5.south east) -- (P5.north east) -- cycle;

## \node [Title, anchor = south] at (P5.north) {P5};

## \end{scope}

## 
## \begin{scope}[local bounding box=P6a,anchor=north west, shift=(P5a.north east),xshift =1cm, on background layer]

## \node [minimum width=2cm, minimum height=2cm, Title, Messy] (P6S1B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P6S1B1.north east) +(0.2,0)$) (P6S1B2) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west,Title, Messy] at ($(P6S1B1.north west) +(0,2.-5.5)$) (P6S2B1) {};

## \node [minimum width=2cm, minimum height=2cm, anchor=north west, Title, Messy] at ($(P6S2B1.north east) +(0.2,0)$) (P6S2B2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1B1) ($(P6S1B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P6S1) {};

## \node [fit={(P6S2B1) ($(P6S2B2) +(1,2)$)}, draw, thick, Title, text height=0.5cm] (P6S2) {};

## \end{scope}

## \begin{scope}[on background layer]

## \node [fit={(P6S1) (P6S2) }, draw,  pattern=fivepointed stars, pattern color=blue, opacity=0.2,Messy, thick] (P6) {};

## \draw [Messy, thick] (P6.north west) -- (P6.south west) -- (P6.south east) -- (P6.north east) -- cycle;

## \node [Title, anchor = south] at (P6.north) {P6};

## \end{scope}

## 
## \end{tikzpicture}


## ----data.geo, echo=FALSE, results = 'asis'-----------------------------------
knitr::kable(data.geo, table.attr = "class=\"plainTable\"", format='html')


## ----tikus, echo=FALSE, results = 'asis'--------------------------------------
knitr::kable(tikus[1:10,1:6], table.attr = "class=\"plainTable\"", format='html')


## ----data-import, cache=TRUE,echo=FALSE---------------------------------------
system("convert -resize 650x ../docs/resources/data-import.pdf ../docs/resources/data-import.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----data-transformation, cache=TRUE,echo=FALSE-------------------------------
system("convert -resize 650x ../docs/resources/data-transformation.pdf ../docs/resources/data-transformation.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----tidyr, cache=TRUE,echo=FALSE---------------------------------------------
system("convert -resize 650x ../docs/resources/tidyr.pdf ../docs/resources/tidyr.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----factors, cache=TRUE,echo=FALSE-------------------------------------------
system("convert -resize 650x ../docs/resources/factors.pdf ../docs/resources/factors.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----lubridate, cache=TRUE,echo=FALSE-----------------------------------------
system("convert -resize 650x ../docs/resources/lubridate.pdf ../docs/resources/lubridate.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----purrr, cache=TRUE,echo=FALSE---------------------------------------------
system("convert -resize 650x ../docs/resources/purrr.pdf ../docs/resources/purrr.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----regex, cache=TRUE,echo=FALSE---------------------------------------------
system("convert -resize 650x ../docs/resources/regex.pdf ../docs/resources/regex.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----strings, cache=TRUE,echo=FALSE-------------------------------------------
system("convert -resize 650x ../docs/resources/strings.pdf ../docs/resources/strings.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----tidyeval, cache=TRUE,echo=FALSE------------------------------------------
system("convert -resize 650x ../docs/resources/tidyeval.pdf ../docs/resources/tidyeval.png")
#system("mv ../docs/resources/data-import-0.png ../docs/resources/data-import.png") 


## ----unloadlibrary, echo=FALSE, eval=TRUE, cache=FALSE------------------------
detach(package:tidyverse)
detach(package:dplyr)
detach(package:readr)
## detach(package:gganimate)
detach(package:ggplot2)
detach(package:tidyr)
detach(package:purrr)
detach(package:tibble)
detach(package:stringr)
detach(package:forcats)
detach(package:pander)


## ----libraryA, eval = TRUE, echo = TRUE, results='asis', message = TRUE, warning = TRUE, include = TRUE, cache = FALSE----
library(tidyverse)


## ----libraryPander, eval = TRUE, echo = FALSE, cache = FALSE------------------
library(pander)


## ---- eval = FALSE------------------------------------------------------------
## select(data, Var1)

## ---- eval = FALSE------------------------------------------------------------
## select(data, Var1, Var2)

## ---- eval = FALSE------------------------------------------------------------
## select(data, c(Var1, Var2))

## ---- eval = FALSE------------------------------------------------------------
## select(data, -Var1)


## ---- eval = FALSE------------------------------------------------------------
## select(data, Var1:Var3)

## ---- eval = FALSE------------------------------------------------------------
## select(data, 2:4)


## ---- eval = FALSE------------------------------------------------------------
## select(data, contains("Var"))

## ---- eval = FALSE------------------------------------------------------------
## select(data, !contains("Var"))

## ---- eval = FALSE------------------------------------------------------------
## select(data, starts_with("Var"))

## ---- eval = FALSE------------------------------------------------------------
## select(data, ends_with("Var"))

## ---- eval = FALSE------------------------------------------------------------
## select(data, matches("^.var[1-5]$"))

## ---- eval = FALSE------------------------------------------------------------
## select(data, num_range("Var", 1:2))

## ---- eval = FALSE------------------------------------------------------------
## select(data, Var3, everything())

## ---- eval = FALSE------------------------------------------------------------
## select(data, where(is.numeric))

## ---- eval = FALSE------------------------------------------------------------
## vars <- c("Var1", "Var2")
## select(data, all_of(vars))

## ---- eval = FALSE------------------------------------------------------------
## vars <- c("Var1", "Other")
## select(data, any_of(vars))


## ----pseudo1, eval=FALSE------------------------------------------------------
## data1 <- select(data, ...)
## data2 <- group_by(data1, ...)
## data3 <- summarise(data2, ...)


## ----pseudo2, eval=FALSE------------------------------------------------------
## data <- summarise(group_by(select(data, ...)))


## ----pseudo3, eval=FALSE------------------------------------------------------
## data <- data %>%
##     select(...) %>%
##     group_by(...) %>%
##     summarise(...)


## ----eg, eval=TRUE, cache=FALSE-----------------------------------------------
## Generate some data
set.seed(123)
x = rgamma(10,5,1)
## Calculate the logSumExp
log(sum(exp(x)))
## OR
x1=exp(x)
x2=sum(x1)
log(x2)


## ----eg1, eval=TRUE, cache=FALSE----------------------------------------------
x %>% exp() %>% sum() %>% log()
## OR even
x %>% exp %>% sum %>% log


## ----eg2, eval=TRUE, cache=FALSE----------------------------------------------
exp(x)
x %>% exp()
x %>% exp


## ----eg3, eval=TRUE-----------------------------------------------------------
log(x, base=10)
x %>% log(base=10)


## ---- cache=FALSE-------------------------------------------------------------
dat.1 %>% as.data.frame() 


## ---- cache=FALSE-------------------------------------------------------------
dat.1 %>% as_tibble()


## ---- cache=FALSE-------------------------------------------------------------
data.frame('1.3' = 1:6, 'Wt (kg)' = 1:6)


## ---- cache=FALSE-------------------------------------------------------------
tibble('1.3' = 1:6, 'Wt (kg)' = 1:6)


## ---- cache=FALSE-------------------------------------------------------------
data.frame(Var1 = 1:6, Var2 = 1:2, Var3 = 1)


## ---- cache=FALSE, error = TRUE-----------------------------------------------
tibble(Var1 = 1:6, Var2 = 1:2, Var3 = 1)
tibble(Var1 = 1:6, Var2 = 1)


## ---- cache=FALSE-------------------------------------------------------------
as.data.frame(dat.1)[,2]


## ---- cache=FALSE, error = TRUE-----------------------------------------------
as_tibble(dat.1)[,2]


## ---- cache=FALSE-------------------------------------------------------------
as.data.frame(dat.1)$Plo


## ---- cache=FALSE, error = TRUE, warning = TRUE-------------------------------
as_tibble(dat.1)$Plo


## ---- cache=FALSE-------------------------------------------------------------
D <- data.frame(Var1 = LETTERS[1:3],
           Var2 = list(
               data.frame(a = 1:6),
               data.frame(a = 1:3),
               data.frame(a = 1:2)
           ))
D
D$Var2


## ---- cache=FALSE, error = TRUE, warning = TRUE-------------------------------
D <- tibble(Var1 = LETTERS[1:3],
       Var2 = list(
           data.frame(a = 1:6),
           data.frame(a = 1:3),
           data.frame(a = 1:2)
           ))
D
D$Var2


## \usetikzlibrary{matrix,shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!20,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## \\

## \\

## \\

## \\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]|\\

## };

## 
## %\shadedraw[left color=gray,right color=green, draw=green!50!black]

## %(0,0) -- (3mm,0mm) arc (0:30:3mm) -- cycle;

## 
## %\shadedraw[draw,left color=red, right color=blue] (0,1) -- (2,0.5) -- (2,0.75) -- (3,0() -- (2,-0.75) -- (2,-0.5) -- (0,-1) -- cycle;

## 

## %\shadedraw[draw,left color=black!20, right color=blue!60] ($(first.north east) + (0,-0.2)$) --

## \shadedraw[draw,left color=black!20, right color=blue!60] ($(first.north east) + (0,-0.2)$) --

## %\draw[draw,fill=blue!60] ($(first.north east) + (0,-0.2)$) --

##  ($($(first.north east) !0.75! (first.east)$) +(4,0)$) --

##  ($($(first.north east) !0.5! (first.east)$) +(4,0)$) -- (6,0) --

##  ($($(first.south east) !0.5! (first.east)$) +(4,0)$) --

##  ($($(first.south east) !0.75! (first.east)$) +(4,0)$) --

##  ($(first.south east) + (0,0.2)$) -- cycle;

## \node [anchor=center,Title] at (3,0) (text) {\begin{minipage}{2cm}summary\\function\end{minipage}};

## %\draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {summaryFnct()} ++(second);

## 

## \end{tikzpicture}


## \usetikzlibrary{matrix,shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!20,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## \\

## \\

## \\

## \\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]|\\

## |[fill=blue!60!black!60]|\\

## |[fill=blue!60!black!60]|\\

## |[fill=blue!60!black!60]|\\

## };

## 
## %\shadedraw[left color=gray,right color=green, draw=green!50!black]

## %(0,0) -- (3mm,0mm) arc (0:30:3mm) -- cycle;

## 
## %\shadedraw[draw,left color=red, right color=blue] (0,1) -- (2,0.5) -- (2,0.75) -- (3,0() -- (2,-0.75) -- (2,-0.5) -- (0,-1) -- cycle;

## 

## \shadedraw[draw,left color=black!20, right color=blue!60] ($($(first.north east) !0.5! (first.east)$) +(0,0)$) --

##  ($($(first.north east) !0.5! (first.east)$) +(4,0)$) --

##  ($($(first.north east) !0.25! (first.east)$) +(4,0)$) -- (6,0) --

##  ($($(first.south east) !0.25! (first.east)$) +(4,0)$) --

##  ($($(first.south east) !0.5! (first.east)$) +(4,0)$) --

##  ($($(first.south east) !0.5! (first.east)$) +(0,0)$) -- cycle;

## \node [anchor=center,Title] at (3,0) (text) {\begin{minipage}{2cm}vectorized\\function\end{minipage}};

## %\draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {vectorizedFnct()} ++(second);

## 

## \end{tikzpicture}


## ----summary_vectorised-------------------------------------------------------
set.seed(123)
## a numeric vector
(x <- rgamma(10, 5, 1))
## a character vector
(A <- sample(letters[1:2], size = 10, replace = TRUE))
## a boolean vector
(B <- sample(c(TRUE,FALSE), size = 10, replace = TRUE))


## ----summaryFn1---------------------------------------------------------------
mean(x)
median(B)


## ----summaryFn2---------------------------------------------------------------
sum(x)
prod(B)


## ----summaryFn3---------------------------------------------------------------
var(x)
sd(B)


## ----summaryFn4---------------------------------------------------------------
mad(x)
IQR(B)


## ----summaryFn5---------------------------------------------------------------
min(x)
max(B)


## ----summaryFn6---------------------------------------------------------------
quantile(x)
quantile(x, p = 0.25)


## ----summaryFn7---------------------------------------------------------------
first(x)
first(x, order_by = A)
last(B)
nth(A, n = 4)


## ----summaryFn8---------------------------------------------------------------
n_distinct(A)


## ----vectorFn1, R.options = list(width = 45)----------------------------------
x + 2
x * B


## ----vectorFn2, R.options = list(width = 45)----------------------------------
log(x)
log10(x)
exp(x)


## ----vectorFn3, R.options = list(width = 45)----------------------------------
x < 5
B == TRUE


## ----vectorFn4, R.options = list(width = 45)----------------------------------
between(x, 3, 5)


## ----vectorFn5, R.options = list(width = 45)----------------------------------
x == 3.39
near(x, y = 3.39, tol =0.01)


## ----vectorFn6, R.options = list(width = 45)----------------------------------
lag(x)
lead(x)


## ----vectorFn7, R.options = list(width = 45)----------------------------------
cummax(x)
cummin(B)
cummean(x)
cummean(x > 2)
cummean(B)


## ----vectorFn8, R.options = list(width = 45)----------------------------------
cumsum(x)
cumsum(x > 3)
cumprod(B)


## ----vectorFn9, R.options = list(width = 45)----------------------------------
cumall(x)
cumall(x > 2)
cumany(x > 4)
cumany(B)
cumall(B)


## ----vectorFn10, R.options = list(width = 45)---------------------------------
rank(x)
order(x)
rank(B)


## ----vectorFn11, R.options = list(width = 45)---------------------------------
min_rank(x)
dense_rank(x)
percent_rank(x)
rank(B)


## ----vectorFn12, R.options = list(width = 45)---------------------------------
row_number(x)


## ----vectorFn13, R.options = list(width = 45)---------------------------------
cume_dist(x)


## ----vectorFn14, R.options = list(width = 45)---------------------------------
ntile(x, n = 3)


## ----vectorFn15, R.options = list(width = 45)---------------------------------
if_else(x > 3, true = "H", false = "L")


## ----vectorFn16, R.options = list(width = 45)---------------------------------
case_when(x <= 3 ~ "L",
          x > 3 & x <= 6 ~ "M",
          x > 6 ~ "H")


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 1/.style={

##             nodes={text width=2em,font=\bfseries}

##         },

##         column 2/.style={

##             nodes={text width=2em}

##         },

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## \matrix (first) [table,text width=4em]{

## &  &   & \\

## &  & |[fill=black!80]| & \\

## &  & |[fill=black!20]|  & \\

## &  & |[fill=black!60]|  & \\

## &  & |[fill=black!40]|  & \\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## &  &   & \\

## &  & |[fill=black!20]| & \\

## &  & |[fill=black!40]|  & \\

## &  & |[fill=black!60]|  & \\

## &  & |[fill=black!80]|  & \\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {arrange()} ++(second);

## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Sorted)  {Sorted data};

## \end{tikzpicture}


## ----dat1View, cache=FALSE, echo=FALSE----------------------------------------
dat.1 %>%
    head(10) %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="First 10 rows of the `dat.1` data.frame")


## ----arrange1, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% arrange(Resp1) %>%
    head()


## ----arrange2, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% arrange(desc(Resp1)) %>%
    head()


## ----arrange3, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% arrange(Dose, Resp1) %>%
    head()


## ----arrange4, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% arrange(Resp1 + Resp2) %>%
    head()


## ----arrange5, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% arrange(Dose, mean(c(Resp1, Resp2))) %>%
    head()


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 1/.style={

##             nodes={text width=2em,font=\bfseries}

##         },

##         column 2/.style={

##           nodes={text width=2em, fill=blue!40}

##         },

##         column 3/.style={

##           nodes={text width=2em, fill=blue!40}

##         },

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## & |[fill=blue!70]| & |[fill=blue!70]| & & |[fill=blue!70]|\\

## &  &  & &\\

## &  &  & &\\

## &  &  & &\\

## &  &  & &\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!70]|& |[fill=blue!70]| & |[fill=blue!70]| \\

## |[fill=blue!40]|&  &  \\

## |[fill=blue!40]|&  &  \\

## |[fill=blue!40]|&  &  \\

## |[fill=blue!40]|&  &  \\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {select()} ++(second);

## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Subset)  {Subset data};

## \end{tikzpicture}


## ----dat1View, cache=FALSE, echo=FALSE----------------------------------------
dat.1 %>%
    head(10) %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="First 10 rows of the `dat.1` data.frame")


## NA

## ----select1, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(Treatment, Dose, Time, Resp1) %>%
    head() 


## ----select2, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(-Plot, -Resp2) %>%
    head()


## ----select7, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(Treatment:Time) %>%
    head() 


## ----select7a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% select(-(Treatment:Time)) %>%
    head() 


## ----select7b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% select(!(Treatment:Time)) %>%
    head() 


## ----select3, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(contains("R")) %>%
    head() 


## ----select4, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(starts_with("R")) %>%
    head() 


## ----select5, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(ends_with("e")) %>%
    head() 


## ----select6, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(matches("^.{4}$")) %>%
    head()


## ----select8, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(num_range("Resp", 1:2)) %>%
    head()


## ----select9, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% select(num_range("Resp", 1:2),
                 everything()) %>%
    head() 


## ----select10, cache=FALSE, error = TRUE, warning = TRUE----------------------
Vars <- c("Resp1", "Resp2")
dat.1 %>% select(all_of(Vars)) %>%
    head()


## ----select11, cache=FALSE, error = TRUE, warning = TRUE----------------------
Vars <- c("Resp1", "Resp2", "Resp3")
dat.1 %>% select(any_of(Vars)) %>%
    head() 


## ----select12, cache=FALSE, error = TRUE, warning = TRUE----------------------
Vars <- c("Resp1", "Resp2", "Resp3")
dat.1 %>% select(-any_of(Vars)) %>%
    head() 


## ----select13, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% select(where(is.numeric)) %>%
    head() 


## ----select14, cache=FALSE, error = TRUE, warning = TRUE----------------------
tikus %>%
    select(`Pocillopora damicornis`) %>%
    head()


## ----select15, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>%
    select("Weight" = Resp1) %>%
    head()


## ----select16, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>%
    select(everything(), "Weight" = Resp1) %>%
    head()


## ----rename, cache=FALSE, error = TRUE, warning = TRUE------------------------
dat.1 %>%
    rename("Weight" = Resp1) %>%
    head()


## ----pull, cache=FALSE, error = TRUE, warning = TRUE--------------------------
dat.1 %>% pull(Resp1) 


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## &  &  &\\

## &  &  &\\

## |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]| \\

## |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]| \\

## &  &  &\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!70]|& |[fill=blue!70]| & |[fill=blue!70]| & |[fill=blue!70]|  \\

## |[fill=blue!40]|& |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]|  \\

## |[fill=blue!40]|& |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]|  \\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {filter()} ++(second);

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Filtered)  {Filtered data};

## \end{tikzpicture}


## ----dat1View, cache=FALSE, echo=FALSE----------------------------------------
dat.1 %>%
    head(10) %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="First 10 rows of the `dat.1` data.frame")


## ----filter1, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% filter(Dose == "H")


## ----filter2, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% filter(Dose %in% c("H", "M"))


## ----filter2a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% filter(Resp1 < 25)


## ----filter2b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% filter(between(Resp1, 15, 25))


## ----filter2c, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% filter(cumany(Resp1 > 200))


## ----filter2d, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% filter(cumall(Resp1 < 25))


## ----filter3, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% filter(Dose == "H", Resp1 < 25)
##OR
dat.1 %>% filter(Dose == "H" & Resp1 < 25)


## ----filter4, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% filter(Dose == "H" | Resp1 < 25)


## ----filter5, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% filter(if_all(starts_with("Resp"), ~ . < 25))


## ----filter6, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% filter(if_any(starts_with("Resp"), ~ . < 25))


## ----slice1, cache=FALSE, error = TRUE, warning = TRUE------------------------
dat.1 %>% slice(1:4)


## ----slice2, cache=FALSE, error = TRUE, warning = TRUE------------------------
dat.1 %>% slice(c(1:4, 7))


## ----sample1, cache=FALSE, error = TRUE, warning = TRUE-----------------------
set.seed(123)
dat.1 %>% sample_n(10, replace = FALSE)


## ----sample2, cache=FALSE, error = TRUE, warning = TRUE-----------------------
set.seed(123)
dat.1 %>% sample_frac(0.25, replace = FALSE)


## ----levels-------------------------------------------------------------------
str(dat.1$Dose)


## ----levels1------------------------------------------------------------------
levels(dat.1$Dose)
levels(dat.1$Plot)
levels(dat.1$Treatment)


## ----levels2------------------------------------------------------------------
dat.2 <- dat.1 %>%
    filter(Plot == "P1")
dat.2
levels(dat.2$Dose)
levels(dat.2$Plot)
levels(dat.2$Treatment)


## ----levels3------------------------------------------------------------------
dat.2 <- dat.1 %>%
    filter(Plot == "P1") %>%
    droplevels()
levels(dat.2$Dose)
levels(dat.2$Plot)
levels(dat.2$Treatment)


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 1/.style={

##             nodes={text width=2em,font=\bfseries}

##         },

##         column 2/.style={

##             nodes={text width=2em}

##         },

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## \matrix (first) [table,text width=4em]{

## &  &  & \\

## &  &  & \\

## &  &  & \\

## &  &  & \\

## &  &  & \\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## &  &  & & |[fill=blue!70]| \\

## &  &  & &\\

## &  &  &  &\\

## &  &  &  &\\

## &  &  &  & \\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {mutate()} ++(second);

## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Mutated)  {Transformed data};

## \end{tikzpicture}


## ----mutate-------------------------------------------------------------------
dat.1 %>% mutate(Sum = Resp1 + Resp2) %>%
    head()


## ----mutate1------------------------------------------------------------------
dat.1 %>% mutate(meanResp1 = mean(Resp1),
                 cResp1 = Resp1 - meanResp1) %>%
    head()


## ----dat1View, cache=FALSE, echo=FALSE----------------------------------------
dat.1 %>%
    head(10) %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="First 10 rows of the `dat.1` data.frame")


## ----mutate2a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Sum = Resp1 + Resp2,
                 Div = Resp1 / Resp2) %>%
    head()


## ----mutate2b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(logResp1 = log(Resp1),
                 expResp2 = exp(Resp2)) %>%
    head()


## ----mutate2c, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(largeResp1 = Resp1 > 25) %>%
    head()


## ----mutate2d, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(
              A = Resp1 == 8.1,
              B = near(Resp1, 8.1, tol = 0.1)) %>%
    head()


## ----mutate2e, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(mediumResp1 = between(Resp1, 15, 25)) %>%
    head()


## ----mutate2, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(lagResp1 = lag(Resp1)) %>%
    head()


## ----mutate3, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(leadResp1 = lead(Resp1)) %>%
    tail()


## ----mutate3a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Cummin = cummin(Resp1),
                 Cummax = cummax(Resp1),
                 Cummean = cummean(Resp1)) %>%
    head()


## ----mutate3b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Cumsum = cumsum(Resp1),
                 Cumprod = cumprod(Resp1)) %>%
    head()


## ----mutate3c, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Rank = rank(Resp1),
                 minRank = min_rank(Resp1),
                 denseRank = dense_rank(Resp1),
                 percentRank = percent_rank(Resp1)) %>%
    head()


## ----mutate3d, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(cume_dist(Resp1)) %>%
    head()


## ----mutate3e, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(row_number(Resp1)) %>%
    head()


## ----mutate3f, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(ntile(Resp1, 5)) %>%
    head()


## ----mutate4a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Size = if_else(Resp1 > 25, "Big", "Small")) %>%
    head()


## ----mutate4b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Size = case_when(Resp1 < 15 ~ "Small",
                               Resp1 < 25 ~ "Medium",
                               Resp1 >= 25 ~ "Big")) %>%
    head()


## ----mutate5a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(meanResp1 = mean(Resp1)) %>%
    head()


## ----mutate5b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(N = 1:n()) %>%
    head()


## ----across, eval=FALSE-------------------------------------------------------
## across(.cols, .fns, .names)


## ----across1, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(across(c(Resp1, Resp2), log)) %>%
    head()


## ----across2, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(across(c(Resp1, Resp2),
                        .fns = log,
                        .names = "l{.col}")) %>%
    head()


## ----across3, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(across(where(is.numeric),
                        .fns = log,
                        .names = "l{.col}")) %>%
    head()


## ----across4, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(across(num_range("Resp", 1:2),
                        .fns = log,
                        .names = "l{.col}")) %>%
    head()


## ----across5, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(across(c(Resp1, Resp2),
                        .fns = list(l = log, s = sqrt),
                        .names = "{.fn}.{.col}")) %>%
    head()


## ----across6, cache=FALSE, error = TRUE, warning = TRUE-----------------------
dat.1 %>% mutate(across(c(Resp1, Resp2),
                        .fns = list(c =  ~ scale(.x, scale = FALSE)),
                        .names = "{.fn}{.col}")) %>%
    head()


## ----mutate6a, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Time = factor(Time)) %>%
    tibble()


## ----mutate6b, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% mutate(Dose = fct_recode(Dose, High = 'H',  Medium = 'M')) %>%
    tibble()

dat.1 %>% mutate(Dose = fct_recode(Dose, High = 'H',  Medium = 'M')) %>%
    str()


## ----mutate6c, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% pull(Dose)
dat.1 %>%
    mutate(Dose = fct_relevel(Dose, c("L", "M", "H"))) %>% 
    as_tibble() %>%
    pull(Dose)


## ----mutate6d, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% pull(Dose)
dat.1 %>% mutate(
              Dose = fct_relevel(Dose, c("L", "M", "H")),
              Dose = fct_recode(Dose, High = 'H',  Medium = 'M')
              ) %>%
    as_tibble %>% 
    pull(Dose)


## ----mutate6e, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% pull(Dose)
dat.1 %>% mutate(Dose = fct_reorder(Dose, 1:n())) %>%
    as_tibble %>% 
    pull(Dose)


## ----mutate6f, cache=FALSE, error = TRUE, warning = TRUE----------------------
dat.1 %>% pull(Dose)
dat.1 %>% mutate(Dose = fct_reorder(Dose, Resp1, median)) %>%
    as_tibble %>% 
    pull(Dose)


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 1/.style={

##             nodes={text width=2em,font=\bfseries}

##         },

##         column 2/.style={

##             nodes={text width=2em}

##         },

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## \matrix (first) [table,text width=4em]{

## &  &   & \\

## &  &   & \\

## &  &   & \\

## &  &   & \\

## &  &   & \\

## };

## 

## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!70]| & |[fill=blue!70]| &  |[fill=blue!70]| & |[fill=blue!70]| \\

## |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]| & |[fill=blue!40]|\\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {summarize()} ++(second);

## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Summarized)  {Summarized data};

## \end{tikzpicture}


## ----dat1View, cache=FALSE, echo=FALSE----------------------------------------
dat.1 %>%
    head(10) %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="First 10 rows of the `dat.1` data.frame")


## ----summarise1a, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(N = n(),
                    NDose = n_distinct(Dose))


## ----summarise2a, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(Mean = mean(Resp1),
                    Median = median(Resp1)) 


## ----summarise2b, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(Sum = sum(Resp1),
                    Prod = prod(Resp1)) 


## ----summarise2c, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(Var = var(Resp1),
                    MAD = mad(Resp1)) 


## ----summarise2d, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(Min = min(Resp1),
                    Max = max(Resp1)) 


## ----summarise2e, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(Q = t(quantile(Resp1)))


## ----summarise2f, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(First = first(Resp1),
                    Last = last(Resp1),
                    Fifth = nth(Resp1, 5)) 


## ----summarise3a, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(across(c(Resp1, Resp2),
                           list(Mean = mean, Var = var),
                           .names = "{.fn}.{.col}"),
                    N = n()) 


## ----summarise3b, cache=FALSE, error = TRUE, warning = TRUE-------------------
dat.1 %>% summarise(across(where(is.numeric),
                           list(Mean = mean, Var = var),
                           .names = "{.fn}.{.col}"),
                    across(where(is.factor), n_distinct),
                    N = n())


## ----summarise3c, cache=FALSE, error = TRUE, warning = TRUE-------------------
Var <- c("Resp1", "Resp2", "Resp3")
dat.1 %>% summarise(across(any_of(Var),
                           list(Mean = mean, Var = var)))


## ----count1, cache=FALSE, error = TRUE, warning = TRUE------------------------
dat.1 %>% count(Dose)


## ----count2, cache=FALSE, error = TRUE, warning = TRUE------------------------
dat.1 %>% count(Dose, between(Resp1, 30, 50))


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 1/.style={

##             nodes={text width=2em,font=\bfseries}

##         },

##         column 2/.style={

##             nodes={text width=2em}

##         },

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## \matrix (first) [table,text width=4em]{

## &  &   & \\

## |[fill=orange!10]| &  &   & \\

## |[fill=orange!30]| &  &   & \\

## |[fill=orange!50]| &  &   & \\

## |[fill=orange!70]| &   &   & \\

## };

## 

## \matrix (second) [above right=1cm and 5cm of first,anchor=north west,table,text width=4em]{

## &  &   & \\

## |[fill=orange!10]| &  &   & \\

## |[fill=orange!30]| &  &   & \\

## };

## 
## \matrix (third) [below=1cm of second,anchor=north,table,text width=4em]{

## &  &   & \\

## |[fill=orange!50]| &  &   & \\

## |[fill=orange!70]| &  &   & \\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {group\_by()} ++($(second.west|-first) +(-0.5cm, 0)$);

## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Grouped)  {Grouped data};

## \end{tikzpicture}


## ----apply1-------------------------------------------------------------------
apply(dat.1[, c("Resp1", "Resp2")],
      MARGIN = 2,
      FUN = mean)


## ----apply2-------------------------------------------------------------------
tapply(dat.1$Resp1,
       INDEX = dat.1$Dose,
       FUN = mean)


## ----groupby------------------------------------------------------------------
dat.1 %>% group_by(Dose)


## ----groupby2-----------------------------------------------------------------
dat.1 %>% group_by(Dose) %>%
    summarise(Mean = mean(Resp1))


## ----groupby3a----------------------------------------------------------------
dat.1 %>% group_by(Dose) %>%
    mutate(MeanResp1 = mean(Resp1)) %>%
    head()


## ----groupby3b----------------------------------------------------------------
dat.1 %>% group_by(Dose) %>%
    summarise(Mean = mean(Resp1))


## ----groupby4-----------------------------------------------------------------
dat.1 %>% group_by(Treatment, Dose) %>%
    summarise(Mean = mean(Resp1))


## ----groupby5-----------------------------------------------------------------
dat.1 %>% group_by(Treatment, Dose) %>%
    summarise(Mean = mean(Resp1)) %>%
    ungroup()


## ----groupby6a, cache=FALSE, error = TRUE, warning = TRUE---------------------
dat.1 %>% group_by(Treatment, Dose) %>%
    summarise(meanResp1 = mean(Resp1),
              varResp1 = var(Resp1),
              N = n())


## ----groupby6b, cache=FALSE, error = TRUE, warning = TRUE---------------------
dat.1 %>% group_by(Treatment, Dose) %>%
    summarise(across(starts_with("Resp"),
                     list(Mean = mean, Var = var),
                     .names = "{.fn}{.col}"),
              N = n())


## ----groupby6c, cache=FALSE, error = TRUE, warning = TRUE---------------------
dat.1 %>% group_by(Treatment, Dose) %>%
    filter(Resp1 < 25)


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## \matrix (first) [table,text width=4em]{

## &|[fill=blue!40!black!40]|  & |[fill=blue!60!black!60]|  & |[fill=blue!80!black!80]|\\

## &|[fill=blue!40!white!40]|  & |[fill=blue!60!white!60]|  & |[fill=blue!80!white!80]|\\

## &|[fill=blue!40!white!40]|  & |[fill=blue!60!white!60]|  & |[fill=blue!80!white!80]|\\

## &|[fill=blue!40!white!40]|  & |[fill=blue!60!white!60]|  & |[fill=blue!80!white!80]|\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## & |[fill=black!60]|& |[fill=black!60]| \\

## & |[fill=blue!40!black!40]|& |[fill=blue!40!white!40]|\\

## & |[fill=blue!40!black!40]|& |[fill=blue!40!white!40]|\\

## & |[fill=blue!60!black!60]|& |[fill=blue!60!white!60]|\\

## & |[fill=blue!60!black!60]|& |[fill=blue!60!white!60]|\\

## & |[fill=blue!80!black!80]|& |[fill=blue!80!white!80]|\\

## & |[fill=blue!80!black!80]|& |[fill=blue!80!white!80]|\\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {pivot\_longer()} ++(second);

## 
## 
## \node [Title,above=0.75cm of first.north,anchor=north] (Wide)  {Wide data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Long)  {Long data};

## \end{tikzpicture}


## ----pivot_longer, eval=FALSE-------------------------------------------------
## pivot_longer(data, cols, names_to, values_to, values_drop_na)


## ----datawView, cache=FALSE, echo=FALSE---------------------------------------
data.w %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="The `data.w` data.frame")


## ----pivot_longer2, cache=FALSE, error = TRUE, warning = TRUE-----------------
data.w %>% pivot_longer(Time.0:Time.2,
                        names_to = "Time",
                        values_to = "Count")


## ----pivot_longer3, cache=FALSE, error = TRUE, warning = TRUE-----------------
data.w %>% pivot_longer(starts_with("Time"),
                        names_to = "Time",
                        names_prefix = "Time.",
                        values_to = "Count"
                        )


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## \matrix (first) [table,text width=4em]{

## & |[fill=black!60]|& |[fill=black!60]| \\

## & |[fill=blue!40!black!40]|& |[fill=blue!40!white!40]|\\

## & |[fill=blue!40!black!40]|& |[fill=blue!40!white!40]|\\

## & |[fill=blue!60!black!60]|& |[fill=blue!60!white!60]|\\

## & |[fill=blue!60!black!60]|& |[fill=blue!60!white!60]|\\

## & |[fill=blue!80!black!80]|& |[fill=blue!80!white!80]|\\

## & |[fill=blue!80!black!80]|& |[fill=blue!80!white!80]|\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## &|[fill=blue!40!black!40]|  & |[fill=blue!60!black!60]|  & |[fill=blue!80!black!80]|\\

## &|[fill=blue!40!white!40]|  & |[fill=blue!60!white!60]|  & |[fill=blue!80!white!80]|\\

## &|[fill=blue!40!white!40]|  & |[fill=blue!60!white!60]|  & |[fill=blue!80!white!80]|\\

## &|[fill=blue!40!white!40]|  & |[fill=blue!60!white!60]|  & |[fill=blue!80!white!80]|\\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {pivot\_wider()} ++(second);

## 
## 
## \node [Title,above=0.75cm of first.north,anchor=north] (Long)  {Long data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Wide)  {Wide data};

## \end{tikzpicture}


## ----pivot_wider, eval=FALSE--------------------------------------------------
## pivot_wider(data, id_cols, names_from, values_from


## ----datalView, cache=FALSE, echo=FALSE---------------------------------------
data %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="The `data` data.frame")


## ----pivot_wider2, cache=FALSE, error = TRUE, warning = TRUE------------------
data %>% select(-Resp2) %>%
    pivot_wider(names_from = Within,
                values_from = c(Resp1))


## ----pivot_wider3, cache=FALSE, error = TRUE, warning = TRUE------------------
data %>% pivot_wider(names_from = Within,
                values_from = starts_with("Resp"))


## ----pivot_wider4, cache=FALSE, error = TRUE, warning = TRUE------------------
data %>%
    pivot_longer(cols = starts_with("Resp")) %>%
    pivot_wider(names_from = c(name, Within),
                values_from = value)


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## 
## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## &  & |[fill=blue!60!black!60]|& |[fill=blue!60!black!60]|& |[fill=blue!60!black!60]|\\

## &  & |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|\\

## &  & |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## &  & |[fill=blue!60!black!60]|\\

## &  & |[fill=blue!60!white!60]|\\

## &  & |[fill=blue!60!white!60]|\\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {unite()} ++(second);

## 
## 
## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (United)  {United data};

## \end{tikzpicture}


## ----datadView, cache=FALSE, echo=FALSE---------------------------------------
data.d %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="The `data.d` data.frame")


## ----unite2, cache=FALSE, error = TRUE, warning = TRUE------------------------
data.d %>% unite(year,month,day,col='Date',sep='-') %>%
    mutate(Date = as.Date(Date))


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## 
## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## &  & |[fill=blue!60!black!60]|\\

## &  & |[fill=blue!60!white!60]|\\

## &  & |[fill=blue!60!white!60]|\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## &  & |[fill=blue!60!black!60]|& |[fill=blue!60!black!60]|& |[fill=blue!60!black!60]|\\

## &  & |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|\\

## &  & |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|& |[fill=blue!60!white!60]|\\

## };

## 
## \draw[-latex,line width=8pt] (first) -- node[code,above,scale=2] {separate()} ++(second);

## 
## 
## \node [Title,above=0.75cm of first.north,anchor=north] (Raw)  {Raw data};

## \node [Title,above=0.75cm of second.north,anchor=north] (Separated)  {Separated data};

## \end{tikzpicture}


## ----datacView, cache=FALSE, echo=FALSE---------------------------------------
data.c %>%
    knitr::kable(table.attr = "class=\"plainTable table-condensed\"", format='html',
                 caption="The `data.c` data.frame")


## ----separate2, cache=FALSE, error = TRUE, warning = TRUE---------------------
data.c %>% separate(Year,
                    into = c("Gender", "Age"),
                    sep = 1)


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20,

##             font=\ttfamily\bfseries

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\ttfamily\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## x1&x2\\

## A& 1\\

## B& 2\\

## C& 3\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3\\

## |[fill=blue!60!white!60]| A& |[fill=blue!60!white!60]| T\\

## |[fill=blue!60!white!60]| B& |[fill=blue!60!white!60]| F\\

## |[fill=blue!60!white!60]| D& |[fill=blue!60!white!60]| T\\

## };

## 
## \matrix (third) [right=5cm of second,anchor=west,table,text width=4em]{

## x1 & x2 & |[fill=blue!60!black!60]| x3\\

## A & 1 & |[fill=blue!60!white!60]| T\\

## B & 2 & |[fill=blue!60!white!60]| F\\

## C & 3 & |[fill=none]| NA\\

## };

## 
## \draw [-latex,line width=8pt](second) -- (third);

## \node at ($(first.east) !0.5! (second.west)$) [code,scale=2] (leftjoin) {left\_join()};

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (A)  {Left dataset};

## \node [Title,above=0.75cm of second.north,anchor=north] (B)  {Right dataset};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20,

##             font=\ttfamily\bfseries

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\ttfamily\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## x1&x2\\

## A& 1\\

## B& 2\\

## C& 3\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3\\

## |[fill=blue!60!white!60]| A& |[fill=blue!60!white!60]| T\\

## |[fill=blue!60!white!60]| B& |[fill=blue!60!white!60]| F\\

## |[fill=blue!60!white!60]| D& |[fill=blue!60!white!60]| T\\

## };

## 
## \matrix (third) [right=5cm of second,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3 &  x2\\

## |[fill=blue!60!white!60]| A & |[fill=blue!60!white!60]| T &  1\\

## |[fill=blue!60!white!60]| B & |[fill=blue!60!white!60]| F & 2\\

## |[fill=blue!60!white!60]| D & |[fill=blue!60!white!60]| T & |[fill=none]| NA\\

## };

## 
## \draw [-latex,line width=8pt](second) -- (third);

## \node at ($(first.east) !0.5! (second.west)$) [code,scale=2] (rightjoin) {right\_join()};

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (A)  {Left dataset};

## \node [Title,above=0.75cm of second.north,anchor=north] (B)  {Right dataset};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20,

##             font=\ttfamily\bfseries

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\ttfamily\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## x1&x2\\

## A& 1\\

## B& 2\\

## C& 3\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3\\

## |[fill=blue!60!white!60]| A& |[fill=blue!60!white!60]| T\\

## |[fill=blue!60!white!60]| B& |[fill=blue!60!white!60]| F\\

## |[fill=blue!60!white!60]| D& |[fill=blue!60!white!60]| T\\

## };

## 
## \matrix (third) [right=5cm of second,anchor=west,table,text width=4em]{

## x1 & x2 & |[fill=blue!60!black!60]| x3\\

## A & 1 & |[fill=blue!60!white!60]| T\\

## B & 2 & |[fill=blue!60!white!60]| F\\

## };

## 
## \draw [-latex,line width=8pt](second) -- (third);

## \node at ($(first.east) !0.5! (second.west)$) [code,scale=2] (innerjoin) {inner\_join()};

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (A)  {Left dataset};

## \node [Title,above=0.75cm of second.north,anchor=north] (B)  {Right dataset};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20,

##             font=\ttfamily\bfseries

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\ttfamily\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## x1&x2\\

## A& 1\\

## B& 2\\

## C& 3\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3\\

## |[fill=blue!60!white!60]| A& |[fill=blue!60!white!60]| T\\

## |[fill=blue!60!white!60]| B& |[fill=blue!60!white!60]| F\\

## |[fill=blue!60!white!60]| D& |[fill=blue!60!white!60]| T\\

## };

## 
## \matrix (third) [right=5cm of second,anchor=west,table,text width=4em]{

## x1 & x2\\

## A & 1\\

## B & 2\\

## };

## 
## \draw [-latex,line width=8pt](second) -- (third);

## \node at ($(first.east) !0.5! (second.west)$) [code,scale=2] (semijoin) {semi\_join()};

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (A)  {Left dataset};

## \node [Title,above=0.75cm of second.north,anchor=north] (B)  {Right dataset};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20,

##             font=\ttfamily\bfseries

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\ttfamily\bfseries

##             }

##         }

##     }

## }

## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## x1&x2\\

## A& 1\\

## B& 2\\

## C& 3\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3\\

## |[fill=blue!60!white!60]| A& |[fill=blue!60!white!60]| T\\

## |[fill=blue!60!white!60]| B& |[fill=blue!60!white!60]| F\\

## |[fill=blue!60!white!60]| D& |[fill=blue!60!white!60]| T\\

## };

## 
## \matrix (third) [right=5cm of second,anchor=west,table,text width=4em]{

## x1 & x2\\

## C & 3\\

## };

## 
## \draw [-latex,line width=8pt](second) -- (third);

## \node at ($(first.east) !0.5! (second.west)$) [code,scale=2] (antijoin) {anti\_join()};

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (A)  {Left dataset};

## \node [Title,above=0.75cm of second.north,anchor=north] (B)  {Right dataset};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric, shapes.multipart,patterns}

## \tikzstyle{Title} = [font={\fontspec[Scale=2]{Complete in Him}}]

## \tikzstyle{code} = [font=\ttfamily]

## \tikzset{

##     table/.style={

##         matrix of nodes,

##         row sep=-\pgflinewidth,

##         column sep=-\pgflinewidth,

##         nodes={

##             rectangle,

##             draw=white,

##             align=center,

##             fill=black!20,

##             font=\ttfamily\bfseries

##         },

##         minimum height=1.5em,

##         text depth=0.5ex,

##         text height=2ex,

##         nodes in empty cells,

## %%

##         %%every even row/.style={

##         %%    nodes={fill=gray!30}

##         %%},

##         column 5/.style={

##             nodes={

##                 text width=4em,

##                 fill=blue!40

##             }

##         },

##         row 1/.style={

##             nodes={

##                 fill=black!40,

##                 text=white,

##                 font=\ttfamily\bfseries

##             }

##         }

##     }

## }

## 
## \begin{tikzpicture}

## 
## \matrix (first) [table,text width=4em]{

## x1&x2\\

## A& 1\\

## B& 2\\

## C& 3\\

## };

## 
## \matrix (second) [right=5cm of first,anchor=west,table,text width=4em]{

## |[fill=blue!60!black!60]| x1 & |[fill=blue!60!black!60]| x3\\

## |[fill=blue!60!white!60]| A& |[fill=blue!60!white!60]| T\\

## |[fill=blue!60!white!60]| B& |[fill=blue!60!white!60]| F\\

## |[fill=blue!60!white!60]| D& |[fill=blue!60!white!60]| T\\

## };

## 
## \matrix (third) [right=5cm of second,anchor=west,table,text width=4em]{

## x1 & x2 & |[fill=blue!60!black!60]| x3\\

## A & 1 & |[fill=blue!60!white!60]| T\\

## B & 2 & |[fill=blue!60!white!60]| F\\

## C & 3 & |[fill=none]| NA\\

## D & |[fill=none]| NA & |[fill=blue!60!white!60]| T\\

## };

## 
## \draw [-latex,line width=8pt](second) -- (third);

## \node at ($(first.east) !0.5! (second.west)$) [code,scale=2] (fulljoin) {full\_join()};

## 
## \node [Title,above=0.75cm of first.north,anchor=north] (A)  {Left dataset};

## \node [Title,above=0.75cm of second.north,anchor=north] (B)  {Right dataset};

## \end{tikzpicture}


## ----join1a, echo=FALSE-------------------------------------------------------
knitr::kable(data.bio, table.attr = "class=\"plainTable\"", format='html')


## ----join1b, echo=FALSE-------------------------------------------------------
knitr::kable(data.chem, table.attr = "class=\"plainTable\"", format='html')


## ----full_join, cache=FALSE, error = TRUE, warning = TRUE---------------------
data.bio %>% full_join(data.chem)


## ----inner_join, cache=FALSE, error = TRUE, warning = TRUE--------------------
data.bio %>% inner_join(data.chem)


## ----left_join, cache=FALSE, error = TRUE, warning = TRUE---------------------
data.bio %>% left_join(data.chem)


## ----right_join, cache=FALSE, error = TRUE, warning = TRUE--------------------
data.bio %>% right_join(data.chem)


## ----anti_join, cache=FALSE, error = TRUE, warning = TRUE---------------------
data.bio %>% anti_join(data.chem)


## ----semi_join, cache=FALSE, error = TRUE, warning = TRUE---------------------
data.bio %>% semi_join(data.chem)


## ----join1a, echo=FALSE-------------------------------------------------------
knitr::kable(data.bio, table.attr = "class=\"plainTable\"", format='html')


## ----vlookup1b, echo=FALSE----------------------------------------------------
knitr::kable(data.geo, table.attr = "class=\"plainTable\"", format='html')


## ----vlookup2, cache=FALSE, error = TRUE, warning = TRUE----------------------
data.bio %>% left_join(data.geo)

