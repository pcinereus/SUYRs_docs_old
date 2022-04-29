## ----setup, include=FALSE,warning=FALSE, message=FALSE------------------------
knitr::opts_chunk$set(echo = TRUE,warning=FALSE, message=FALSE)
options(tinytex.engine = 'xelatex')
cleanRmdInput <- function(x) {
#x <- gsub("```\\{r","```markdown\n`r ''```\\{r",x)
x <- gsub("^```$","`` `",x)  # the Makefile will then change this back to ``` after pandoc
x
}


## ----libraries, results='markdown', eval=FALSE, warning=TRUE, message=FALSE----
## library(rmarkdown) #to render rmarkdown documents
## library(tidyverse) #for data wrangling and plotting
## library(rmarkdown)
## library(bookdown)
## library(knitr)
## library(kableExtra)
## library(flextable)
## library(rticles)
## library(sysfonts)


## ----examples, results='hide', eval=TRUE, echo=FALSE, cache=TRUE--------------
markdown = 
"---
output:
  pdf_document:
    latex_engine: xelatex    
geometry: paperwidth=10cm,paperheight=10cm,hmargin=1cm,vmargin=1cm
documentclass: article
mainfont: Arial
include-before: \\pagestyle{empty}
...
The rate of oxygen consumption (O~2~ per min^-1^.mg^2^) ...

Effect~Oxygen\ concentration~ 
 
\\newpage

Section 1
===========

Subsection
------------
 
### Subsubsection

# Section 2

## Subsection 

### Subsection 

\\newpage 

Normal text
  
> This is a block quotation.  Block quotations are specified by
> proceeding each line with a > character.  The quotation block
> will be indented.
>
> To have paragraphs in block quotations, separate paragraphs
> with a line containing only the block quotation mark character.

\\newpage

Normal text
    
~~~~
a = rnorm(10,5,2)
for (i in 1:10) {
 print(a[1])
}
~~~~

\\newpage 

Bullet list

* This is the first bullet item
* This is the second.  
  To indent this sentence on the next line,
  the previous line ended in two spaces and
  this sentence is indented by four spaces.
* This is the third item

\\newpage

Ordered list

1. This is the first numbered item.
2. This is the second.
1. This is the third item.  Note that the number I supplied is ignored

(i) This is list with roman numeral enumerators
(ii) Another item

\\newpage

Definition list

Term 1
    :  This is the definition of this term

This is a phrase
    :  This is the definition of the phrase

\\newpage

Nested lists

1. This is the first numbered item.
2. This is the second.
    i) this is a sub-point
    ii) and another sub-point
1. This is the third item.  Note that the number I supplied is ignored

\\newpage

1. This is the first numbered item.
2. This is the second.
1. This is the third item.  Note that the number I supplied is ignored
    
<!-- -->
  
1. Another list.
2. With more points

\\newpage

Horizontal lines are defined by a row of three or more *, - or _ characters.

***

More text

--------

\\newpage

The formula, $y=mx+c$, is displayed inline.

Some symbols and equations (such as 
$\\sum{x}$ or $\\frac{1}{2}$) are rescaled 
to prevent disruptions to the regular 
line spacing.
For more voluminous equations (such as 
$\\sum{\\frac{(\\mu - \\bar{x})^2}{n-1}}$), 
some line spacing disruptions are unavoidable.  
Math should then be displayed in display mode.
$$\\sum{\\frac{(\\mu - \\bar{x})^2}{n-1}}$$ 

\\newpage

# Introduction {#sec:Intro}

# Section 2
See the [introduction](#sec:Intro).

\\newpage

\\clearpage\\newpage


![Figure caption](AIMS_wq.jpg)

\\clearpage\\newpage


To create a footnote[^note1]

[^note1]: A footnote marker cannot contain any spaces.

" 
writeLines(markdown,con="../resources/Rmarkdown-examples/example0.Rmd")
#system("echo \"library(rmarkdown); render('../resources/Rmarkdown-examples/example0.Rmd', output_format='pdf_document')\" | R --no-save --no-restore")
system("cd ../resources/Rmarkdown-examples;  echo \"library(rmarkdown); render('example0.Rmd', output_format='pdf_document')\" | R --no-save --no-restore")

#system("convert -trim -density 300 -resize 66% ../resources/Rmarkdown-examples/example0.pdf -bordercolor white -border 10x10 ../resources/Rmarkdown-examples/example0.png")
system("cd ../resources/Rmarkdown-examples; convert -trim -density 300 -resize 66% example0.pdf -bordercolor white -border 10x10 example0.png")

system("cp ../resources/Rmarkdown-examples/example0* ../docs/resources/Rmarkdown-examples/Rmarkdown-examples/")
 


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

## \node [anchor=north,TARGET,fill=white,draw=black,minimum width=10cm] at ($(F2.south) + (1.25cm,-8cm)$) (pandoc) {pandoc};

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


## cp ../resources/Rmarkdown-examples/example1.md ../docs/resources/Rmarkdown-examples/example1.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example1.pdf ../docs/resources/Rmarkdown-examples/example1.md

## pandoc -o example1.pdf example1.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example1.pdf ../docs/resources/Rmarkdown-examples/example1.png

## convert ../docs/resources/Rmarkdown-examples/example1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example1.png


## cp ../resources/example1.md ../docs/resources/Rmarkdown-examples/example1.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example1.html ../docs/resources/Rmarkdown-examples/example1.md

## pandoc -s -o example1.html example1.md


## cp ../resources/example1.md ../docs/resources/Rmarkdown-examples/example1.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example1.docx ../docs/resources/Rmarkdown-examples/example1.md

## pandoc -o example1.docx example1.md


## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example1doc.pdf ../docs/resources/Rmarkdown-examples/example1.docx

## convert ../docs/resources/Rmarkdown-examples/example1doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example1doc.png


## ---

## title: This is the title

## author:

##     - name D. Author

##     - name D. Other

## date: 14-02-2013

## ---


## ---

## title: This is the title

## author: D. Author

## date: 14-02-2013

## output:

##   html_document:

##     toc: yes

## ---


## The rate of oxygen consumption (O~2~ per min^-1^.mg^2^) ...

## 				

## Effect~Oxygen\ concentration~


## ----simple_eg1a_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-0.png')


## NA

## cp ../resources/Rmarkdown-examples/example2.md ../docs/resources/Rmarkdown-examples/example2.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example2.pdf ../docs/resources/Rmarkdown-examples/example2.md

## pandoc -o example2.pdf example2.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example2.pdf ../docs/resources/Rmarkdown-examples/example2.png

## convert ../docs/resources/Rmarkdown-examples/example2.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example2.png


## cp ../resources/example2.md ../docs/resources/Rmarkdown-examples/example2.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example2.html ../docs/resources/Rmarkdown-examples/example2.md

## pandoc -s -o example2.html example2.md


## cp ../resources/example2.md ../docs/resources/Rmarkdown-examples/example2.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example2.docx ../docs/resources/Rmarkdown-examples/example2.md

## pandoc -o example2.docx example2.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example2doc.pdf ../docs/resources/Rmarkdown-examples/example2.docx

## convert ../docs/resources/Rmarkdown-examples/example2doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example2doc.png


## Section 1

## ===========

## 
## Subsection

## ------------

## 
## ### Subsubsection

## 
## # Section 2

## 
## ## Subsection

## 
## ### Subsection


## ----simple_eg2a_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-1.png')


## NA

## cp ../resources/Rmarkdown-examples/example3a.md ../docs/resources/Rmarkdown-examples/example3a.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example3a.pdf ../docs/resources/Rmarkdown-examples/example3a.md

## pandoc -o example3a.pdf example3a.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example3a.pdf ../docs/resources/Rmarkdown-examples/example3a.png

## convert ../docs/resources/Rmarkdown-examples/example3a.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example3a.png


## cp ../resources/example3a.md ../docs/resources/Rmarkdown-examples/example3a.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example3a.html ../docs/resources/Rmarkdown-examples/example3a.md

## pandoc -s -o example3a.html example3a.md


## cp ../resources/example3a.md ../docs/resources/Rmarkdown-examples/example3a.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example3a.docx ../docs/resources/Rmarkdown-examples/example3a.md

## pandoc -o example3a.docx example3a.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example3adoc.pdf ../docs/resources/Rmarkdown-examples/example3a.docx

## convert ../docs/resources/Rmarkdown-examples/example3adoc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example3adoc.png


## Section 1

## ===========

## 
## Subsection

## ------------

## 
## ### Subsubsection

## 
## # Section 2

## 
## ## Subsection

## 
## ### Subsection

## ----simple_eg2a_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-1.png')


## NA

## cp ../resources/Rmarkdown-examples/example3b.md ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example3b.pdf ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -o example3b.pdf example3b.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example3b.pdf ../docs/resources/Rmarkdown-examples/example3b.png

## convert ../docs/resources/Rmarkdown-examples/example3b.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example3b.png


## cp ../resources/example3b.md ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example3b.html ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -s -o example3b.html example3b.md


## cp ../resources/example3b.md ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example3b.docx ../docs/resources/Rmarkdown-examples/example3b.md


## pandoc -o example3b.docx example3b.md


## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example3bdoc.pdf ../docs/resources/Rmarkdown-examples/example3b.docx

## convert ../docs/resources/Rmarkdown-examples/example3bdoc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example3bdoc.png


## NA

## cp ../resources/Rmarkdown-examples/example3b.md ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc --toc -o ../docs/resources/Rmarkdown-examples/example4.pdf ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc --toc -o example3b.pdf example3b.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example4.pdf ../docs/resources/Rmarkdown-examples/example4.png

## convert ../docs/resources/Rmarkdown-examples/example4.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example4.png


## cp ../resources/example3b.md ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -s --toc -o ../docs/resources/Rmarkdown-examples/example4.html ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc -s --toc -o example3b.html example3b.md


## cp ../resources/example3b.md ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc --toc -o ../docs/resources/Rmarkdown-examples/example4.docx ../docs/resources/Rmarkdown-examples/example3b.md

## pandoc --toc -o example4.docx example3b.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example4doc.pdf ../docs/resources/Rmarkdown-examples/example4.docx

## convert ../docs/resources/Rmarkdown-examples/example4doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example4doc.png


## Normal text

## 
## > This is a block quotation.  Block quotations are specified by

## > proceeding each line with a > character.  The quotation block

## > will be indented.

## >

## > To have paragraphs in block quotations, separate paragraphs

## > with a line containing only the block quotation mark character.


## ----simple_eg5a_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-2.png')


## NA

## cp ../resources/Rmarkdown-examples/example5.md ../docs/resources/Rmarkdown-examples/example5.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example5.pdf ../docs/resources/Rmarkdown-examples/example5.md

## pandoc -o example5.pdf example5.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example5.pdf ../docs/resources/Rmarkdown-examples/example5.png

## convert ../docs/resources/Rmarkdown-examples/example5.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example5.png


## cp ../resources/example5.md ../docs/resources/Rmarkdown-examples/example5.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example5.html ../docs/resources/Rmarkdown-examples/example5.md

## pandoc -s -o example5.html example5.md


## cp ../resources/example5.md ../docs/resources/Rmarkdown-examples/example5.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example5.docx ../docs/resources/Rmarkdown-examples/example5.md

## pandoc --toc -o example5.docx example5.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example5doc.pdf ../docs/resources/Rmarkdown-examples/example5.docx

## convert ../docs/resources/Rmarkdown-examples/example5doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example5doc.png


## NA

## cp ../resources/Rmarkdown-examples/example6.md ../docs/resources/Rmarkdown-examples/example6.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example6.pdf ../docs/resources/Rmarkdown-examples/example6.md

## pandoc -o example6.pdf example6.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example6.pdf ../docs/resources/Rmarkdown-examples/example6.png

## convert ../docs/resources/Rmarkdown-examples/example6.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example6.png


## cp ../resources/example6.md ../docs/resources/Rmarkdown-examples/example6.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example6.html ../docs/resources/Rmarkdown-examples/example6.md

## pandoc -s -o example6.html example6.md


## cp ../resources/example6.md ../docs/resources/Rmarkdown-examples/example6.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example6.docx ../docs/resources/Rmarkdown-examples/example6.md

## pandoc --toc -o example6.docx example6.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example6doc.pdf ../docs/resources/Rmarkdown-examples/example6.docx

## convert ../docs/resources/Rmarkdown-examples/example6doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example6doc.png


## Normal text

## 
## ~~~~

## a = rnorm(10,5,2)

## for (i in 1:10) {

##   print(a[1])

## }

## ~~~~


## ----simple_eg7_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-3.png')


## NA

## cp ../resources/Rmarkdown-examples/example7.md ../docs/resources/Rmarkdown-examples/example7.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example7.pdf ../docs/resources/Rmarkdown-examples/example7.md

## pandoc -o example7.pdf example7.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example7.pdf ../docs/resources/Rmarkdown-examples/example7.png

## convert ../docs/resources/Rmarkdown-examples/example7.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example7.png


## cp ../resources/example7.md ../docs/resources/Rmarkdown-examples/example7.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example7.html ../docs/resources/Rmarkdown-examples/example7.md

## pandoc -s -o example7.html example7.md


## cp ../resources/example7.md ../docs/resources/Rmarkdown-examples/example7.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example7.docx ../docs/resources/Rmarkdown-examples/example7.md

## pandoc --toc -o example7.docx example7.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example7doc.pdf ../docs/resources/Rmarkdown-examples/example7.docx

## convert ../docs/resources/Rmarkdown-examples/example7doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example7doc.png


## Bullet list

## 
## * This is the first bullet item

## * This is the second.

##   To indent this sentence on the next line,

##     the previous line ended in two spaces and

##     this sentence is indented by four spaces.

## * This is the third item


## ----simple_eg8_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-4.png')


## NA

## cp ../resources/Rmarkdown-examples/example8.md ../docs/resources/Rmarkdown-examples/example8.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example8.pdf ../docs/resources/Rmarkdown-examples/example8.md

## pandoc -o example8.pdf example8.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example8.pdf ../docs/resources/Rmarkdown-examples/example8.png

## convert ../docs/resources/Rmarkdown-examples/example8.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example8.png


## cp ../resources/Rmarkdown-examples/example8.md ../docs/resources/Rmarkdown-examples/example8.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example8.html ../docs/resources/Rmarkdown-examples/example8.md

## pandoc -s -o example8.html example8.md


## cp ../resources/Rmarkdown-examples/example8.md ../docs/resources/Rmarkdown-examples/example8.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example8.docx ../docs/resources/Rmarkdown-examples/example8.md

## pandoc --toc -o example8.docx example8.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example8doc.pdf ../docs/resources/Rmarkdown-examples/example8.docx

## convert ../docs/resources/Rmarkdown-examples/example8doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example8doc.png


## Ordered list

## 
## 1. This is the first numbered item.

## 2. This is the second.

## 1. This is the third item.  Note that the number I supplied is ignored

## 
## (i) This is list with roman numeral enumerators

## (ii) Another item


## ----simple_eg9_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-5.png')


## NA

## cp ../resources/Rmarkdown-examples/example9.md ../docs/resources/Rmarkdown-examples/example9.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example9.pdf ../docs/resources/Rmarkdown-examples/example9.md

## pandoc -o example9.pdf example9.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example9.pdf ../docs/resources/Rmarkdown-examples/example9.png

## convert ../docs/resources/Rmarkdown-examples/example9.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example9.png


## cp ../resources/Rmarkdown-examples/example9.md ../docs/resources/Rmarkdown-examples/example9.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example9.html ../docs/resources/Rmarkdown-examples/example9.md

## pandoc -s -o example9.html example9.md


## cp ../resources/Rmarkdown-examples/example9.md ../docs/resources/Rmarkdown-examples/example9.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example9.docx ../docs/resources/Rmarkdown-examples/example9.md

## pandoc --toc -o example9.docx example9.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example9doc.pdf ../docs/resources/Rmarkdown-examples/example9.docx

## convert ../docs/resources/Rmarkdown-examples/example9doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example9doc.png


## Definition list

## 
## Term 1

##     :  This is the definition of this term

## 
## This is a phrase

##     :  This is the definition of the phrase


## ----simple_eg10_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-6.png')


## NA

## cp ../resources/Rmarkdown-examples/example10.md ../docs/resources/Rmarkdown-examples/example10.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example10.pdf ../docs/resources/Rmarkdown-examples/example10.md

## pandoc -o example10.pdf example10.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example10.pdf ../docs/resources/Rmarkdown-examples/example10.png

## convert ../docs/resources/Rmarkdown-examples/example10.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example10.png


## cp ../resources/Rmarkdown-examples/example10.md ../docs/resources/Rmarkdown-examples/example10.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example10.html ../docs/resources/Rmarkdown-examples/example10.md

## pandoc -s -o example10.html example10.md


## cp ../resources/Rmarkdown-examples/example10.md ../docs/resources/Rmarkdown-examples/example10.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example10.docx ../docs/resources/Rmarkdown-examples/example10.md

## pandoc --toc -o example10.docx example10.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example10doc.pdf ../docs/resources/Rmarkdown-examples/example10.docx

## convert ../docs/resources/Rmarkdown-examples/example10doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example10doc.png


## Nested lists

## 
## 1. This is the first numbered item.

## 2. This is the second.

##    i) this is a sub-point

##    ii) and another sub-point

## 1. This is the third item.  Note that the number I supplied is ignored


## ----simple_eg11_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-7.png')


## NA

## cp ../resources/Rmarkdown-examples/example11.md ../docs/resources/Rmarkdown-examples/example11.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example11.pdf ../docs/resources/Rmarkdown-examples/example11.md

## pandoc -o example11.pdf example11.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example11.pdf ../docs/resources/Rmarkdown-examples/example11.png

## convert ../docs/resources/Rmarkdown-examples/example11.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example11.png


## cp ../resources/Rmarkdown-examples/example11.md ../docs/resources/Rmarkdown-examples/example11.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example11.html ../docs/resources/Rmarkdown-examples/example11.md

## pandoc -s -o example11.html example11.md


## cp ../resources/Rmarkdown-examples/example11.md ../docs/resources/Rmarkdown-examples/example11.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example11.docx ../docs/resources/Rmarkdown-examples/example11.md

## pandoc --toc -o example11.docx example11.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example11doc.pdf ../docs/resources/Rmarkdown-examples/example11.docx

## convert ../docs/resources/Rmarkdown-examples/example11doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example11doc.png


## 1. This is the first numbered item.

## 2. This is the second.

## 1. This is the third item.  Note that the number I supplied is ignored

## 
## <-- --!>

## 
## 1. Another list.

## 2. With more points


## ----simple_eg12_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-8.png')


## NA

## cp ../resources/Rmarkdown-examples/example12.md ../docs/resources/Rmarkdown-examples/example12.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example12.pdf ../docs/resources/Rmarkdown-examples/example12.md

## pandoc -o example12.pdf example12.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example12.pdf ../docs/resources/Rmarkdown-examples/example12.png

## convert ../docs/resources/Rmarkdown-examples/example12.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example12.png


## cp ../resources/Rmarkdown-examples/example12.md ../docs/resources/Rmarkdown-examples/example12.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example12.html ../docs/resources/Rmarkdown-examples/example12.md

## pandoc -s -o example12.html example12.md


## cp ../resources/Rmarkdown-examples/example12.md ../docs/resources/Rmarkdown-examples/example12.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example12.docx ../docs/resources/Rmarkdown-examples/example12.md

## pandoc -o example12.docx example12.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example12doc.pdf ../docs/resources/Rmarkdown-examples/example12.docx

## convert ../docs/resources/Rmarkdown-examples/example12doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example12doc.png


## NA

## cp ../resources/Rmarkdown-examples/example13a.md ../docs/resources/Rmarkdown-examples/example13a.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13a.pdf ../docs/resources/Rmarkdown-examples/example13a.md

## pandoc -o example13a.pdf example13a.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example13a.pdf ../docs/resources/Rmarkdown-examples/example13a.png

## convert ../docs/resources/Rmarkdown-examples/example13a.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13a.png


## cp ../resources/Rmarkdown-examples/example13a.md ../docs/resources/Rmarkdown-examples/example13a.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example13a.html ../docs/resources/Rmarkdown-examples/example13a.md

## pandoc -s -o example13a.html example13a.md


## cp ../resources/Rmarkdown-examples/example13a.md ../docs/resources/Rmarkdown-examples/example13a.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13a.docx ../docs/resources/Rmarkdown-examples/example13a.md

## pandoc --toc -o example13a.docx example13a.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example13adoc.pdf ../docs/resources/Rmarkdown-examples/example13a.docx

## convert ../docs/resources/Rmarkdown-examples/example13adoc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13adoc.png


## NA

## cp ../resources/Rmarkdown-examples/example13b.md ../docs/resources/Rmarkdown-examples/example13b.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13b.pdf ../docs/resources/Rmarkdown-examples/example13b.md

## pandoc -o example13b.pdf example13b.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example13b.pdf ../docs/resources/Rmarkdown-examples/example13b.png

## convert ../docs/resources/Rmarkdown-examples/example13b.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13b.png


## cp ../resources/Rmarkdown-examples/example13b.md ../docs/resources/Rmarkdown-examples/example13b.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example13b.html ../docs/resources/Rmarkdown-examples/example13b.md

## pandoc -s -o example13b.html example13b.md


## cp ../resources/Rmarkdown-examples/example13b.md ../docs/resources/Rmarkdown-examples/example13b.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13b.docx ../docs/resources/Rmarkdown-examples/example13b.md

## pandoc --toc -o example13b.docx example13b.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example13bdoc.pdf ../docs/resources/Rmarkdown-examples/example13b.docx

## convert ../docs/resources/Rmarkdown-examples/example13bdoc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13bdoc.png


## NA

## cp ../resources/Rmarkdown-examples/example13c.md ../docs/resources/Rmarkdown-examples/example13c.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13c.pdf ../docs/resources/Rmarkdown-examples/example13c.md

## pandoc -o example13c.pdf example13c.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example13c.pdf ../docs/resources/Rmarkdown-examples/example13c.png

## convert ../docs/resources/Rmarkdown-examples/example13c.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13c.png


## cp ../resources/Rmarkdown-examples/example13c.md ../docs/resources/Rmarkdown-examples/example13c.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example13c.html ../docs/resources/Rmarkdown-examples/example13c.md

## pandoc -s -o example13c.html example13c.md


## cp ../resources/Rmarkdown-examples/example13c.md ../docs/resources/Rmarkdown-examples/example13c.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13c.docx ../docs/resources/Rmarkdown-examples/example13c.md

## pandoc --toc -o example13c.docx example13c.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example13cdoc.pdf ../docs/resources/Rmarkdown-examples/example13c.docx

## convert ../docs/resources/Rmarkdown-examples/example13cdoc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13cdoc.png


## NA

## cp ../resources/Rmarkdown-examples/example13d.md ../docs/resources/Rmarkdown-examples/example13d.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13d.pdf ../docs/resources/Rmarkdown-examples/example13d.md

## pandoc -o example13d.pdf example13d.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example13d.pdf ../docs/resources/Rmarkdown-examples/example13d.png

## convert ../docs/resources/Rmarkdown-examples/example13d.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13d.png


## cp ../resources/Rmarkdown-examples/example13d.md ../docs/resources/Rmarkdown-examples/example13d.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example13d.html ../docs/resources/Rmarkdown-examples/example13d.md

## pandoc -s -o example13d.html example13d.md


## cp ../resources/Rmarkdown-examples/example13d.md ../docs/resources/Rmarkdown-examples/example13d.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example13d.docx ../docs/resources/Rmarkdown-examples/example13d.md

## pandoc --toc -o example13d.docx example13d.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example13ddoc.pdf ../docs/resources/Rmarkdown-examples/example13d.docx

## convert ../docs/resources/Rmarkdown-examples/example13ddoc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example13ddoc.png


## ![in text label](filename)

## #OR

## ![label]

## [label]: filename


## ![Figure caption](AIMS_wq.jpg)


## ----simple_eg14_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-12.png')


## NA

## cp ../resources/Rmarkdown-examples/example14.md ../docs/resources/Rmarkdown-examples/example14.md

## ## pandoc -o ../docs/resources/Rmarkdown-examples/example14.pdf ../docs/resources/Rmarkdown-examples/example14.md

## cd ../docs/resources/Rmarkdown-examples; pandoc -o example14.pdf example14.md

## pandoc -o example14.pdf example14.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example14.pdf ../docs/resources/Rmarkdown-examples/example14.png

## convert ../docs/resources/Rmarkdown-examples/example14.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example14.png


## cp ../resources/Rmarkdown-examples/example14.md ../docs/resources/Rmarkdown-examples/example14.md

## ## pandoc -s -o ../docs/resources/Rmarkdown-examples/example14.html ../docs/resources/Rmarkdown-examples/example14.md

## cd ../docs/resources/Rmarkdown-examples; pandoc -s -o example14.html example14.md

## pandoc -s -o example14.html example14.md


## cp ../resources/Rmarkdown-examples/example14.md ../docs/resources/Rmarkdown-examples/example14.md

## ## pandoc -o ../docs/resources/Rmarkdown-examples/example14.docx ../docs/resources/Rmarkdown-examples/example14.md

## cd ../docs/resources/Rmarkdown-examples; pandoc -o example14.docx example14.md

## pandoc -o example14.docx example14.md

## unoconv -f pdf -o ../docs/resources/Rmarkdown-examples/example14doc.pdf -e PageRange=1 ../docs/resources/Rmarkdown-examples/example14.docx

## convert ../docs/resources/Rmarkdown-examples/example14doc.pdf[0] -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example14doc.png


## The formula, $y=mx+c$, is displayed inline.

## 
## Some symbols and equations (such as

## $\sum{x}$ or $\frac{1}{2}$) are rescaled

## to prevent disruptions to the regular

## line spacing.

## For more voluminous equations (such as

## $\sum{\frac{(\mu - \bar{x})^2}{n-1}}$),

## some line spacing disruptions are unavoidable.

## Math should then be displayed in display mode.

## $$\sum{\frac{(\mu - \bar{x})^2}{n-1}}$$


## ----simple_eg15_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-10.png')


## NA

## cp ../resources/Rmarkdown-examples/example15.md ../docs/resources/Rmarkdown-examples/example15.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example15.pdf ../docs/resources/Rmarkdown-examples/example15.md

## pandoc -o example15.pdf example15.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example15.pdf ../docs/resources/Rmarkdown-examples/example15.png

## convert ../docs/resources/Rmarkdown-examples/example15.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example15.png


## cp ../resources/Rmarkdown-examples/example15.md ../docs/resources/Rmarkdown-examples/example15.md

## pandoc --mathjax -s -o ../docs/resources/Rmarkdown-examples/example15.html ../docs/resources/Rmarkdown-examples/example15.md

## pandoc --mathjax -s -o example15.html example15.md


## cp ../resources/Rmarkdown-examples/example15.md ../docs/resources/Rmarkdown-examples/example15.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example15.docx ../docs/resources/Rmarkdown-examples/example15.md

## pandoc -o example15.docx example15.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example15doc.pdf ../docs/resources/Rmarkdown-examples/example15.docx

## convert ../docs/resources/Rmarkdown-examples/example15doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example15doc.png


## [in text label](#Reference label)


## # Introduction {#sec:Intro}

## 
## # Section 2

## See the [introduction](#sec:Intro).


## ----simple_eg16_1_out, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf"'----
knitr::include_graphics('../resources/Rmarkdown-examples/example0-11.png')


## NA

## cp ../resources/Rmarkdown-examples/example16.md ../docs/resources/Rmarkdown-examples/example16.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example16.pdf ../docs/resources/Rmarkdown-examples/example16.md

## pandoc -o example16.pdf example16.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example16.pdf ../docs/resources/Rmarkdown-examples/example16.png

## convert ../docs/resources/Rmarkdown-examples/example16.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example16.png


## cp ../resources/Rmarkdown-examples/example16.md ../docs/resources/Rmarkdown-examples/example16.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example16.html ../docs/resources/Rmarkdown-examples/example16.md

## pandoc -s -o example16.html example16.md


## cp ../resources/Rmarkdown-examples/example16.md ../docs/resources/Rmarkdown-examples/example16.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example16.docx ../docs/resources/Rmarkdown-examples/example16.md

## pandoc -o example16.docx example16.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example16doc.pdf ../docs/resources/Rmarkdown-examples/example16.docx

## convert ../docs/resources/Rmarkdown-examples/example16doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example16doc.png


## [in text label](Reference label)


## NA

## cp ../resources/Rmarkdown-examples/example17.md ../docs/resources/Rmarkdown-examples/example17.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example17.pdf ../docs/resources/Rmarkdown-examples/example17.md

## pandoc -o example17.pdf example17.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example17.pdf ../docs/resources/Rmarkdown-examples/example17.png

## convert ../docs/resources/Rmarkdown-examples/example17.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example17.png


## cp ../resources/Rmarkdown-examples/example17.md ../docs/resources/Rmarkdown-examples/example17.md

## pandoc -s -o ../docs/resources/Rmarkdown-examples/example17.html ../docs/resources/Rmarkdown-examples/example17.md

## pandoc -s -o example17.html example17.md


## cp ../resources/Rmarkdown-examples/example17.md ../docs/resources/Rmarkdown-examples/example17.md

## pandoc -o ../docs/resources/Rmarkdown-examples/example17.docx ../docs/resources/Rmarkdown-examples/example17.md

## pandoc -o example17.docx example17.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example17doc.pdf ../docs/resources/Rmarkdown-examples/example17.docx

## convert ../docs/resources/Rmarkdown-examples/example17doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example17doc.png


## NA

## cp ../resources/Rmarkdown-examples/example18.md ../docs/resources/Rmarkdown-examples/example18.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o ../docs/resources/Rmarkdown-examples/example18.pdf ../docs/resources/Rmarkdown-examples/example18.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o example18.pdf example18.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example18.pdf ../docs/resources/Rmarkdown-examples/example18.png

## convert ../docs/resources/Rmarkdown-examples/example18.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example18.png


## cp ../resources/Rmarkdown-examples/example18.md ../docs/resources/Rmarkdown-examples/example18.md

## pandoc -F pandoc-crossref --citeproc --number-sections -s -o ../docs/resources/Rmarkdown-examples/example18.html ../docs/resources/Rmarkdown-examples/example18.md

## pandoc -F pandoc-crossref --citeproc --number-sections -s -o example18.html example18.md


## cp ../resources/Rmarkdown-examples/example18.md ../docs/resources/Rmarkdown-examples/example18.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o ../docs/resources/Rmarkdown-examples/example18.docx ../docs/resources/Rmarkdown-examples/example18.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o example18.docx example18.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example18doc.pdf ../docs/resources/Rmarkdown-examples/example18.docx

## convert ../docs/resources/Rmarkdown-examples/example18doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example18doc.png


## @article{Bolker-2008-127,

##     author = {Bolker, B. M. and Brooks, M. E. and Clark, C. J. and Geange, S. W. and Poulsen,

##         J. R. and Stevens, H. H. and White, J. S.},

##     journal = {Trends in Ecology and Evolution},

##     number = {3},

##     pages = {127-135},

##     title = {Generalized linear mixed models: a practical guide for ecology and evolution},

##     volume = {24},

##     year = {2008}

## }

## 
## @book{goossens93,

##     author    = "Michel Goossens and Frank Mittlebach and Alexander Samarin",

##     title     = "The LaTeX Companion",

##     year      = "1993",

##     publisher = "Addison-Wesley",

##     address   = "Reading, Massachusetts"

## }


## NA

## cp ../resources/Rmarkdown-examples/example19.md ../docs/resources/Rmarkdown-examples/example19.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o ../docs/resources/Rmarkdown-examples/example19.pdf ../docs/resources/Rmarkdown-examples/example19.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o example19.pdf example19.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/example19.pdf ../docs/resources/Rmarkdown-examples/example19.png

## convert ../docs/resources/Rmarkdown-examples/example19.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example19.png


## cp ../resources/Rmarkdown-examples/example19.md ../docs/resources/Rmarkdown-examples/example19.md

## pandoc -F pandoc-crossref --citeproc --number-sections -s -o ../docs/resources/Rmarkdown-examples/example19.html ../docs/resources/Rmarkdown-examples/example19.md

## pandoc -F pandoc-crossref --citeproc --number-sections -s -o example19.html example19.md


## cp ../resources/Rmarkdown-examples/example19.md ../docs/resources/Rmarkdown-examples/example19.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o ../docs/resources/Rmarkdown-examples/example19.docx ../docs/resources/Rmarkdown-examples/example19.md

## pandoc -F pandoc-crossref --citeproc --number-sections -o example19.docx example19.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/example19doc.pdf ../docs/resources/Rmarkdown-examples/example19.docx

## convert ../docs/resources/Rmarkdown-examples/example19doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/example19doc.png


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


## NA

## cp ../resources/Rmarkdown-examples/Example1.Rmd ../docs/resources/Rmarkdown-examples/Example1.Rmd

## echo 'library(knitr); knit("../docs/resources/Rmarkdown-examples/Example1.Rmd", output="../docs/resources/Rmarkdown-examples/Example1.md")' | R --no-save --no-restore

## pandoc -o ../docs/resources/Rmarkdown-examples/Example1.pdf ../docs/resources/Rmarkdown-examples/Example1.md

## echo 'library(knitr); knit("Example1.Rmd", output="Example1.md")' | R --no-save --no-restore

## pandoc -o Example1.pdf Example1.md

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/Example1.pdf ../docs/resources/Rmarkdown-examples/Example1.png

## convert ../docs/resources/Rmarkdown-examples/Example1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example1.png


## cp ../resources/Example1.Rmd ../docs/resources/Rmarkdown-examples/Example1.Rmd

## echo 'library(knitr); knit("../docs/resources/Rmarkdown-examples/Example1.Rmd", output="../docs/resources/Rmarkdown-examples/Example1.md")' | R --no-save --no-restore

## pandoc -s -o ../docs/resources/Rmarkdown-examples/Example1.html ../docs/resources/Rmarkdown-examples/Example1.md

## echo 'library(knitr); knit("Example1.Rmd", output="Example1.md")' | R --no-save --no-restore

## pandoc -s -o Example1.html Example1.md


## cp ../resources/Example1.Rmd ../docs/resources/Rmarkdown-examples/Example1.Rmd

## echo 'library(knitr); knit("../docs/resources/Rmarkdown-examples/Example1.Rmd", output="../docs/resources/Rmarkdown-examples/Example1.md")' | R --no-save --no-restore

## pandoc -o ../docs/resources/Rmarkdown-examples/Example1.docx ../docs/resources/Rmarkdown-examples/Example1.md

## echo 'library(knitr); knit("Example1.Rmd", output="Example1.md")' | R --no-save --no-restore

## pandoc -s -o Example1.docx Example1.md

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example1doc.pdf ../docs/resources/Rmarkdown-examples/Example1.docx

## convert ../docs/resources/Rmarkdown-examples/Example1doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example1doc.png


## ----Rmarkdowntemplate, eval=FALSE--------------------------------------------
## rmarkdown::render('file.Rmd', output_format='pdf_document')


## NA

## cp ../resources/Rmarkdown-examples/Example1.Rmd ../docs/resources/Rmarkdown-examples/Example1_1.Rmd

## ----Rmarkdown_pdf1_1b, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=FALSE, dependson='Rmarkdown1_1'----
rmarkdown::render('../docs/resources/Rmarkdown-examples/Example1_1.Rmd', output_format='pdf_document', output_dir='../docs/resources/Rmarkdown-examples/') 

## ----Rmarkdown_pdf1_1c, engine='R', results='asis', eval=FALSE----------------
## library(rmarkdown)
## render('Example1.Rmd', output_format='pdf_document')

## convert -density 300 -resize 50% -shave 100x50 ../docs/resources/Rmarkdown-examples/Example1_1.pdf ../docs/resources/Rmarkdown-examples/Example1_1.png

## convert ../docs/resources/Rmarkdown-examples/Example1_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example1_1.png


## cp ../resources/Rmarkdown-examples/Example1.Rmd ../docs/resources/Rmarkdown-examples/Example1_1.Rmd

## ----Rmarkdown_html1_1b, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=FALSE, dependson='Rmarkdown1_1'----
rmarkdown::render('../docs/resources/Rmarkdown-examples/Example1_1.Rmd', output_format='html_document', output_dir='../docs/resources/Rmarkdown-examples/')  

## ----Rmarkdown_html1_1c, engine='R', results='asis', eval=FALSE---------------
## library(rmarkdown)
## render('Example1.Rmd', output_format='html_document')


## cp ../resources/Rmarkdown-examples/Example1.Rmd ../docs/resources/Rmarkdown-examples/Example1_1.Rmd

## ----Rmarkdown_docx1_1b, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=FALSE, dependson='Rmarkdown1_1'----
rmarkdown::render('../docs/resources/Rmarkdown-examples/Example1_1.Rmd', output_format='word_document', output_dir='../docs/resources/Rmarkdown-examples/')  


## ----Rmarkdown_docx1_1c, engine='R', results='asis', eval=FALSE---------------
## library(rmarkdown)
## render('Example1.Rmd', output_format='word_document')

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example1_1doc.pdf ../docs/resources/Rmarkdown-examples/Example1_1.docx

## convert ../docs/resources/Rmarkdown-examples/Example1_1doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example1_1doc.png


## NA

## cp ../resources/Rmarkdown-examples/Example2.Rmd ../docs/resources/Rmarkdown-examples/Example2.Rmd

## ----Rmarkdown_pdf2_0ab, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=TRUE, dependson='Rmarkdown2_0'----
render('../docs/resources/Rmarkdown-examples/Example2.Rmd', output_format='pdf_document', output_dir='../docs/resources/Rmarkdown-examples/')   
render('../docs/resources/Rmarkdown-examples/Example2.Rmd', output_format='html_document', output_dir='../docs/resources/Rmarkdown-examples/')
render('../docs/resources/Rmarkdown-examples/Example2.Rmd', output_format='word_document', output_dir='../docs/resources/Rmarkdown-examples/')

## convert -density 300 -resize 70% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example2.pdf ../docs/resources/Rmarkdown-examples/Example2.png

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example2doc.pdf ../docs/resources/Rmarkdown-examples/Example2.docx

## convert ../docs/resources/Rmarkdown-examples/Example2doc.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example2doc.png


## ----Rmarkdown_pdf2_0ad, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=230----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example2.png')   


## ----Rmarkdown_pdf2_0ae, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=230----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example2doc.png')   


## NA

## cp ../resources/Rmarkdown-examples/Example2_1.Rmd ../docs/resources/Rmarkdown-examples/Example2_1.Rmd

## ----Rmarkdown_pdf2_1b, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=FALSE, dependson='Rmarkdown2_1'----
render('../docs/resources/Rmarkdown-examples/Example2_1.Rmd', output_format='bookdown::pdf_document2', output_dir='../docs/resources/Rmarkdown-examples/')  

## ----Rmarkdown_pdf2_1c, engine='R', results='asis', eval=FALSE----------------
## render('Example2_1.Rmd', output_format='bookdown::pdf_document2')

## convert -density 300 -resize 50% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example2_1.pdf ../docs/resources/Rmarkdown-examples/Example2_1.png

## #convert ../docs/resources/Rmarkdown-examples/Example2_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example2_1.png

## ----Rmarkdown_pdf2_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example2_1.png')       


## NA

## cp ../resources/Rmarkdown-examples/Example2_2.Rmd ../docs/resources/Rmarkdown-examples/Example2_2.Rmd

## ----Rmarkdown_html2_2b, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=TRUE, dependson='Rmarkdown2_2'----
render('../docs/resources/Rmarkdown-examples/Example2_2.Rmd', output_format='bookdown::html_document2', output_dir='../docs/resources/Rmarkdown-examples/')

## ----Rmarkdown_html2_2c, engine='R', results='asis', eval=FALSE---------------
## render('Example2_2.Rmd', output_format='bookdown::html_document2')


## NA
## cp ../resources/Rmarkdown-examples/Example2_3.Rmd ../docs/resources/Rmarkdown-examples/Example2_3.Rmd

## #sed -i 's/booktabs=TRUE/format=\"markdown\"/g' ../docs/resources/Rmarkdown-examples/Example2b.Rmd

## ----Rmarkdown2_3b, engine='R', results='hide', eval=TRUE, echo=FALSE, cache=TRUE, dependson='Rmarkdown2_3'----
render('../docs/resources/Rmarkdown-examples/Example2_3.Rmd', output_format='bookdown::word_document2', output_dir='../docs/resources/Rmarkdown-examples/')


## ----Rmarkdown2_3c, engine='R', results='asis', eval=FALSE--------------------
## render('Example2_3.Rmd', output_format='bookdown::word_document2')

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example2_3.pdf ../docs/resources/Rmarkdown-examples/Example2_3.docx

## convert ../docs/resources/Rmarkdown-examples/Example2_3.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example2_3.png

## ----Rmarkdown_pdf2_3e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example2_3.png')   


## NA

## cp ../resources/Rmarkdown-examples/Example3.Rmd ../docs/resources/Rmarkdown-examples/Example3.Rmd


## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example3.Rmd\", output_format=\"bookdown::pdf_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf3_1c, engine='R', results='asis', eval=FALSE----------------
## render('Example3.Rmd', output_format='bookdown::pdf_document2')

## convert -density 300 -resize 50% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example3.pdf ../docs/resources/Rmarkdown-examples/Example3.png

## #convert ../docs/resources/Rmarkdown-examples/Example3_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example3_1.png

## ----Rmarkdown_pdf3_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example3.png')          


## cp ../resources/Rmarkdown-examples/Example3.Rmd ../docs/resources/Rmarkdown-examples/Example3.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example3.Rmd\", output_format=\"bookdown::html_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf3_2c, engine='R', results='asis', eval=FALSE----------------
## render('Example3.Rmd', output_format='bookdown::html_document2')


## cp ../resources/Rmarkdown-examples/Example3.Rmd ../docs/resources/Rmarkdown-examples/Example3.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example3.Rmd\", output_format=\"bookdown::word_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown3_3c, engine='R', results='asis', eval=FALSE--------------------
## render('Example3.Rmd', output_format='bookdown::word_document2')

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example3docx.pdf ../docs/resources/Rmarkdown-examples/Example3.docx

## convert ../docs/resources/Rmarkdown-examples/Example3docx.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example3docx.png

## ----Rmarkdown_pdf3_3e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example3docx.png')   


## NA

## cp ../resources/Rmarkdown-examples/Example4.Rmd ../docs/resources/Rmarkdown-examples/Example4.Rmd


## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example4.Rmd\", output_format=\"bookdown::pdf_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf4_1c, engine='R', results='asis', eval=FALSE----------------
## render('Example4.Rmd', output_format='bookdown::pdf_document2')

## convert -density 400 -resize 50% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example4.pdf ../docs/resources/Rmarkdown-examples/Example4.png

## #convert ../docs/resources/Rmarkdown-examples/Example4_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example4_1.png

## ----Rmarkdown_pdf4_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example4.png')           


## cp ../resources/Rmarkdown-examples/Example4.Rmd ../docs/resources/Rmarkdown-examples/Example4.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example4.Rmd\", output_format=\"bookdown::html_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf4_2c, engine='R', results='asis', eval=FALSE----------------
## render('Example4.Rmd', output_format='bookdown::html_document2')


## cp ../resources/Rmarkdown-examples/Example4.Rmd ../docs/resources/Rmarkdown-examples/Example4.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example4.Rmd\", output_format=\"bookdown::word_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown4_3c, engine='R', results='asis', eval=FALSE--------------------
## render('Example4.Rmd', output_format='bookdown::word_document2')

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example4docx.pdf ../docs/resources/Rmarkdown-examples/Example4.docx

## convert ../docs/resources/Rmarkdown-examples/Example4docx.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example4docx.png

## ----Rmarkdown_pdf4_3e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example4docx.png')   


## NA

## cp ../resources/Rmarkdown-examples/Example5.Rmd ../docs/resources/Rmarkdown-examples/Example5.Rmd

## cp ../resources/Rmarkdown-examples/AIMS_wq.jpg ../docs/resources/Rmarkdown-examples/AIMS_wq.jpg


## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example5.Rmd\", output_format=\"bookdown::pdf_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf5_1c, engine='R', results='asis', eval=FALSE----------------
## render('Example5.Rmd', output_format='bookdown::pdf_document2')

## convert -density 500 -resize 50% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example5.pdf ../docs/resources/Rmarkdown-examples/Example5.png

## #convert ../docs/resources/Rmarkdown-examples/Example5_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example5_1.png

## ----Rmarkdown_pdf5_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example5.png')           


## cp ../resources/Rmarkdown-examples/Example5.Rmd ../docs/resources/Rmarkdown-examples/Example5.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example5.Rmd\", output_format=\"bookdown::html_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf5_2c, engine='R', results='asis', eval=FALSE----------------
## render('Example5.Rmd', output_format='bookdown::html_document2')


## cp ../resources/Rmarkdown-examples/Example5.Rmd ../docs/resources/Rmarkdown-examples/Example5.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example5.Rmd\", output_format=\"bookdown::word_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown5_3c, engine='R', results='asis', eval=FALSE--------------------
## render('Example5.Rmd', output_format='bookdown::word_document2')

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example5docx.pdf ../docs/resources/Rmarkdown-examples/Example5.docx

## convert ../docs/resources/Rmarkdown-examples/Example5docx.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example5docx.png

## ----Rmarkdown_pdf5_3e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=500----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example5docx.png')   


## NA

## cp ../resources/Rmarkdown-examples/Example6.Rmd ../docs/resources/Rmarkdown-examples/Example6.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example6.Rmd\", output_format=\"bookdown::pdf_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf6_1c, engine='R', results='asis', eval=FALSE----------------
## render('Example6.Rmd', output_format='bookdown::pdf_document2')

## convert -density 500 -resize 12% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example6.pdf ../docs/resources/Rmarkdown-examples/Example6.png

## #convert ../docs/resources/Rmarkdown-examples/Example6_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example6_1.png

## ----Rmarkdown_pdf6_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=400----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example6-0.png')   
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example6-1.png')


## cp ../resources/Rmarkdown-examples/Example6.Rmd ../docs/resources/Rmarkdown-examples/Example6.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example6.Rmd\", output_format=\"bookdown::html_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf6_2c, engine='R', results='asis', eval=FALSE----------------
## render('Example6.Rmd', output_format='bookdown::html_document2')


## cp ../resources/Rmarkdown-examples/Example6.Rmd ../docs/resources/Rmarkdown-examples/Example6.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example6.Rmd\", output_format=\"bookdown::word_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown6_3c, engine='R', results='asis', eval=FALSE--------------------
## render('Example6.Rmd', output_format='bookdown::word_document2')

## unoconv -f pdf -e PageRange=1 -o ../docs/resources/Rmarkdown-examples/Example6docx.pdf ../docs/resources/Rmarkdown-examples/Example6.docx

## convert -density 500 -resize 12% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example6docx.pdf ../docs/resources/Rmarkdown-examples/Example6docx.png

## #convert ../docs/resources/Rmarkdown-examples/Example6docx.pdf -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example6docx.png

## ----Rmarkdown_pdf6_3e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=400----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example6docx-0.png') 
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example6docx-1.png')   


## ----fonts, results='markdown', eval=FALSE------------------------------------
## library(sysfonts)
## unique(font_files()$family)


## ----fonts1, results='markdown', eval=TRUE, echo=FALSE------------------------
options(width=100)
library(sysfonts)
library(tidyverse)
files = list.files(font_paths(), "\\.tt[cf]$|\\.otf$", full.names = TRUE, ignore.case = TRUE)
Exclude_font <- c('devicons-regular.ttf')
Exclude_fonts <- grep(Exclude_font, files)
fnames = sapply(files[-Exclude_fonts], function(f) .Call("font_name", f, PACKAGE = "sysfonts"), USE.NAMES = FALSE)
d=data.frame(path = dirname(files[c(-Exclude_fonts)]), file = basename(files[c(-Exclude_fonts)]), 
             family = fnames[1, ], face = fnames[2, ], version = fnames[3,], ps_name = fnames[4, ], stringsAsFactors = FALSE)
dd = d %>% filter(grepl('/usr',path))
unique(dd$family)


## NA
## cp ../resources//Rmarkdown-examples/Example7.Rmd ../docs/resources/Rmarkdown-examples/Example7.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example7.Rmd\", output_format=\"bookdown::pdf_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf7_1c, engine='R', results='asis', eval=FALSE----------------
## render('Example7.Rmd', output_format='bookdown::pdf_document2')

## convert -density 500 -resize 12% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example7.pdf ../docs/resources/Rmarkdown-examples/Example7.png

## #convert ../docs/resources/Rmarkdown-examples/Example7_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example7_1.png

## ----Rmarkdown_pdf7_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=400----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example7-0.png')    
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example7-1.png')


## NA

## NA

## cp ../resources/Rmarkdown-examples/Example7a.Rmd ../docs/resources/Rmarkdown-examples/Example7a.Rmd

## ## cp ../resources/Rmarkdown-examples/latex.template ../docs/resources/Rmarkdown-examples/latex.template

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example7a.Rmd\", output_format=\"bookdown::pdf_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf7a_1c, engine='R', results='asis', eval=FALSE---------------
## render('Example7a.Rmd', output_format='bookdown::pdf_document2')

## convert -density 500 -resize 12% -shave 10x50 ../docs/resources/Rmarkdown-examples/Example7a.pdf ../docs/resources/Rmarkdown-examples/Example7a.png

## #convert ../docs/resources/Rmarkdown-examples/Example7a_1.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../docs/resources/Rmarkdown-examples/Example7a_1.png

## ----Rmarkdown_pdf7a_1e, results='markdown', eval=TRUE, echo=FALSE, out.extra='class="pdf" style="vertical-align:top"', out.width=400----
knitr::include_graphics('../docs/resources/Rmarkdown-examples/Example7a.png')      


## ----rticles, results='markdown', eval=TRUE, results='hide', cache=TRUE, echo=-1:-3----
if (dir.exists('../resources/plos')) system("rm -r ../resources/plos")
if (dir.exists('../resources/pnas')) system("rm -r ../resources/pnas")
if (dir.exists('../resources/elsevier')) system("rm -r ../resources/elsevier")
rmarkdown::draft(file='../resources/plos.Rmd', template='plos', package='rticles', edit=FALSE)
rmarkdown::render('../resources/plos/plos.Rmd')  

rmarkdown::draft(file='../resources/pnas.Rmd', template='pnas', package='rticles', edit=FALSE)
rmarkdown::render('../resources/pnas/pnas.Rmd')

rmarkdown::draft(file='../resources/elsevier.Rmd', template='elsevier', package='rticles', edit=FALSE)
rmarkdown::render('../resources/elsevier/elsevier.Rmd')

## convert -density 300 -resize 8% ../resources/plos/plos.pdf ../resources/plos/plos.png

## convert ../resources/plos/plos-0.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../resources/plos/plos-0.png

## 

## convert -density 300 -resize 8% ../resources/pnas/pnas.pdf ../resources/pnas/pnas.png

## convert ../resources/pnas/pnas-0.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../resources/pnas/pnas-0.png

## 
## convert -density 300 -resize 8% ../resources/elsevier/elsevier.pdf ../resources/elsevier/elsevier.png

## convert ../resources/elsevier/elsevier-0.png -flatten -bordercolor None -border 7x7 \( +clone -background black -shadow 70x2+1+1 \) +swap -background white -layers merge +repage ../resources/elsevier/elsevier-0.png


## NA
## cp ../resources/Rmarkdown-examples/Example8a.Rmd ../docs/resources/Rmarkdown-examples/Example8a.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example8a.Rmd\", output_format=\"bookdown::html_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf8a_2c, engine='R', results='asis', eval=FALSE---------------
## render('Example8a.Rmd', output_format='bookdown::html_document2')


## NA

## NA

## cp ../resources/Rmarkdown-examples/Example8b.Rmd ../docs/resources/Rmarkdown-examples/Example8b.Rmd

## echo "rmarkdown::render(\"../docs/resources/Rmarkdown-examples/Example8b.Rmd\", output_format=\"bookdown::html_document2\", output_dir=\"../docs/resources/Rmarkdown-examples/\")" | R --no-save --no-restore

## ----Rmarkdown_pdf8b_2c, engine='R', results='asis', eval=FALSE---------------
## render('Example8b.Rmd', output_format='bookdown::html_document2')

