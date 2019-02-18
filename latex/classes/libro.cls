%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Libro                                    %
% Version 1.0 by Miguel Angel Piña Avelino %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de la clase para el libro %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{latex/classes/libro}[2016/12/21 v1 libro class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, letterpaper]{book}
\else
   \LoadClass[pdftex, letterpaper]{book}
\fi



%%%%%%%%%%%%%%%%%%%%%%%%
% Paquetes utilizados. %
%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[spanish,mexico,activeacute]{babel} % Soporte multilenguaje y locales.
\usepackage[utf8x]{inputenc} % Soporte para el ingreso de caracteres en UTF8
\usepackage[T1]{fontenc} % El tipo de codificación para la fuente
\usepackage[usenames, dvipsnames]{color} % Soporte de colores
\usepackage{color,soulutf8}
\usepackage{titlesec} % Headings alternativos
\usepackage{fancyhdr} % Headings
\usepackage{setspace}
\usepackage{titlesec}
\usepackage{amssymb,amsmath,amsfonts,amsthm}
\usepackage{geometry}
\usepackage{graphicx}

\usepackage[margin=10pt,font=small,labelfont=bf]{caption}
\usepackage{minitoc}
\usepackage[intoc,spanish]{nomencl}
\usepackage{quotchap}
\usepackage{titlesec}
\usepackage{fancybox}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuraciones varias %
%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}


%%%%%%%%%%%%%%%
% Frontmatter %
%%%%%%%%%%%%%%%

\newenvironment{alwayssingle}{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \else\newpage\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

% Entorno para el prefacio de un libro

\newenvironment{prefacio} {
  \begin{alwayssingle} \pagestyle{empty}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Prefacio}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
{\end{quote}\end{alwayssingle}}

% Agradecimientos del libro

\newenvironment{agradecimientos} {
  \pagestyle{empty}
  \begin{alwayssingle}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Agradecimientos}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
{\end{quote}\end{alwayssingle}}

% Estilo del frontmatter

\renewcommand{\frontmatter} {
  \cleardoublepage{}
  \pagestyle{fancy}
  \pagenumbering{roman}
  \titleformat{\chapter}[display]%
  {\filleft}%
  {\color{Gray}{\filleft\small{\bfseries CAPÍTULO}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  {2ex}
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%
  \titlespacing{\chapter}{3mm}{*10}{15mm}[3mm] %
  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing*{\section}{0pt}{*4}{*1}
  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing*{\subsection}{0pt}{*4}{*1}
  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing*{\subsubsection}{0pt}{*4}{0.5ex}
}


\renewcommand{\mainmatter}{
  \cleardoublepage{}
  \pagestyle{fancy}
  \pagenumbering{arabic}
  \titleformat{\chapter}[display]
  {\filleft}
  {\color{Gray}{\filleft\small{\bfseries CAPÍTULO}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  {2ex}
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%

  \titlespacing{\chapter}{3mm}{*10}{15mm}[3mm] %
  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing*{\section}{0pt}{*4}{*1}
  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing*{\subsection}{0pt}{*4}{*1}
  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing*{\subsubsection}{0pt}{*4}{0.5ex}
}

\renewcommand{\backmatter}{%
  \cleardoublepage{}
  \pagestyle{fancy}

  \titleformat{\chapter}[display]%
  {\filleft}%
  {\color{Gray}{\filleft\small{\bfseries APÉNDICE}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  {2ex}
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%
  \titlespacing{\chapter}{3mm}{*10}{15mm}[3mm] %

  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing*{\section}{0pt}{*4}{*1}

  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing*{\subsection}{0pt}{*4}{*1}

  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing*{\subsubsection}{0pt}{*4}{0.5ex}
}

% Números de páginas: Romanos + arábigos

\newenvironment{romanpages}
{
	\setcounter{page}{1}
	\renewcommand{\thepage}{\roman{page}}
}

{
	\newpage
	\renewcommand{\thepage}{\arabic{page}}
	\setcounter{page}{1}
}


\newtheorem{definition}{Definición}[chapter]
\newtheorem{theorem}{Teorema}[chapter]
\renewcommand\qedsymbol{$\blacksquare$}

\newenvironment{changemargin}[2]{%
  \begin{list}{}{%
      \setlength{\topsep}{0pt}%
      \setlength{\leftmargin}{#1}%
      \setlength{\rightmargin}{#2}%
      \setlength{\listparindent}{\parindent}%
      \setlength{\itemindent}{\parindent}%
      \setlength{\parsep}{\parskip}%
    }%
  \item[]}
  {\end{list}
}
