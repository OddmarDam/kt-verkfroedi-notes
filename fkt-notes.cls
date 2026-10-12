% fkt-notes.cls
% Shared document class for coursework notes, assignments, and reports
% across the KT-verkfrøði (Software Engineering) programme.
%
% Usage (in a course's main.tex):
%   \documentclass{fkt-notes}
%   \course{Discrete Mathematics}
%   \coursecode{DM101}
%   \semester{Fall 2026}
%   \author{Oddmar Dam}
%   \title{Lecture 3 --- Graph Theory}
%   \begin{document}
%   \maketitle            % or \makecoverpage for a full cover page
%   ...                   %   (add \teacher{Name} to show the teacher)
%   \end{document}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fkt-notes}[2026/08/14 FKT coursework notes class]

\LoadClass[11pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
% headheight=14pt: fancyhdr needs at least 13.6pt for an 11pt body font and
% warns otherwise. Set it via geometry so the page layout is computed with
% it, rather than \setlength afterwards which leaves \topmargin stale.
\RequirePackage[margin=2.5cm,headheight=14pt]{geometry}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage{xcolor}

% TikZ for the diagrams this programme keeps needing: Venn diagrams in the
% set-theory sections, then trees and graphs later in Diskret stoeddfroedi.
% Loaded after xcolor because pgf pulls xcolor in itself, and this way the
% options above win. Libraries: positioning/calc for placing and computing
% coordinates, arrows.meta for directed edges, shapes.geometric for nodes,
% fit for boxing a group of nodes, trees for tree layouts.
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc,arrows.meta,shapes.geometric,fit,trees}

\hypersetup{
  colorlinks=true,
  linkcolor=blue!50!black,
  urlcolor=blue!50!black,
  citecolor=blue!50!black,
}

% --- Course metadata ---
\newcommand{\@fktcourse}{}
\newcommand{\course}[1]{\renewcommand{\@fktcourse}{#1}}
\newcommand{\@fktcoursecode}{}
\newcommand{\coursecode}[1]{\renewcommand{\@fktcoursecode}{#1}}
\newcommand{\@fktsemester}{}
\newcommand{\semester}[1]{\renewcommand{\@fktsemester}{#1}}

\newcommand{\@fktteacher}{}
\newcommand{\teacher}[1]{\renewcommand{\@fktteacher}{#1}}
\newcommand{\@fktstudentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@fktstudentid}{#1}}

% Optional full-page cover for submitted work: call \makecoverpage instead of
% \maketitle. Uses the same metadata, plus \studentid{} and \teacher{} if set. The Setur logo
% (which carries the university name) is shown when shared/figures/setur.png
% exists, otherwise the name is set as text -- latex/shared/ is on TEXINPUTS
% recursively, so the bare filename is enough.
\newcommand{\@fktinstitution}{%
  \IfFileExists{setur.png}%
    {\includegraphics[height=1.6cm]{setur.png}\par\vspace{0.8em}}%
    {{\large Fróðskaparsetur Føroya \textbullet{} University of the Faroe Islands\par}}%
}
% The titlepage environment resets the page counter, so the cover and the
% first content page would both be page 1 and hyperref would warn about a
% duplicate page.1 anchor. Numbering the cover in Alph gives it a distinct
% anchor (page.A); \pagenumbering{arabic} afterwards restarts at 1.
\newcommand{\makecoverpage}{%
  \pagenumbering{Alph}%
  \begin{titlepage}
    \sffamily
    \vspace*{2cm}
    \@fktinstitution
    \vspace{0.2em}
    {\normalsize BSc Software Engineering (KT-verkfrøði)\par}
    \vspace{0.6em}
    \rule{\linewidth}{0.8pt}\par
    \vspace{4cm}
    {\Huge\bfseries \@title\par}
    \vspace{0.8em}
    {\Large \@fktcourse\par}
    \vspace{0.3em}
    {\large Course \@fktcoursecode\ \textbullet{} \@fktsemester\par}
    \vfill
    \begin{tabular}{@{}ll@{}}
      Student:   & \@author \\
      \ifx\@fktstudentid\@empty\else Student ID: & \@fktstudentid \\ \fi
      \ifx\@fktteacher\@empty\else Teacher: & \@fktteacher \\ \fi
      Submitted: & \@date \\
    \end{tabular}\par
    \vspace{0.6em}
    \rule{\linewidth}{0.8pt}\par
    \vspace{1cm}
  \end{titlepage}%
  \pagenumbering{arabic}%
}

\renewcommand{\maketitle}{%
  \begin{center}
    {\LARGE \bfseries \@title \par}
    \vspace{0.3em}
    {\large \@fktcourse\ (\@fktcoursecode) \par}
    {\normalsize \@fktsemester \par}
    \vspace{0.3em}
    {\normalsize \@author \; --- \; \@date \par}
  \end{center}
  \vspace{1em}
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\@fktcourse}
\fancyhead[R]{\@fktsemester}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

% --- Code listings defaults ---
\lstset{
  basicstyle=\ttfamily\small,
  breaklines=true,
  breakatwhitespace=true,   % wrap long lines between words, not mid-identifier
  showstringspaces=false,   % plain spaces in strings, not a visible ␣
  frame=single,
  numbers=left,
  numberstyle=\tiny,
  keywordstyle=\color{blue!70!black},
  commentstyle=\color{gray},
  stringstyle=\color{green!40!black},
  tabsize=2,
  % listings reads input byte by byte and drops multi-byte UTF-8, so map
  % the Faroese/Danish letters (Klaksvík, Tórshavn, ...) explicitly.
  literate=
    {á}{{\'a}}1 {Á}{{\'A}}1 {é}{{\'e}}1 {É}{{\'E}}1
    {í}{{\'i}}1 {Í}{{\'I}}1 {ó}{{\'o}}1 {Ó}{{\'O}}1
    {ú}{{\'u}}1 {Ú}{{\'U}}1 {ý}{{\'y}}1 {Ý}{{\'Y}}1
    {æ}{{\ae}}1 {Æ}{{\AE}}1 {ø}{{\o}}1  {Ø}{{\O}}1
    {å}{{\aa}}1 {Å}{{\AA}}1 {ð}{{\dh}}1 {Ð}{{\DH}}1,
}

% --- Theorem-style environments (useful for math-stats) ---
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{remark}
\newtheorem*{example}{Example}
\newtheorem*{remark}{Remark}
\newtheorem*{claim}{Claim}

\endinput
