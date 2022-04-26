## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----base-r, cache=TRUE,echo=FALSE--------------------------------------------
system("convert -resize 650x ../resources/base-r.pdf ../resources/base-r.png")
system("mv ../resources/base-r-0.png ../resources/base-r.png") 


## ----rstudio-ide, cache=TRUE,echo=FALSE---------------------------------------
system("convert -resize 650x ../resources/rstudio-ide.pdf ../resources/rstudio-ide.png")
system("mv ../resources/rstudio-ide-0.png ../resources/rstudio-ide.png") 


## ----rmarkdown, cache=FALSE, echo=FALSE---------------------------------------
system("convert -resize 650x ../resources/rmarkdown.pdf ../resources/rmarkdown.png")
system("mv ../resources/rmarkdown-0.png ../resources/rmarkdown.png")

