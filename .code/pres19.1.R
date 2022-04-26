## ----setup, include=FALSE,warning=FALSE, message=FALSE------------------------
knitr::opts_chunk$set(echo = TRUE,
                      fig.path='resources/pres19.1-', dev='png', fig.ext='png')
options(tinytex.engine = 'xelatex')


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## 			

## \tikzstyle{TARGET} = [font={\\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \file{0,0}{\begin{minipage}{1.3cm}\textcolor{red}{- item 1}\\\textcolor{red}{- item 2}\end{minipage}}{F1}

## \node [fileText] at ($(F1) + (0.75,0.3)$) {Version 1};

## \node [fileText] at ($(F1) + (0.75,-2.3)$) {todo.txt};

## 
## \file{2,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\\textcolor{red}{- item 3}\end{minipage}}{F2}

## \node [fileText] at ($(F2) + (0.75,0.3)$) {Version 2};

## \node [fileText] at ($(F2) + (0.75,-2.3)$) {todo2.txt};

## 
## \file{4,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\- item 3\\\textcolor{red}{- item 4}\end{minipage}}{F3}

## \node [fileText] at ($(F3) + (0.75,0.3)$) {Version 3};

## \node [fileText] at ($(F3) + (0.75,-2.3)$) {todo3.txt};

## 
## \file{6,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\\textcolor{blue}{- item 4}\end{minipage}}{F4}

## \node [fileText] at ($(F4) + (0.75,0.3)$) {Version 4};

## \node [fileText] at ($(F4) + (0.75,-2.3)$) {todo4.txt};

## 
## \node [fileText] at ($(F4) +(3.5,-1)$) {\begin{minipage}{2.5cm}An example of a poor, adhoc versioning system.\end{minipage}};)

## 
## \end{tikzpicture}


## \usetikzlibrary{arrows.meta}

## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## 			  \newcommand{\file}[3] {

## 			  \coordinate (#3) at (#1);

## 			  \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## 			  \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## 			  \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## 			  }

## 			

## 			  \begin{tikzpicture}

## 			  %Version 1

## \file{0,0}{\begin{minipage}{1.3cm}\textcolor{red}{- item 1}\\\textcolor{red}{- item 2}\end{minipage}}{F1}

## \node [fileText] at ($(F1) + (0.75,-2.3)$) {todo.txt};

## 
## \file{0,-3}{\begin{minipage}{1.3cm}\textcolor{red}{Title}\\[1em]\textcolor{red}{content}\end{minipage}}{F1a}

## \node [fileText] at ($(F1a) + (0.75,-2.3)$) {fileA.doc};

## 
## 
## \node [fileText] at ($(F1) + (0.2,0.5)$) (V1) {Version 1};

## \draw (V1.200) -- (V1.200 |- F1a);

## \draw (V1.200 |- F1) -- (F1);

## \draw (V1.200 |- F1a) -- (F1a);

## 
## %Version 2

## 			  \file{3,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\\textcolor{red}{- item 3}\end{minipage}}{F2}

## 			  \node [fileText] at ($(F2) + (0.75,-2.3)$) {todo.txt};

## 
## 			  \file{3,-3}{\begin{minipage}{1.3cm}\textcolor{black}{Title}\\[1em]\textcolor{black}{content}\end{minipage}}{F2a}

## 			  \node [fileText] at ($(F2a) + (0.75,-2.3)$) {fileA.doc};

## 
## 			  \file{3,-6}{\begin{minipage}{1.3cm}\textcolor{red}{ID,Num}\\\textcolor{red}{1,10}\\\textcolor{red}{2,15}\end{minipage}}{F2b}

## 			  \node [fileText] at ($(F2b) + (0.75,-2.3)$) {fileB.csv};

## 
## 			  \node [fileText] at ($(F2) + (0.2,0.5)$) (V2) {Version 2};

## 			  \draw (V2.200) -- (V2.200 |- F2b);

## 			  \draw (V2.200 |- F2) -- (F2);

## 			  \draw (V2.200 |- F2a) -- (F2a);

## 			  \draw (V2.200 |- F2b) -- (F2b);

## 
## 			  %Version 3

## \file{6,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\- item 3\\\textcolor{red}{- item 4}\end{minipage}}{F3}

## \node [fileText] at ($(F3) + (0.75,-2.3)$) {todo.txt};

## 
## \file{6,-3}{\begin{minipage}{1.3cm}\textcolor{black}{Title}\\[1em]\textcolor{black}{content}\end{minipage}}{F3a}

## \node [fileText] at ($(F3a) + (0.75,-2.3)$) {fileA.doc};

## 
## \file{6,-6}{\begin{minipage}{1.3cm}\textcolor{black}{ID,Num}\\\textcolor{black}{1,10}\\2,\textcolor{blue}{25}\end{minipage}}{F3b}

## \node [fileText] at ($(F3b) + (0.75,-2.3)$) {fileB.csv};

## 
## \node [fileText] at ($(F3) + (0.2,0.5)$) (V3) {Version 3};

## \draw (V3.200) -- (V3.200 |- F3b);

## \draw (V3.200 |- F3) -- (F3);

## \draw (V3.200 |- F3a) -- (F3a);

## \draw (V3.200 |- F3b) -- (F3b);

## 
## \node [fileText] at ($(F3) +(4,-1)$) {\begin{minipage}{3cm}An example of a more sophisticated versioning system\end{minipage}};

## 
## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## 			  \newcommand{\file}[3] {

## 			  \coordinate (#3) at (#1);

## 			  \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## 			  \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## 			  \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## 			  }

## 			

## 			  \begin{tikzpicture}

## 
## 			  %Version 1

## \file{0,0}{\begin{minipage}{1.3cm}\textcolor{red}{- item 1}\\\textcolor{red}{- item 2}\end{minipage}}{F1}

## \node [fileText] at ($(F1) + (0.75,-2.3)$) {todo.txt};

## 
## \file{0,-3}{\begin{minipage}{1.3cm}\textcolor{red}{Title}\\[1em]\textcolor{red}{content}\end{minipage}}{F1a}

## \node [fileText] at ($(F1a) + (0.75,-2.3)$) {fileA.doc};

## 
## 
## \node [fileText] at ($(F1) + (0.2,0.5)$) (V1) {Version 1};

## \draw (V1.200) -- (V1.200 |- F1a);

## \draw (V1.200 |- F1) -- (F1);

## \draw (V1.200 |- F1a) -- (F1a);

## 
## %Version 2

## 			  \file{3,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\\textcolor{red}{- item 3}\end{minipage}}{F2}

## 			  \node [fileText] at ($(F2) + (0.75,-2.3)$) {todo.txt};

## 
## 			  \file{3,-3}{\begin{minipage}{1.3cm}\textcolor{black}{Title}\\[1em]\textcolor{black}{content}\end{minipage}}{F2a}

## 			  \node [fileText] at ($(F2a) + (0.75,-2.3)$) {fileA.doc};

## 
## 			  \file{3,-6}{\begin{minipage}{1.3cm}\textcolor{red}{ID,Num}\\\textcolor{red}{1,10}\\\textcolor{red}{2,15}\end{minipage}}{F2b}

## 			  \node [fileText] at ($(F2b) + (0.75,-2.3)$) {fileB.csv};

## 
## 			  \node [fileText] at ($(F2) + (0.2,0.5)$) (V2) {Version 2};

## 			  \draw (V2.200) -- (V2.200 |- F2b);

## 			  \draw (V2.200 |- F2) -- (F2);

## 			  \draw (V2.200 |- F2a) -- (F2a);

## 			  \draw (V2.200 |- F2b) -- (F2b);

## 
## 			  %Version 3

## \file{6,0}{\begin{minipage}{1.3cm}- item 1\\- item 2\\- item 3\\\textcolor{red}{- item 4}\end{minipage}}{F3}

## \node [fileText] at ($(F3) + (0.75,-2.3)$) {todo.txt};

## 
## %\file{6,-3}{\begin{minipage}{1.3cm}\textcolor{black}{Title}\\[1em]\textcolor{black}{content}\end{minipage}}{F3a}

## 			  \node [anchor=west,text=green!50!black!50] at (6,-3) (F3a) {\#\#\#\#\#\#};

## 			  \node [fileText] at ($(F3 |- F3a) + (0.75,-0.5)$) {fileA.doc};

## 			  \draw[->,very thick,color=green!50!black!50] (F3a) -- ($(F2a) +(1.6,-0.5)$);

## 
## 
## 			  \file{6,-6}{\begin{minipage}{1.3cm}\textcolor{black}{ID,Num}\\\textcolor{black}{1,10}\\2,\textcolor{blue}{25}\end{minipage}}{F3b}

## 			  \node [fileText] at ($(F3b) + (0.75,-2.3)$) {fileB.csv};

## 
## 			  \node [fileText] at ($(F3) + (0.2,0.5)$) (V3) {Version 3};

## 			  \draw (V3.200) -- (V3.200 |- F3b);

## 			  \draw (V3.200 |- F3) -- (F3);

## 			  \draw (V3.200 |- F3a) -- (F3a);

## 			  \draw (V3.200 |- F3b) -- (F3b);

## 
## 			  \node [fileText] at ($(F3) +(4,-1)$) {\begin{minipage}{3cm}An example of a more sophisticated, yet efficient versioning system\end{minipage}};

## 
## 			  \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## 
## \usetikzlibrary{arrows.meta}

## 
## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{hashText} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{commentText} = [font={\fontspec[Scale=1.0]{Inconsolata}}]

## \tikzstyle{refText} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## 
## \definecolor{color_branch}{rgb}{1,0.8,0.4}

## \definecolor{color_head}{HTML}{6495ED} %

## \definecolor{color_HEAD}{rgb}{0.26,0.65,0.91}

## \definecolor{color_commit}{rgb}{0.9,0.9,0.2}

## \definecolor{color_inactive}{rgb}{0.90,0.9,0.9}

## \definecolor{color_detached}{rgb}{0.90,0.9,0.9}

## \definecolor{color_derivative}{rgb}{0.12,0.6,0.51}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## 
## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## \newcommand{\commit}[5]{

## \node [#1,inner sep=0,outer sep=0] (#2) {

## \begin{tikzpicture}[#1]

## \draw [#1] node [draw=black!40!#3,fill=#3,shape=circle,minimum width=1.0cm,line width=3pt] (x) {};

## %\node [below,hashText] at (x.south) {#4};

## \end{tikzpicture}

## };

## \node [below,hashText] at (#2.south) {#4};

## \node [below,commentText,text=gray] at ($(#2.south) +(0,-0.5)$) {#5};

## }

## 
## \newcommand{\rcommit}[5]{

## \node [#1,inner sep=0,outer sep=0] (#2) {

## \begin{tikzpicture}[#1]

## \draw [#1] node [draw=black!40!#3,fill=#3,shape=rectangle,minimum width=1.0cm,minimum height=1.0cm,line width=3pt] (x) {};

## %\node [below,hashText] at (x.south) {#4};

## \end{tikzpicture}

## };

## \node [below,hashText] at (#2.south) {#4};

## \node [below,commentText,text=gray] at ($(#2.south) +(0,-0.5)$) {#5};

## }

## 
## \newcommand{\master}[1] {

## \node [#1,rectangle,fill=color_branch,draw=black!20!color_branch,line width=2pt,refText,minimum height=0.8cm] (master) {master};

## }

## \newcommand{\rmaster}[1] {

## \node [#1,rectangle,fill=color_branch,draw=black!20!color_branch,line width=2pt,refText,minimum height=0.8cm] (rmaster) {origin/master};

## }

## \newcommand{\branch}[2] {

## \node [#1,rectangle,fill=color_branch,draw=black!20!color_branch,line width=2pt,refText,minimum height=0.8cm] (#2) {#2};

## }

## 
## \newcommand{\HEAD}[1] {

## \node [#1,rectangle,fill=color_HEAD,draw=black!20!color_HEAD,line width=2pt,refText,minimum height=0.8cm] (HEAD) {HEAD};

## }

## \newcommand{\rHEAD}[1] {

## \node [#1,rectangle,fill=color_HEAD,draw=black!20!color_HEAD,line width=2pt,refText,minimum height=0.8cm] (rHEAD) {origin/HEAD};

## }

## 
## \begin{tikzpicture}

## 
## \commit{}{A}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (A) -- ++(-1,0);

## \commit{right = 1cm of A}{B}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (B) -- (A);

## \commit{right = 1cm of B}{C}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (C) -- (B);

## \commit{right = 1cm of C}{D}{color_commit}{}{}

## \draw [-,line width=3pt,draw=black!60] (D) -- (C);

## 
## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## %\node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## %\begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## %\node {}

## %child {node {file 2}}

## %child { node {file 1}};

## %\end{tikzpicture}

## %};

## 
## 
## %\node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## %\begin{tikzpicture}[dirtree,TREE]

## %\node {}

## %child {node {file 2}}

## %child { node {file 1}};

## %\end{tikzpicture}

## %};

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + %(1.3cm,0.2cm)$);

## %\node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## %\node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## %\begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## %\node {}

## %child {node {file 2}}

## %child { node {file 1}};

## %\end{tikzpicture}

## %};

## 
## 
## %\node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## %\begin{tikzpicture}[dirtree,TREE]

## %\node {}

## %child {node {file 2}}

## %child { node {file 1}};

## %\end{tikzpicture}

## %};

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + %(1.3cm,0.2cm)$);

## %\node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## 
## 
## %\node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## %\begin{tikzpicture}[dirtree,TREE]

## %\node {}

## %child {node {file 2}}

## %child { node {file 1}};

## %\end{tikzpicture}

## %};

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## %\node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## 
## 
## \node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child [text=color_workspace]{node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## 
## 
## \node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns} %

## \usetikzlibrary{arrows.meta}%

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}] %

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]%

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]%

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]%

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}%

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}%

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}%

## \definecolor{color_remote}{rgb}{1,0.55,0.15}%

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}%

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}%

## 

## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }%

## 
## % Define dirtree

## \makeatletter%

## \newcount\dirtree@lvl%

## \newcount\dirtree@plvl%

## \newcount\dirtree@clvl%

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }%

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }%

## \makeatother%

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }%

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## 
## 
## \node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}

## \begin{tikzpicture}

## \commit{}{A}{color_commit}{}{}

## \draw [-,line width=3pt,draw=black!60] (A) -- ++(-1,0);

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns} %

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child { node {file 3}}

## child [text=color_workspace]{node {file 2}}

## child [text=color_workspace]{ node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,color=gray,text=gray]

## \node {}

## child { node {file 3}}

## child {node {file 2}}

## child {node {file 1}};

## \end{tikzpicture}

## };

## 
## 
## \node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child { node {file 3}}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 2};

## 
## \node [anchor=north west] at ($(L0) +(-1.2cm,-1cm)$)  (L1) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L1.north) + (1.3cm,-0.4cm)$)  -- ($(L1.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L1) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}

## \begin{tikzpicture}

## 
## \commit{}{A}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (A) -- ++(-1,0);

## \commit{right = 1cm of A}{B}{color_commit}{}{}

## \draw [-,line width=3pt,draw=black!60] (B) -- (A);

## \end{tikzpicture}


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns} %

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child [text=color_workspace]{ node {file 3}}

## child [text=color_workspace]{node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,color=gray,text=gray]

## \node {}

## child [text=color_index]{ node {file 3}}

## child [text=color_index]{ node {file 2}}

## child { node {file 1}};

## 
## \end{tikzpicture}

## };

## 
## \node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child { node {file 3}}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 3};

## 
## \node [anchor=north west] at ($(L0) +(-1.2cm,-1cm)$)  (L1) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child { node {file 3}}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L1.north) + (1.3cm,-0.4cm)$)  -- ($(L1.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L1) +(1.5,-0.1)$) {committed snapshot 2};

## 
## \node [anchor=north west] at ($(L1) +(-1.2cm,-1cm)$)  (L2) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## \draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L2.north) + (1.3cm,-0.4cm)$)  -- ($(L2.south) + (1.3cm,0.2cm)$);

## \node [TREE,anchor=west] at ($(L2) +(1.5,-0.1)$) {committed snapshot 1};

## 
## \end{tikzpicture}

## \begin{tikzpicture}

## \commit{}{A}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (A) -- ++(-1,0);

## \commit{right = 1cm of A}{B}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (B) -- (A);

## \commit{right = 1cm of B}{C}{color_commit}{}{}

## \draw [-,line width=3pt,draw=black!60] (C) -- (B);

## \end{tikzpicture}


## \begin{tikzpicture}

## 
## \commit{}{A}{color_inactive}{}{}

## \commit{right = 1cm of A}{B}{color_inactive}{}{}

## \commit{right = 1cm of B}{C}{color_commit}{}{}

## \draw [-,line width=3pt,draw=black!60] (A) -- ++(-1,0);

## \draw [-,line width=3pt,draw=black!60] (B) -- (A);

## \draw [-,line width=3pt,draw=black!60] (C) -- (B);

## \commit{above = 0.5cm of B}{D}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (A.east) to[out=0,in=180] (D);

## \master{right = 0.5cm of C}\draw[->,line width=3pt,draw=black!60] (master) -- (C);

## \HEAD{right = 0.5cm of master}\draw[->,line width=3pt,draw=black!60] (HEAD) -- (master);

## \branch{right = 0.5cm of D}{Feature}\draw[->,line width=3pt,draw=black!60] (Feature) -- (D);

## 
## \rcommit{right = 3cm of HEAD}{rA}{color_inactive}{}{}

## \rcommit{right = 1cm of rA}{rB}{color_inactive}{}{}

## \rcommit{right = 1cm of rB}{rC}{color_inactive}{}{}

## \rcommit{right = 1cm of rC}{rC2}{color_commit}{}{}

## \draw [-,line width=3pt,draw=black!60] (rA) -- ++(-1,0);

## \draw [-,line width=3pt,draw=black!60] (rB) -- (rA);

## \draw [-,line width=3pt,draw=black!60] (rC) -- (rB);

## \draw [-,line width=3pt,draw=black!60] (rC2) -- (rC);

## 
## \rcommit{above = 0.5cm of rB}{rD}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (rA.east) to[out=0,in=180] (rD);

## \rmaster{right = 0.5cm of rC2}\draw[->,line width=3pt,draw=black!60] (rmaster) -- (rC2);

## \branch{right = 0.5cm of rD}{origin/Feature}\draw[->,line width=3pt,draw=black!60] (origin/Feature) -- (rD);

## \rcommit{below = 0.5cm of rB}{rE}{color_inactive}{}{}

## \draw [-,line width=3pt,draw=black!60] (rA.east) to[out=0,in=180] (rE);

## \branch{right = 0.5cm of rE}{origin/dev}\draw[->,line width=3pt,draw=black!60] (origin/dev) -- (rE);

## \rHEAD{right = 0.5cm of rmaster}\draw[->,line width=3pt,draw=black!60] (rHEAD) -- (rmaster);

## 
## \state{$(A) +(0,3cm)$}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \state{$(rA) +(0,3cm)$}{color_remote}{R}

## \node[TARGET,fill=white] at ($(R.north) +(0,0.5cm)$) {Remote Repository};

## 
## \end{tikzpicture}

## 

## git config --global user.name "Your name"

## git config --global user.email "your_email@whatever.com"

## git config --global --list


## ----use_git_config, results='markdown', eval=FALSE---------------------------
## usethis::use_git_config(user.name='Your name',
##                user.email='your_email@whatever.com',
##                scope='user')
## usethis::git_sitrep()


## ----gert_config, results='markdown', eval=FALSE------------------------------
## gert::git_config_global()


## ---- engine='R',results="markup", prompt=FALSE,eval=TRUE, echo=FALSE---------
unlink('~/tmp/Test_repo', recursive=TRUE, force=TRUE)


## mkdir ~/tmp/Test_repo

## cd ~/tmp/Test_repo


## cd ~/tmp/Test_repo

## git init


## convert -resize 250x resources/RStudio_NewProject2a.png resources/RStudio_NewProject2a_small.png

## convert -resize 250x resources/RStudio_NewProject3a.png resources/RStudio_NewProject3a_small.png


## ----create_package, results='markdown', eval=FALSE---------------------------
## library(usethis)
## create_project(path='~/path/project_name', rstudio=TRUE)
## use_git()


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## x=seq(1, 10, len=1)
## y=40*2 + rnorm(10,0,5)
## plot(x,y)


## cd ~/tmp/Test_repo

## echo 'x=seq(1, 10, len=1)' > analysis.R

## echo 'y=40*2 + rnorm(10,0,5)' >> analysis.R

## echo 'plot(x,y)' >> analysis.R


## git add <file(s)>


## cd ~/tmp/Test_repo

## git add analysis.R


## convert -resize 400x resources/RStudio_AddFile.png resources/RStudio_AddFile_small.png

## convert -resize 300x resources/RStudio_GitStatus.png resources/RStudio_GitStatus_small.png

## convert -resize 300x resources/RStudio_GitAdd.png resources/RStudio_GitAdd_small.png

## 
## convert resources/RStudio_GitStatus.png resources/RStudio_GitAdd.png -append resources/RStudio_GitAdd_combined.png


## ----gert_add, results='markdown', eval=FALSE---------------------------------
## gert::git_add('analysis.R')


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo0.png


## \usetikzlibrary{shapes,arrows,shadows,positioning,mindmap,backgrounds,decorations, calc,fit, decorations.pathreplacing,decorations.pathmorphing, shadings,shapes.geometric,patterns}

## \usetikzlibrary{arrows.meta}

## \tikzstyle{TARGET} = [font={\fontspec[Scale=2]{Ubuntu}}]

## \tikzstyle{CODE} = [font={\fontspec[Scale=2]{Inconsolata}}]

## \tikzstyle{TREE} = [font={\fontspec[Scale=1.5]{Inconsolata}}]

## \tikzstyle{fileText} = [font={\fontspec[Scale=1]{Inconsolata}}]

## 
## \definecolor{color_workspace}{rgb}{0.12,0.6,0.51}

## \definecolor{color_index}{rgb}{0.78,0.86,0.27}

## \definecolor{color_local}{rgb}{0.9,0.9,0.2}

## \definecolor{color_remote}{rgb}{1,0.55,0.15}

## \definecolor{color_master}{rgb}{0.36,0.27,0.87}

## \definecolor{color_head}{HTML}{6495ED} %\definecolor{color_head}{rgb}{0.26,0.65,0.91}

## 
## % A template for making the storage symbol

## \newcommand{\state}[3]{

## \draw (#1) node [draw=none,fill=#2,shape=circle,minimum width=2cm] (#3) {

## \begin{tikzpicture}

## \node [draw=white, fill=white,shape=cylinder,shape aspect=1.3 ,shape border rotate=90,minimum height=1.6cm,minimum width=1.5cm] at (0,0) (Cylinder) {};				\draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.1cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.5cm)$) arc (-180:0:0.8cm and 0.2cm);

## \draw[draw=#2,very thick,line width=0.1cm,anchor=north west] ($(Cylinder.north west) +(-0.05cm,-0.9cm)$) arc (-180:0:0.8cm and 0.2cm);

## \end{tikzpicture}

## };

## }

## 
## % Define dirtree

## \makeatletter

## \newcount\dirtree@lvl

## \newcount\dirtree@plvl

## \newcount\dirtree@clvl

## \def\dirtree@growth{%

## \ifnum\tikznumberofcurrentchild=1\relax

## \global\advance\dirtree@plvl by 1

## \expandafter\xdef\csname dirtree@p@\the\dirtree@plvl\endcsname{\the\dirtree@lvl}

## \fi

## \global\advance\dirtree@lvl by 1\relax

## \dirtree@clvl=\dirtree@lvl

## \advance\dirtree@clvl by -\csname dirtree@p@\the\dirtree@plvl\endcsname

## \pgf@xa=0.25cm\relax

## \pgf@ya=-0.5cm\relax

## \pgf@ya=\dirtree@clvl\pgf@ya

## \pgftransformshift{\pgfqpoint{\the\pgf@xa}{\the\pgf@ya}}%

## \ifnum\tikznumberofcurrentchild=\tikznumberofchildren

## \global\advance\dirtree@plvl by -1

## \fi

## }

## 
## \tikzset{

## dirtree/.style={

## growth function=\dirtree@growth,

## every node/.style={anchor=north},

## every child node/.style={anchor=west},

## edge from parent path={(\tikzparentnode\tikzparentanchor) |- (\tikzchildnode\tikzchildanchor)}

## }

## }

## \makeatother

## 
## \newcommand{\file}[3] {

## \coordinate (#3) at (#1);

## \draw [anchor=top left](#1) rectangle ++(1.5,-2);

## \draw [fill=color_workspace]($(#1) +(1.5,0)$) -- ++(0,-0.5) --++(-0.5,0.5) -- cycle;

## \node [anchor=north west,fileText] at ($(#1) +(0,-0.5)$) {#2};

## }

## 
## \begin{tikzpicture}

## 
## \state{0,0}{color_workspace}{W}

## \node[TARGET,fill=white] at ($(W.north) +(0,0.5cm)$) {Workspace};

## \state{6,0}{color_index}{I}

## \node[TARGET,fill=white] at ($(I.north) +(0,0.5cm)$) {Staging Area};

## \state{12,0}{color_local}{L}

## \node[TARGET,fill=white] at ($(L.north) +(0,0.5cm)$) {Local Repository};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_index] ($(W.east) + (0.1cm,0)$) -- ($(I.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {add};

## 
## \draw[{Round Cap[length=0.5em]}-Triangle Cap,very thick, line width=1cm, draw=color_local] ($(I.east) + (0.1cm,0)$) -- ($(L.west) + (-0.1cm,0)$) node[anchor=center,pos=0.5, text=black,align=center,CODE] {commit};

## 
## \node [anchor=north west] at ($(W) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(W0.north) + (-1cm,-1cm)$)  -- ($(W0.south) + (-1cm,0.2cm)$);

## 
## \node [anchor=north west] at ($(I) +(-1cm,-1cm)$)  (W0) {

## \begin{tikzpicture}[dirtree,TREE,text=gray,color=gray]

## \node {}

## child {node {file 2}}

## child { node {file 1}};

## \end{tikzpicture}

## };

## 
## 
## %\node [anchor=north west] at ($(L) +(-1cm,-1cm)$)  (L0) {

## %\begin{tikzpicture}[dirtree,TREE]

## %\node {}

## %child {node {file 2}}

## %child { node {file 1}};

## %\end{tikzpicture}

## %};

## %\draw[decorate,decoration={brace,amplitude=5pt},very thick] ($(L0.north) + (1.3cm,-0.4cm)$)  -- ($(L0.south) + (1.3cm,0.2cm)$);

## %\node [TREE,anchor=west] at ($(L0) +(1.5,-0.1)$) {committed snapshot 1};

## \end{tikzpicture}


## convert -resize 350x resources/RStudio_gitignore.png resources/RStudio_gitignore_small.png

## convert -resize 350x resources/Rstudio_gitignore2.png resources/RStudio_gitignore2_small.png


## cd ~/tmp/Test_repo

## git commit -m 'Initial commit'

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo1.tex

## mv pres_19.1_Test_repo1.pdf resources/pres_19.1_Test_repo1.pdf

## #convert  -density 300 -resize 100% resources/pres_19.1_Test_repo1.pdf resources/pres_19.1_Test_repo1.png

## #rm pres_19.1_Test_repo1.tex


## convert -resize 400x resources/RStudio_GitCommit.png resources/RStudio_GitCommit_small.png

## convert -density 300 -resize 350x resources/pres_19.1_Test_repo1.pdf resources/pres_19.1_Test_repo1.png


## ----gert_commit, results='markdown', eval=FALSE------------------------------
## gert::git_commit('Initial commit')


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo1.png

## convert -resize 400x resources/Test_repo1.png resources/Test_repo1_small.png


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## x=seq(1, 10, len=1)
## y=40*2 + rnorm(10,0,5)
## plot(x,y)
## summary(x)


## cd ~/tmp/Test_repo

## echo 'summary(x)' >> analysis.R

## git add analysis.R

## git commit -m 'Added summary for x'


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## x=seq(1, 10, len=1)
## y=40*2 + rnorm(10,0,5)
## plot(x,y)


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## summary(x)
## summary(y)

## cd ~/tmp/Test_repo

## echo -e 'x=seq(1, 10, len=1)\ny=40*2 + rnorm(10,0,5)\nplot(x,y)' > analysis.R

## echo -e 'summary(x)\nsummary(y)' > summary.R

## git add analysis.R summary.R

## git commit -m 'Added summaries for x and y'


## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo2.tex

## mv pres_19.1_Test_repo2.pdf resources/pres_19.1_Test_repo2.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo2.pdf resources/pres_19.1_Test_repo2.png

## rm pres_19.1_Test_repo2.tex

## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo2.png

## convert  -density 300 -resize 500x resources/Test_repo2.png resources/Test_repo2.png


## cd ~/tmp/Test_repo

## git log --oneline --graph --decorate


## convert  -density 300 -resize 450x resources/Rstudio_GitLog.png resources/Rstudio_GitLog_small.png


## ----gert_log, results='markdown', eval=TRUE, echo=2--------------------------
oldwd=setwd('~/tmp/Test_repo')
gert::git_log(max=10)
setwd(oldwd)


## ----gert_ls, results='markdown', eval=TRUE, echo=2---------------------------
oldwd=setwd('~/tmp/Test_repo')
gert::git_ls()
setwd(oldwd)


## git tag -a <tag> -m <message>


## cd ~/tmp/Test_repo

## git tag -a 'V.1' -m 'Version 1'

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo3.tex

## mv pres_19.1_Test_repo3.pdf resources/pres_19.1_Test_repo3.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo3.pdf resources/pres_19.1_Test_repo3.png

## rm pres_19.1_Test_repo3.tex


## ----gert_tag, results='markdown', eval=FALSE, echo=2-------------------------
## oldwd=setwd('~/tmp/Test_repo')
## gert::git_tag_create(name='V1', message='Version 1')
## setwd(oldwd)


## convert  -density 300 -resize 350x resources/RStudio_GitTag.png resources/RStudio_GitTag_small.png

## convert  -density 300 -resize 350x resources/Rstudio_GitTag1.png resources/RStudio_GitTag1_small.png


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo3.png

## convert  -density 300 -resize 500x resources/Test_repo3.png resources/Test_repo3.png


## ---- echo=FALSE, results='asis'----------------------------------------------
library(knitr)
hash = read.fwf('~/tmp/Test_repo/.git/logs/HEAD', widths=c(40,40))
hash_commit = strtrim(hash$V2[2], width=5)
knit_engines$set(bash1=function(options) {
    engine=options$engine
    options$code = gsub('#',hash_commit,options$code)
    code = paste("bash -c",shQuote(paste(options$code, collapse="\n")))
    code = paste(options$engine_opts,code)
    out = system(code,intern=TRUE)
    engine_output(options,options$code,out) 
})

## git checkout #


## cd ~/tmp/Test_repo

## git checkout #


## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo6.tex

## mv pres_19.1_Test_repo6.pdf resources/pres_19.1_Test_repo6.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo6.pdf resources/pres_19.1_Test_repo6.png

## rm pres_19.1_Test_repo6.tex


## ---- echo=FALSE, results='asis'----------------------------------------------
library(knitr)
hash = read.fwf('~/tmp/Test_repo/.git/logs/HEAD', widths=c(40,40))
hash_commit = gsub(' ', '', strtrim(hash$V2[2], width=5))

old_hook = knit_hooks$get('source')

default_source_hook <- knit_hooks$get('source')
knit_hooks$set(source = function(x, options) {
  x <- gsub('#',hash_commit,x)
  default_source_hook(x, options)
})
sub_hook = knit_hooks$get('source')


## oldwd=setwd('~/tmp/Test_repo')

## gert::git_branch_create(branch = 'temp', ref = '#', checkout = TRUE)

## setwd(oldwd)


## ---- results='markdown', eval=TRUE, echo=FALSE-------------------------------
knit_hooks$set(source = old_hook)


## convert  -density 300 -resize 350x resources/Rstudio_GitCheckout1.png resources/RStudio_GitCheckout1_small.png


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo6.png

## convert  -density 300 -resize 500x resources/Test_repo6.png resources/Test_repo6.png


## cd ~/tmp/Test_repo

## git checkout master

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo7.tex

## mv pres_19.1_Test_repo7.pdf resources/pres_19.1_Test_repo7.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo7.pdf resources/pres_19.1_Test_repo7.png

## rm pres_19.1_Test_repo7.tex


## convert  -density 300 -resize 350x resources/Rstudio_GitBranch_change.png resources/RStudio_GitBranch_change_small.png


## oldwd=setwd('~/tmp/Test_repo')

## gert::git_branch_checkout(branch = 'master')

## setwd(oldwd)


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo7.png

## convert  -density 300 -resize 500x resources/Test_repo7.png resources/Test_repo7.png


## ---- echo=FALSE, results='asis'----------------------------------------------
library(knitr)
hash = read.fwf('~/tmp/Test_repo/.git/logs/HEAD', widths=c(40,40))
hash_commit = gsub(' ', '', strtrim(hash$V2[2], width=5))
knit_engines$set(bash1=function(options) {
    engine=options$engine
    options$code = gsub('#',hash_commit,options$code)
    code = paste("bash -c",shQuote(paste(options$code, collapse="\n")))
    code = paste(options$engine_opts,code)
    out = system(code,intern=TRUE)
    engine_output(options,options$code,out) 
})

## git reset --hard #


## cd ~/tmp/Test_repo

## git reset --hard #


## convert  -density 300 -resize 350x resources/Rstudio_GitReset1.png resources/RStudio_GitReset1_small.png


## ---- results='markdown', eval=TRUE, echo=FALSE-------------------------------
knit_hooks$set(source = sub_hook)

## ----gert_reset_hard, results='markdown', eval=FALSE, echo=2------------------
## oldwd=setwd('~/tmp/Test_repo')
## gert::git_reset_hard(ref='#')
## setwd(oldwd)

## ---- results='markdown', eval=TRUE, echo=FALSE-------------------------------
knit_hooks$set(source = old_hook)


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo4.png

## convert  -density 300 -resize 500x resources/Test_repo4.png resources/Test_repo4.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo4.tex

## mv pres_19.1_Test_repo4.pdf resources/pres_19.1_Test_repo4.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo4.pdf resources/pres_19.1_Test_repo4.png


## cd ~/tmp/Test_repo

## git reset --hard V.1

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo8.tex

## mv pres_19.1_Test_repo8.pdf resources/pres_19.1_Test_repo8.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo8.pdf resources/pres_19.1_Test_repo8.png


## ----gert_reset_hard1, results='markdown', eval=FALSE, echo=2-----------------
## oldwd=setwd('~/tmp/Test_repo')
## gert::git_reset_hard(ref='V.1')
## setwd(oldwd)


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo8.png

## convert  -density 300 -resize 400x resources/Test_repo8.png resources/Test_repo8.png


## cd ~/tmp/Test_repo

## git revert HEAD --no-edit


## convert  -density 300 -resize 350x resources/Rstudio_GitRevert1.png resources/RStudio_GitRevert1_small.png


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo5.png

## convert  -density 300 -resize 500x resources/Test_repo5.png resources/Test_repo5.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo5.tex

## mv pres_19.1_Test_repo5.pdf resources/pres_19.1_Test_repo5.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo5.pdf resources/pres_19.1_Test_repo5.png


## git revert --no-commit HEAD

## git revert --no-commit HEAD~1

## git commit -m 'Rolled back'


## git checkout -b <Name>


## cd ~/tmp/Test_repo

## git checkout -b Experimental


## convert  -density 300 -resize 350x resources/Rstudio_GitBranch.png resources/RStudio_GitBranch_small.png

## convert  -density 300 -resize 350x resources/Rstudio_GitBranch1.png resources/RStudio_GitBranch1_small.png


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo9.png

## convert  -density 300 -resize 500x resources/Test_repo9.png resources/Test_repo9.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo9.tex

## mv pres_19.1_Test_repo9.pdf resources/pres_19.1_Test_repo9.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo9.pdf resources/pres_19.1_Test_repo9.png


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## x=seq(1, 10, len=1)
## y=40*2 + rnorm(10,0,5)
## plot(x,y)
## summary(x)
## mean(x)


## cd ~/tmp/Test_repo

## echo 'mean(x)' >> analysis.R

## git add analysis.R

## git commit -m 'Added mean of x'


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo10.png

## convert  -density 300 -resize 500x resources/Test_repo10.png resources/Test_repo10.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo10.tex

## mv pres_19.1_Test_repo10.pdf resources/pres_19.1_Test_repo10.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo10.pdf resources/pres_19.1_Test_repo10.png


## git checkout <Name>


## cd ~/tmp/Test_repo

## git checkout master


## convert  -density 300 -resize 400x resources/RStudio_GitBranch3.png resources/RStudio_GitBranch3_small.png


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo11.png

## convert  -density 300 -resize 500x resources/Test_repo11.png resources/Test_repo11.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo11.tex

## mv pres_19.1_Test_repo11.pdf resources/pres_19.1_Test_repo11.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo11.pdf resources/pres_19.1_Test_repo11.png


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## mean(c(1,2,3))


## cd ~/tmp/Test_repo

## echo 'mean(c(1,2,3))' > test.R

## git add test.R

## git commit -m 'Added test.R'


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo12.png

## convert  -density 300 -resize 500x resources/Test_repo11.png resources/Test_repo12.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo12.tex

## mv pres_19.1_Test_repo12.pdf resources/pres_19.1_Test_repo12.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo12.pdf resources/pres_19.1_Test_repo12.png


## git log --online --graph --decorate --all


## convert  -density 300 -resize 400x resources/Rstudio_GitBranch5.png resources/RStudio_GitBranch5_small.png


## git diff master <branch>


## cd ~/tmp/Test_repo

## git diff master Experimental


## git merge <Name>


## cd ~/tmp/Test_repo

## git merge Experimental -m 'Merge master and Experimental'


## ----gert_merge, results='markdown', eval=FALSE, echo=2:3---------------------
## oldwd=setwd('~/tmp/Test_repo')
## gert::git_branch_checkout('master') # ensure on master branch
## gert::git_merge(ref='Experimental')
## setwd(oldwd)


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo13.png

## convert  -density 300 -resize 500x resources/Test_repo13.png resources/Test_repo13.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo13.tex

## mv pres_19.1_Test_repo13.pdf resources/pres_19.1_Test_repo13.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo13.pdf resources/pres_19.1_Test_repo13.png


## ----create_github_token, results='markdown', eval=FALSE----------------------
## usethis::create_github_token()


## ----gitcreds_set, results='markdown', eval=FALSE-----------------------------
## gitcreds::gitcreds_set()


## ----gitcreds_get, results='markdown', eval=TRUE------------------------------
gitcreds::gitcreds_get()
#gh::gh_whoami()


## ----use_git_hub, results='markdown', eval=FALSE------------------------------
## usethis::use_github()


## convert  -density 300 -resize 500x resources/Github1.png resources/Github1_small.png

## convert  -density 300 -resize 500x resources/Github2.png resources/Github2_small.png


## cd ~/tmp/Test_repo

## git remote add origin https://github.com/pcinereus/Test.git

## git push -u origin master

## cd ~/tmp/Test_repo

## git remote add origin git@github.com:pcinereus/Test.git

## #git push -u origin master


## ----git_remote_add, results='markdown', eval=FALSE---------------------------
## gert::git_remote_add(url='https://github.com/pcinereus/Test.git')
## gert::git_remote_list()


## convert  -density 300 -resize 500x resources/Github3.png resources/Github3_small.png


## convert  -density 300 -resize 500x resources/Github4.png resources/Github4_small.png


## ---- engine='R',results="markup", prompt=FALSE,eval=FALSE--------------------
## mean(c(1,2,3))
## sd(c(1,2,3))


## cd ~/tmp/Test_repo

## echo 'sd(c(1,2,3))' >> test.R

## git add test.R

## git commit -m 'Modified test.R'


## ../resources/git-draw --image-only --sha1-length 5 --hide-legend --hide-reflogs --git-dir ~/tmp/Test_repo/.git --image-filename resources/Test_repo14.png

## convert  -density 300 -resize 500x resources/Test_repo14.png resources/Test_repo14.png

## ../resources/git-tikz --git-dir ~/tmp/Test_repo/.git --filename pres_19.1_Test_repo14.tex

## mv pres_19.1_Test_repo14.pdf resources/pres_19.1_Test_repo14.pdf

## convert  -density 300 -resize 250x resources/pres_19.1_Test_repo14.pdf resources/pres_19.1_Test_repo14.png


## cd ~/tmp/Test_repo

## git push -u origin master

## convert  -density 300 -resize 300x resources/Rstudio_Gitpullpush.png resources/RStudio_Gitpullpush_small.png

## convert  -density 300 -resize 300x resources/Rstudio_Gitpushpull1.png resources/RStudio_Gitpushpull1_small.png


## cd ~/tmp/Test_repo

## git clone <git name> <local name>


## convert  -density 300 -resize 200x resources/RStudio_NewProject1.png resources/RStudio_NewProject1_small.png

## convert  -density 300 -resize 200x resources/RStudio_NewProject2.png resources/RStudio_NewProject2_small.png

## convert  -density 300 -resize 200x resources/RStudio_NewProject3.png resources/RStudio_NewProject3_small.png


## cd ~/tmp/Test_repo

## git pull -v origin master

