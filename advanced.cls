% advanced_research_resume.tex v1.0
% Copyright 2016 Satoshi MURASHIGE
% The MIT License
% Based on format_nenpo (https://github.com/codeforkosen/format_nenpo) by Masayuki IZUMI

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{advanced}
\LoadClass[10pt, a4paper, twocolumn]{jsarticle}

%用紙設定
%上下余白25mm・左右余白20mm・段間余白10mm・1ページ46行・1行24文字
%行数と文字数は行間隔と文字間隔で指定(本文最初にも記述)
\renewcommand{\baselinestretch}{0.95}
\setlength{\topmargin}{-0.4truemm}
\setlength{\oddsidemargin}{-5.4truemm}
\setlength{\evensidemargin}{-5.4truemm}
\setlength{\headheight}{0truemm}
\setlength{\headsep}{0truemm}
\setlength{\textwidth}{170truemm}
\setlength{\textheight}{247truemm}
\setlength{\columnsep}{10truemm}
\setlength{\footskip}{12truemm}
\setlength{\skip\footins}{3pt plus 5pt minus 2pt}

% 文字列を等間隔で配置するマクロ
\newlength{\sectionlength}
\makeatletter
%\newcommand{\kintou}[2]{%
%	\settowidth{\sectionlength}{#2}
%	\ifdim#1>\sectionlength%
%		\leavevmode\hbox to #1{\kanjiskip\z@ plus 1fill minus 1fill\xkanjiskip\kanjiskip #2\hfil}%
%	\else%
%		#2%
%	\fi%
%}%
\def\kintou#1#2{%
	\settowidth{\sectionlength}{#2}
	\ifdim#1>\sectionlength%
		\leavevmode\hbox to #1{\kanjiskip\z@ plus 1fill minus 1fill\xkanjiskip\kanjiskip #2\hfil}%
	\else%
		#2%
	\fi
}
\makeatother

%\def\old@sect\@sect
%\def\@sect#1#2#3#4#5#6[#7]#8{%
%	\old@sect{#1}{#2}{#3}{#4}{#5}{#6}[#7]{\kintou{10zw}{#8}}%
%}

%定義変更
%セクションを年報スタイルに
\makeatletter
  \def\@seccntformat#1{% #1: <counter name>
    \@nameuse{@seccnt@prefix@#1}%
    \@nameuse{the#1}%
    \@nameuse{@seccnt@postfix@#1}%
    \@nameuse{@seccnt@afterskip@#1}}
  \def\@seccnt@postfix@section{.}
  \def\@seccnt@afterskip@section{\hskip 1em}
  \def\@seccnt@afterskip@subsection{\hskip 1em}
  \def\@seccnt@afterskip@subsubsection{\hskip 1em}
\makeatother
\renewcommand{\thesubsection}{\arabic{section}\hskip.1em$\cdot$\hskip.1em\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}\hskip.1em$\cdot$\hskip.1em\arabic{subsection}\hskip.1em$\cdot$\hskip.1em\arabic{subsubsection}}

%参考文献を年報スタイルに
\makeatletter
\renewcommand{\@cite}[1]{\textsuperscript{#1)}}
\renewcommand{\@biblabel}[1]{#1)}
\makeatother

%脚注の水平線を長くする
\renewcommand{\thefootnote}{*}
\renewcommand{\footnoterule}{%
  \kern 5pt
  \hrule width \columnwidth
  \kern 5pt
}

%脚注の開始位置を本文の頭とそろえる
\makeatletter
\renewcommand\@makefntext[1]{
\advance\leftskip 1zw
\parindent 1zw
\noindent
\llap{\@makefnmark\hskip0.3zw}#1}
\makeatother

\makeatletter
\def\kintou#1#2{%
	\hbox to#1{\kanjiskip=0pt plus 1fill minus 1fill \xkanjiskip=\kanjiskip #2}%
}

\def\jidoukintou#1{%
	\settowidth{\@tempdima}{#1}% 文字列の長さを測る
	\@jidoukintou{\@tempdima}{#1}%
}

\def\@jidoukintou#1#2{%条件判断の内部マクロ
	\ifdim#1<5zw%
		\kintou{5zw}{#2}%
	\else%
		\hbox{#2}%
	\fi%
}

\def\@sect#1#2#3#4#5#6[#7]#8{%
	\ifnum #2>\c@secnumdepth% 番号出力があるかどうかの条件
		\def\@svsec{}%
	\else%
		\refstepcounter{#1}% カウンターを1増やす
		\edef\@svsec{\csname the#1\endcsname.\hskip 1em}% 番号出力の形式
	\fi%
	\@tempskipa #5\relax% 空白をスキップに設定
	\ifdim \@tempskipa>\z@% スキップが正のとき，見出しで改行する
		\begingroup #6\relax%書体の設定
			\@hangfrom{\hskip #3\relax\@svsec}% 番号出力
				{\interlinepenalty \@M \jidoukintou{#8}\par}%タイトルを均等割り
		\endgroup%
		%#7が無いときは#8を#7に複写する
		\csname #1mark\endcsname{#7}%
		\addcontentsline{toc}{#1}{%tocファイルへ出力
			\ifnum #2>\c@secnumdepth\else%
			\protect\numberline{\csname the#1\endcsname}\fi #7%
		}%
	\else%スキップが負のとき，見出しのあと改行しない
		\def\@svsechd{%
			#6\hskip #3\@svsec \jidoukintou{#8}%タイトルを均等割り
			\csname #1mark\endcsname{#7}%
			\addcontentsline{toc}{#1}{%tocファイルへの出力
				\ifnum #2\c@secnumdepth\else%
				\protect\numberline{\csname the#1\endcsname}\fi #7%
			}%
		}%
	\fi%
	\@xsect{#5}%
}

%%%% スターつきのセクション
\def\@ssect#1#2#3#4#5{%番号出力なし，見出し均等割り
	\@tempskipa #3\relax%空白をスキップに設定
	\ifdim \@tempskipa>\z@%スキップが正なら見出しで改行する
		\begingroup #4%
			\@hangfrom{\hskip #1}{\interlinepenalty \@M \jidoukintou{#5}\par}%
		\endgroup%
	\else%スキップが負のときは見出しのあとの改行無し
		\def\@svsechd{#4\hskip #1\relax \jidoukintou{#5}}% タイトルを均等割り
	\fi%
	\@xsect{#3}%
}%
\makeatother

%ページ先頭のセクションの上余白をなくす
%\@startsection{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\makeatletter
\def\@startsection#1#2#3#4#5#6{
\if@noskipsec \leavevmode \fi
\par
\@tempskipa #4\relax
\@afterindenttrue
\ifdim \@tempskipa <\z@
\@tempskipa -\@tempskipa \@afterindentfalse
\fi
\if@nobreak
\everypar{}
\else
\addpenalty\@secpenalty\addvspace\@tempskipa
\fi
\@ifstar
{\@ssect{#3}{#4}{#5}{#6}}
{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\makeatother

\makeatletter
  % sectionをめっちゃ太くする
  \renewcommand{\headfont}{\bfseries}
  \renewcommand{\section}{
    \@startsection{section}{1}{\z@}%
    {0.6\Cvs}{\z@}%
    {\normalfont\fontsize{11pt}{14pt}\headfont\raggedright\centering}}
  % subsectionを1字下げる
  \renewcommand{\subsection}{
    \@startsection{subsection}{2}{\z@}%
    {\z@}{\z@}%
    {\normalfont\fontsize{10pt}{14pt}\headfont}}
  % subsectionを1字下げる
  \renewcommand{\subsubsection}{
    \@startsection{subsubsection}{3}{\z@}%
    {\z@}{\z@}%
    {\normalfont\fontsize{10pt}{14pt}\headfont}}
\makeatother

% maketitle
\makeatletter
  \renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\advance\leftskip 3zw
        \parindent 1zw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
        \newpage
        \global\@topnum\z@  % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \plainifnotempty
      \@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\major\relax
    \global\let\@major\@empty
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage\null
    \vskip -15pt
    \begin{center}%
      \let\footnote\thanks
	  {\fontsize{16.5pt}{0pt} \bfseries \@title \par}%
      \vskip 30pt
      {
        \lineskip .5em
        \begin{tabular}[t]{c}%
			{\large\@author}
        \end{tabular}\par}%
      \vskip 5pt
      {\large 徳山高専　　\@major \par}%
      \vskip 20pt
    \end{center}%
  }
  \long\def\major#1{\long\gdef\@major{#1}}
\makeatother

% 図と図の間のスペース
\setlength\floatsep{10pt}
% 本文と図の間のスペース
\setlength\textfloatsep{10pt}
% 本文中の図のスペース
\setlength\intextsep{3truemm}
% 図とキャプションの間のスペース
\setlength\abovecaptionskip{10pt}

% 「参考文献」を「文献」に変更する
\renewcommand{\refname}{文献}

% ページ番号を消す
\pagestyle{empty}

