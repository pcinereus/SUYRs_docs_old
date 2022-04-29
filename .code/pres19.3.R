## ----setup, include=FALSE,warning=FALSE, message=FALSE------------------------
knitr::opts_chunk$set(echo = TRUE,
                      fig.path = "resources/pres19.3-",
                      dev = "png",
                      fig.ext = "png")
## fig.path='resources/pres19.3-', dev='tikz', dev.args=list(bg=NA))
options(tinytex.engine = "xelatex")
cleanRmdInput <- function(x) {
#x <- gsub("```\\{r","```markdown\n`r ''```\\{r",x)
x <- gsub("^```$", "`` `", x)  # the Makefile will then change this back to ``` after pandoc
x
}


## NA

## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## 
## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=0.4]{Inconsolata}}]

## \tikzstyle{docText} = [font={\fontspec[Scale=0.4]{Arial}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## \newcommand{\file}[3] {

##  \coordinate (#3) at (#1);

##  \draw[thick,anchor=top left](#1) -- ++(2,0) -- ++(0.5,-0.5) -- ++(0,-3) -- ++(-2.5,0) -- ++(0,3.5);

##  \draw[thick,anchor=top left]($(#1) +(2,0)$) -- ++(0,-0.5) -- ++(0.5,0); 	

##  \node [anchor=north west,fileText] at ($(#1) +(0,-0.1)$) {#2};

## }

## 
## \newcommand{\doc}[3] {

##  \coordinate (#3) at (#1);

##  \draw[thick,anchor=top left](#1) -- ++(2,0) -- ++(0.5,-0.5) -- ++(0,-3) -- ++(-2.5,0) -- ++(0,3.5);

##  \draw[thick,anchor=top left]($(#1) +(2,0)$) -- ++(0,-0.5) -- ++(0.5,0); 	

##  \node [anchor=north west,docText] at ($(#1) +(0,-0.1)$) {#2};

## }

## 
## \newcommand{\dat}[3] {

##  \coordinate (#3) at (#1);

##  \draw[thick,anchor=top left,color=black!40](#1) -- ++(1.3,0) -- ++(0.5,-0.5) -- ++(0,-1) -- ++(-1.8,0) -- ++(0,1.5);

##  \draw[thick,anchor=top left,color=black!40]($(#1) +(1.3,0)$) -- ++(0,-0.5) -- ++(0.5,0); 	

##  \node [anchor=north west,docText,color=black!40] at ($(#1) +(0,-0.4)$) {#2};

## }

## 
## 
## \newcommand{\Arrow}[5] {

##  \coordinate (#5) at (#1);

##  \draw[thick,rotate around={#4:(#1)}] (#1) -- ++(0,#3*1) -- ++(#2,#3*-0.5) -- ++(0.25*#2*-0.3,#3*0.5) -- ++(0.25*#2*2,#3*-1) -- ++(0.25*#2*-2,#3*-1) -- ++(0.25*#2*0.3,#3*0.5) -- ++(0.25*#2*-4,#3*-0.5) -- ++(0,#3*1) -- cycle;

## }

## 
## \begin{tikzpicture}

## 
## % .md

## \file{6,0}{\begin{minipage}{2cm}\baselineskip=5pt---\\title: This is the title \\author: D. Author \\----  \\[1em] Section 1 \\=========== \\[1em] Text with embedded R code \\[1em] mean(rnorm(10)) \\  \#\# 0.1838261 \end{minipage}}{F2}

## \node [anchor=north,TARGET] at ($(F2) + (1.25,-3.5)$) {.md};

## \node at ($(F2.south) + (1.25cm,-6cm)$) {\begin{tikzpicture}\Arrow{0,0}{2}{0.5}{-90}{A1}\end{tikzpicture}};

## 
## % pandoc

## \node [anchor=north,TARGET,fill=orange!20!white!80,draw=black,thick,minimum width=10cm] at ($(F2.south) + (1.25cm,-8cm)$) (pandoc) {pandoc};

## 
## % docx

## \file{1,-13}{\begin{minipage}{2cm}\includegraphics[width=1.5cm]{../resources/MSW.png}\end{minipage}}{F3}

## \node at ($(F3.north |- pandoc.south) + (1.25cm,-2cm)$) {\begin{tikzpicture}\Arrow{0,0}{2}{0.5}{-90}{A2}\end{tikzpicture}};

## \node [anchor=north,TARGET] at ($(F3.south) + (1.25,-3.5)$) {.docx};

## 
## % html

## \file{4.5,-13}{\begin{minipage}{2cm}\includegraphics[width=1.5cm]{../resources/HTML.png}\end{minipage}}{F4}

## \node at ($(F4.north |- pandoc.south) + (1.25cm,-2cm)$) {\begin{tikzpicture}\Arrow{0,0}{2}{0.5}{-90}{A3}\end{tikzpicture}};

## \node [anchor=north,TARGET] at ($(F4.south) + (1.25,-3.5)$) {.html};

## 
## % pdf

## \file{8,-13}{\begin{minipage}{2cm}\includegraphics[width=1.5cm]{../resources/PDF.png}\end{minipage}}{F5}

## \node at ($(F5.north |- pandoc.south) + (1.25cm,-2cm)$) (Ar4) {\begin{tikzpicture}\Arrow{0,0}{2}{0.5}{-90}{A4}\end{tikzpicture}};

## \node [anchor=north,TARGET] at ($(F5.south) + (1.25,-3.5)$) {.pdf};

## \node [anchor=west,TARGET,rotate around={-90:(Ar4.east)}] at ($(Ar4.east) + (-1cm,0.5cm)$) {\\LaTeX};

## 
## %etc

## \node [anchor=north west,fileText] at ($(11,-13) +(0,-0.1)$) (F6) {...};

## \node at ($(F6.north |- pandoc.south) + (1.25,-2cm)$) (Ar5) {\begin{tikzpicture}\Arrow{0,0}{2}{0.5}{-90}{A5}\end{tikzpicture}};

## \node [anchor=north,TARGET] at ($(F6.south) + (1.25,0.5cm)$) {etc};

## \end{tikzpicture}


## ----pandoc_conv, results='markdown', eval=TRUE, echo=FALSE-------------------
a <- magick::image_read_pdf("resources/pres19.3-pandoc-1.pdf")
b <- magick::image_convert(a, "png")
bb <- magick::image_transparent(b, "white")
magick::image_write(bb, "resources/pres19.3-pandoc-1.png", format = "png")


## NA

## NA

## NA

## ----rmarkdown-reference, results='markdown', eval=TRUE,cache=TRUE, echo=FALSE----
a <- magick::image_read_pdf("../docs/resources/rmarkdown-reference.pdf")
a <- magick::image_scale(a, "10%")
a <- magick::image_convert(a, "png")
magick::image_write(a, "../resources/rmarkdown-reference.png")


## NA

## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## 
## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=0.4]{Inconsolata}}]

## \tikzstyle{docText} = [font={\fontspec[Scale=0.4]{Arial}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## \newcommand{\file}[3] {

##  \coordinate (#3) at (#1);

##  \draw[thick,anchor=top left](#1) -- ++(2,0) -- ++(0.5,-0.5) -- ++(0,-3) -- ++(-2.5,0) -- ++(0,3.5);

##  \draw[thick,anchor=top left]($(#1) +(2,0)$) -- ++(0,-0.5) -- ++(0.5,0); 	

##  \node [anchor=north west,fileText] at ($(#1) +(0,-0.1)$) {#2};

## }

## 
## \newcommand{\doc}[3] {

##  \coordinate (#3) at (#1);

##  \draw[thick,anchor=top left](#1) -- ++(2,0) -- ++(0.5,-0.5) -- ++(0,-3) -- ++(-2.5,0) -- ++(0,3.5);

##  \draw[thick,anchor=top left]($(#1) +(2,0)$) -- ++(0,-0.5) -- ++(0.5,0); 	

##  \node [anchor=north west,docText] at ($(#1) +(0,-0.1)$) {#2};

## }

## 
## \newcommand{\dat}[3] {

##  \coordinate (#3) at (#1);

##  \draw[thick,anchor=top left,color=black!40](#1) -- ++(1.3,0) -- ++(0.5,-0.5) -- ++(0,-1) -- ++(-1.8,0) -- ++(0,1.5);

##  \draw[thick,anchor=top left,color=black!40]($(#1) +(1.3,0)$) -- ++(0,-0.5) -- ++(0.5,0); 	

##  \node [anchor=north west,docText,color=black!40] at ($(#1) +(0,-0.4)$) {#2};

## }

## 
## 
## \newcommand{\Arrow}[5] {

##  \coordinate (#5) at (#1);

##  \draw[thick,rotate around={#4:(#1)}] (#1) -- ++(0,#3*1) -- ++(#2,#3*-0.5) -- ++(0.25*#2*-0.3,#3*0.5) -- ++(0.25*#2*2,#3*-1) -- ++(0.25*#2*-2,#3*-1) -- ++(0.25*#2*0.3,#3*0.5) -- ++(0.25*#2*-4,#3*-0.5) -- ++(0,#3*1) -- cycle;

## }

## 
## \begin{tikzpicture}

## % .Rmd

## \file{0,0}{\begin{minipage}{2cm}\baselineskip=5pt---\\title: This is the title \\author: D. Author \\----  \\[1em] Section 1 \\=========== \\[1em] Text with embedded R code \\[1em] ```{R summary} \\ mean(rnorm(10)) \\ ``` \end{minipage}}{F1}

## \node [anchor=north,TARGET] at ($(F1) + (1.25,-3.5)$) {.Rmd};

## 
## % .csv

## \dat{-3,0.2}{\begin{minipage}{1.5cm}\baselineskip=5pt Reef,Site,Transect,Cover\\1,1,1,0.2\\1,1,2,0.3\end{minipage}}{F0a}

## \node [anchor=north,TARGET,color=black!40] at ($(F0a) + (0.75,-1.5)$) {\tiny .csv};

## \draw [->, dashed, color=black!40] ($(F0a) +(2,-0.5)$) -- ($(F1) +(-0.2,-0.5)$);

## 
## % .R

## \dat{-3,-2.2}{\begin{minipage}{1.5cm}\baselineskip=5pt tmp=rnorm(10)\\summary(tmp)\end{minipage}}{F0b}

## \node [anchor=north,TARGET,color=black!40] at ($(F0b) + (0.75,-1.5)$) {\tiny .R};

## \draw [->, dashed, color=black!40] ($(F0b) +(2,-0.5)$) -- ($(F1) +(-0.2,-2.5)$);

## 
## 
## % .md

## \file{6,0}{\begin{minipage}{2cm}\baselineskip=5pt---\\title: This is the title \\author: D. Author \\----  \\[1em] Section 1 \\=========== \\[1em] Text with embedded R code \\[1em] mean(rnorm(10)) \\  \#\# 0.1838261 \end{minipage}}{F2}

## \node [anchor=north,TARGET] at ($(F2) + (1.25,-3.5)$) {.md};

## 
## \Arrow{3,-2}{2}{0.5}{0}{A1}

## \node [anchor=north,TARGET,anchor=west] at ($(A1) + (0.1,0.0)$) {\small knit};

## 
## % .pdf

## \doc{12,0}{\begin{minipage}{2cm}\baselineskip=5pt\begin{centering} \Large This is the title\\D. Author  \\\end{centering} \large Section 1 \\ \small Text with embedded R code \\[1em] \colorbox{gray!20}{\scalebox{0.5}{\texttt{mean(rnorm(10))}}} \\  \textcolor{red}{\#\# 0.1838261} \end{minipage}}{F3}

## \node [anchor=north,TARGET] at ($(F3) + (1.25,-3.5)$) {.*};

## 
## \Arrow{9,-2}{2}{0.5}{0}{A2}

## \node [anchor=north,TARGET,anchor=west] at ($(A2) + (0.1,0.0)$) {\small pandoc};

## 
## \end{tikzpicture}


## ----knitr_conv, results='markdown', eval=TRUE, echo=FALSE--------------------
a <- magick::image_read_pdf("resources/pres19.3-knitr-1.pdf")
b <- magick::image_convert(a, "png")
bb <- magick::image_transparent(b, "white")
magick::image_write(bb, "resources/pres19.3-knitr-1.png", format <- "png")


## ----rmarkdown, eval=FALSE----------------------------------------------------
## rmarkdown::render("file.Rmd", output_format = "html_document")


## convert  -density 300 -resize 550x resources/Rstudio_Knitr.png resources/RStudio_Knitr_small.png


## `` `{r readData, eval=TRUE}

## mydata <- read.csv('data/myData.csv')

## `` `


## ---

## title: 'Example analysis'

## author: D. Author

## date: 24-07-2021

## ---

## 
## Load the necessary packages.

## `` `{r loadLibraries, eval=TRUE}

## library(tidyverse)

## `` `

## 
## Read in my data

## `` `{r readData, eval=TRUE}

## mydata <- read.csv('data/myData.csv')

## `` `

## 
## Process the data:

## 
## - create a log-transformed version of `Var`

## 
## `` `{r processData, eval=TRUE}

## mydata <- myData %>% mutate(lVar = log(Var))

## `` `


## ---

## title: 'Example analysis'

## author: D. Author

## date: 24-07-2021

## ---

## 
## `` `{r, eval=TRUE}

## knitr::read_chunk('script.R')

## `` `

## 
## Load the necessary packages.

## `` `{r loadLibraries, eval=TRUE}

## `` `

## 
## Read in my data

## `` `{r readData, eval=TRUE}

## `` `

## 
## Process the data:

## 
## - create a log-transformed version of `Var`

## 
## `` `{r processData, eval=TRUE}

## `` `


## ----chunk3, engine='R', results='markdown', eval=FALSE-----------------------
## ##Load the necessary packages.
## 
## ## ----loadLibraries
## library(tidyverse)
## ## ----
## 
## ##Read in my data
## 
## ## ----readData
## mydata <- read.csv('data/myData.csv')
## ## ----
## 
## ## Process the data:
## ## - create a log-transformed version of `Var`
## 
## ## ----processData
## mydata <- myData %>% mutate(lVar = log(Var))
## ## ----


## ----installing, results='markdown', eval=FALSE-------------------------------
## install.packages("dplyr")


## ----namespaces, results='markdown', eval=FALSE-------------------------------
## install.packages("dplyr::select()")


## ----polymorphism, results='markdown', eval=TRUE------------------------------
mean


## ----polymorphism1, results='markdown', eval=TRUE-----------------------------
base:::mean.default


## convert  -density 300 -resize 650x resources/Rstudio_lintr.png resources/RStudio_lintr_small.png

