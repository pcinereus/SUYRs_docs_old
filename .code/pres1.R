## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----base-r, cache=TRUE,echo=FALSE--------------------------------------------
system("convert -resize 650x ../resources/base-r.pdf ../resources/base-r.png")
system("mv ../resources/base-r-0.png ../resources/base-r.png") 


## ----rstudio-ide, cache=TRUE,echo=FALSE---------------------------------------
system("convert -resize 650x ../resources/rstudio-ide.pdf ../resources/rstudio-ide.png")
system("mv ../resources/rstudio-ide-0.png ../resources/rstudio-ide.png") 


## ----installing, results='markdown', eval=FALSE-------------------------------
## install.packages("tidyverse")


## ----library, results='markdown', eval=TRUE-----------------------------------
library("dplyr")


## ----library1, results='markdown', eval=TRUE----------------------------------
library("tidyverse")


## ----namespaces, results='markdown', eval=FALSE-------------------------------
## stats::filter()
## dplyr::filter()


## ----polymorphism, results='markdown', eval=TRUE------------------------------
mean


## ----polymorphism1, results='markdown', eval=TRUE-----------------------------
base:::mean.default


## ----rmarkdown, cache=FALSE, echo=FALSE---------------------------------------
system("convert -resize 650x ../resources/rmarkdown.pdf ../resources/rmarkdown.png")
system("mv ../resources/rmarkdown-0.png ../resources/rmarkdown.png")

