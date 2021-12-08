%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% provided by xingziyang at LUT
%% email: xingziyangxyz@126.com
%% this project origined from HNU
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{lutthesis}
    [2021/12/06 v0.1 LUT thesis template]

% 变量
\newif\if@lut@doctor
\newif\if@lut@numerical
\newif\if@lut@super
\newif\if@lut@pdf
\DeclareOption{doctor}{\@lut@doctortrue}
\DeclareOption{print}{\@lut@pdffalse}
\DeclareOption{pdf}{\@lut@pdftrue}
\DeclareOption{super}{\@lut@numericaltrue\@lut@supertrue}
\DeclareOption{numbers}{\@lut@numericaltrue\@lut@superfalse}
\DeclareOption{authoryear}{\@lut@numericalfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{doctor,chinese,print,super}
\ProcessOptions\relax
\newif\if@lut@addtocspace
\if@lut@pdf
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[UTF8, a4paper, openany, zihao=-4]{ctexbook}[2015/05/14]
\RequirePackage{etoolbox}
\@ifclasslater{ctexbook}{2015/05/14}{}{%
    \ClassError{lutthesis}{%
        Requiring ctex 2.0 or later version!\MessageBreak
        Please update the package using your\MessageBreak
        TeX package manager or from CTAN
    }{%
        See logs for more details.
    }
}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKfamilyfont{hei}{SimHei.ttf}
\newcommand{\hei}{\CJKfamily{hei}}
\RequirePackage{hyperref}
\hypersetup{
    bookmarksopen=true,
    bookmarksnumbered=true,
    bookmarksopenlevel=1,
    CJKbookmarks=true,
    pdfborder=0 0 0,
    unicode=true,
    linktoc=all,
}
\if@lut@pdf
    \hypersetup{
        colorlinks=true,
        allcolors=blue,
    }
\fi

\AtBeginDocument{
    \hypersetup{
        pdftitle={\lut@title},
        pdfauthor={\lut@author}
    }
}

\RequirePackage{xparse}
\NewDocumentCommand\setfontsize{mo}{\IfValueTF{#2}{\fontsize{#1}{#2}}{\fontsize{#1}{2\dimexpr#1}}\linespread{1}\selectfont\relax}
\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}
\newcommand\lut@underline[2][6em]{%
    \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt\relax
}
\def\lut@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname lut@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\lut@define@term{lutcode}
\lut@define@term{lutname}
\lut@define@term{title}
\lut@define@term{clc}
\lut@define@term{secrettext}
\lut@define@term{author}
\lut@define@term{authorid}
\lut@define@term{college}
\lut@define@term{major}
\lut@define@term{workon}
\lut@define@term{supervisor}
\lut@define@term{cosupervisor}
\lut@define@term{submitdate}
\lut@define@term{defensedate}
\lut@define@term{chair}
\lut@define@term{entitle}
\lut@define@term{enauthor}
\lut@define@term{enmajor}
\lut@define@term{endoctor}
\lut@define@term{enmaster}
\lut@define@term{enbachelor}
\lut@define@term{enlutname}
\lut@define@term{ensupervisor}
\lut@define@term{endate}

\if@lut@doctor
  \newcommand\lut@thesisname{硕士学位论文}%
\fi

% 表格：
% 三线表
\RequirePackage{booktabs}
\RequirePackage{multirow}
% 跨页表格
% \RequirePackage{longtable}



% 题注、标题
\renewcommand\listfigurename{插图索引}
\renewcommand\listtablename{附表索引}
\newcommand\lut@notesname{\textbf{注}：}
\newcommand\lut@enabstractname{Abstract}
\newcommand\lut@abstractname{摘要}
\newcommand\lut@acknowledgementsname{致谢}
\newcommand\lut@tocname{目录}
\newcommand\lut@summaryname{总结与展望}
\newcommand\lut@notationname{符号说明}
\def\equationautorefname~#1\null{公式~(#1)\null}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname~#1\null{第~#1~项\null}%
\def\figureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname~#1\null{第~#1~部分\null}%
\def\appendixautorefname{}%
\def\lut@appendixAname{附录A{\quad}攻读学位期间所发表的学术论文目录}
\def\lut@appendixBname{附录B{\quad}参加科研项目情况}
\def\chapterautorefname~#1\null{第~#1~章\null}%
\def\sectionautorefname~#1\null{第~#1~节\null}%
\def\subsectionautorefname~#1\null{第~#1~小节\null}%
\def\subsubsectionautorefname~#1\null{第~#1~小小节\null}%
\def\paragraphautorefname~#1\null{第~#1~段\null}%
\def\subparagraphautorefname~#1\null{第~#1~小段\null}%
\def\theoremautorefname{定理}%
\def\pageautorefname~#1\null{第~#1~页\null}%

% 页面设置
\RequirePackage{geometry}
\geometry{
    paper=a4paper,
    top=2.2cm, bottom=2.2cm,
    left=2.5cm, right=2.5cm,
    headheight=0.4cm, headsep=1.3cm,
    footskip=1.1cm
    }
\RequirePackage{fancyhdr}
%页眉用5号宋体。
\renewcommand{\headrulewidth}{0.4pt}
\fancypagestyle{lut@headings}{%
  \fancyhf{}%
  \fancyhead[CE]{\setfontsize{10.5pt}\lut@title}%
  \fancyhead[CO]{\setfontsize{10.5pt}\lut@thesisname}
  \fancyfoot[C]{\setfontsize{10.5pt}\thepage}
  \fancyheadoffset[LO,LE]{3mm}
  \fancyheadoffset[RO,RE]{-3mm}
  \makeatletter
  \def\headrule{
    \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
    \hrule\@height 1.0pt \@width\headwidth\vskip 0.5pt %上面线为1pt粗
    \hrule\@height 0.5pt \@width\headwidth  %下面0.5pt粗
    \vskip-2\headrulewidth\vskip-1pt}      %两条线的距离1pt
    \vspace{7mm}
}%

\fancypagestyle{lut@notation}{\fancyfoot{}}
\pagestyle{lut@headings}
\patchcmd\chaptermark{#1}{\protect\spacetitle{#1}}{}{}
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\g@addto@macro\frontmatter{%
  \pagenumbering{Roman}%
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \@mainmattertrue
}

% 列表
\RequirePackage{enumitem}
\setitemize{leftmargin=3em,itemsep=0em,partopsep=0em,parsep=0em,topsep=-0em}
\setenumerate{leftmargin=3em,itemsep=0em,partopsep=0em,parsep=0em,topsep=0em}

% 章节、段落、页眉、页脚
\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \setlength{\baselineskip}{20pt}
  \renewcommand{\CJKglue}{\hskip 0.5pt plus \baselineskip}
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter
}

\RequirePackage{pifont}
\def\lut@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{lutthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ding{\the\numexpr\value{#1}+191\relax}
}

\RequirePackage{stringstrings}
\newcounter{titlelength}
\newcommand\spacetitle[1]{%
  \@getstringlength{#1}{titlelength}%
  \ifnum\thetitlelength=2{\ziju{2}#1}\else%
    \ifnum\thetitlelength=3{\ziju{1}#1}\else%
      \ifnum\thetitlelength=4{\ziju{0.5}#1}\else#1%
      \fi
    \fi
  \fi
}
\setcounter{secnumdepth}{5}
\ctexset{
    chapter = {
        format      = \centering\hei\setfontsize{18pt},
        nameformat  = {},
        % titleformat = \spacetitle,
        number      = \thechapter,
        aftername   = \hspace{\ccwd},
        beforeskip  = -2em, % 24bp - 31bp
        afterskip   = 1em, % 18bp - 10bp
        % fixskip   = true, % will be used in future version
    },
    section = {
        format     = \hei\setfontsize{15pt},%各节一级题序及标题				小3号黑体，上下各空12磅
        aftername  = \hspace{\ccwd},
        beforeskip = 12pt,
        afterskip  = 12pt,
    },
    subsection = {
        format     = \hei\setfontsize{14pt},%各节的二级题序及标题				4号黑体，上下各空6磅；
        aftername  = \hspace{\ccwd},
        % indent     = 2\ccwd,
        beforeskip = 6pt,
        afterskip  = 6pt,
    },
    subsubsection = {
        format    = \hei\setfontsize{12pt},%各节的三级题序及标题				小4号黑体；上下各空6磅；
        aftername  = \hspace{\ccwd},
        % aftername = \hspace{\ccwd},
        beforeskip = 6pt,
        afterskip  = 6pt,
        % indent    = 3\ccwd,
    },
    paragraph = {
        format    = \setfontsize{12.5pt},
        number    = (\arabic{paragraph}),
        aftername = \hspace{\ccwd},
        % indent    = 3\ccwd,
    },
    subparagraph = {
        format    = \setfontsize{12.5pt},
        number    = \lut@textcircled{subparagraph},
        aftername = \hspace{\ccwd},
        % indent    = 3\ccwd,
    },
}

% 书签
\newcounter{lut@pdfbookmark}
\NewDocumentCommand\lut@chapter{o m}{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \addtocounter{lut@pdfbookmark}\@ne
  \IfValueTF{#1}{%
    % \pdfbookmark[0]{#1}{lutchapter.\thelut@pdfbookmark}%
    \chaptermark{#1}%
  }{%
    % \pdfbookmark[0]{#2}{lutchapter.\thelut@pdfbookmark}%
    \chaptermark{#2}%
  }%
  \chapter*{#2}
}

% 封面
\renewcommand\maketitle{%
    \newgeometry{
        top=3.8cm, bottom=3.8cm,
        left=3.2cm, right=3.2cm,
        headheight=0cm, headsep=0.8cm,
        footskip=0.8cm}
    \pagenumbering{gobble}
    \pdfbookmark[0]{封面}{titlepage}
    \make@cntitle
    \pdfbookmark[0]{Title page}{entitlepage}
    \make@entitle
    \pdfbookmark[0]{原创性声明}{statement}
    \make@statement
}

\newcommand\lut@supervisorline{%
  \ifx\lut@encosupervisor\@empty%
    Supervisor: \lut@ensupervisor%
  \else%
    Supervisors: \lut@ensupervisor, \lut@encosupervisor%
  \fi}

\RequirePackage{tikz}
\newcommand\vpostext[2]{%
  \tikz[remember picture,overlay]%
      \node [yshift=-#1] at (current page.north) [below,align=flush center]%
          {\parbox{\textwidth}{\centering#2}};
}

\newcommand\linetext[3]{%
  \underline{\makebox[#1][#2]{#3}}
}


% 中文封面
\RequirePackage{tabularx}
\newcommand\make@cntitle{%
  \begin{titlepage}%
     \tikz[remember picture,overlay]%
        \node [xshift=2.5cm,yshift=-2.5cm] at (current page.north west)%
            [below right,align=left] {%

          \newlength{\@tw}
          \setlength{\@tw}{55pt}
          \newlength{\@cw}
          \setlength{\@cw}{3.2cm}

          \setfontsize{12.5pt}%
          \begin{tabularx}{\linewidth}{lcccr}%
            \makebox[\@tw][s]{\sffamily\textbf{学校代号}} & \linetext{\@cw}{c}{\lut@lutcode} &
            \makebox[2.5cm][c]{\qquad} &
            \makebox[\@tw][s]{\sffamily\textbf{学号}} & \linetext{\@cw}{c}{\lut@authorid} \\%
            \makebox[\@tw][s]{\sffamily\textbf{分类号}} & \linetext{\@cw}{c}{\lut@clc} &
            \makebox[2.5cm][c]{\qquad} &
            \makebox[\@tw][s]{\sffamily\textbf{密级}} & \linetext{\@cw}{c}{\lut@secrettext}
          \end{tabularx}};%

      \vpostext{5cm}{\includegraphics[height=6cm]{figures/lut-logo.pdf}}%
      \vpostext{12cm}{\bf\sffamily\setfontsize{22pt}\lut@thesisname}%
      \vpostext{15cm}{\bf\sffamily\setfontsize{26pt}\lut@title}%

      \tikz[remember picture,overlay]
        \node [xshift=5cm,yshift=-20cm] at (current page.north west)%
            [below right,align=left] {%
          \setlength{\@tw}{94pt}
          \setlength{\@cw}{6.4cm}

          \setfontsize{12.5pt}%
          \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
            \makebox[\@tw][s]{\sffamily\textbf{学位申请人姓名}} & \linetext{\@cw}{l}{\qquad\lut@author} \\%
            \makebox[\@tw][s]{\sffamily\textbf{培养单位}} & \linetext{\@cw}{l}{\qquad\lut@college} \\
            \makebox[\@tw][s]{\sffamily\textbf{导师姓名及职称}} & \linetext{\@cw}{l}{\qquad\lut@supervisor} \\
            \makebox[\@tw][s]{\sffamily\textbf{学科专业}} & \linetext{\@cw}{l}{\qquad\lut@major} \\
            \makebox[\@tw][s]{\sffamily\textbf{研究方向}} & \linetext{\@cw}{l}{\qquad\lut@workon} \\
            \makebox[\@tw][s]{\sffamily\textbf{论文提交日期}} & \linetext{\@cw}{l}{\qquad\lut@submitdate}
          \end{tabular}};%

      \clearpage
      \thispagestyle{empty}

      \tikz[remember picture,overlay]
        \node [xshift=5cm,yshift=-2.5cm] at (current page.north west)%
            [below right,align=left] {%

          \setlength{\@tw}{66.5pt}
          \setlength{\@cw}{3.2cm}

          \setfontsize{12.5pt}%
          \begin{tabularx}{\linewidth}{ll}%
            \makebox[\@tw][s]{\sffamily\textbf{学校代号：}} & \makebox[\@cw][l]{\lut@lutcode} \\
            \makebox[\@tw][s]{\sffamily\textbf{学号：}} & \makebox[\@cw][l]{\lut@authorid} \\
            \makebox[\@tw][s]{\sffamily\textbf{密级：}} & \makebox[\@cw][l]{\lut@secrettext}
          \end{tabularx}};%

      \tikz[remember picture,overlay]
        \node [xshift=5.4cm,yshift=-8cm] at (current page.north west)%
            [below right,align=left]%
            {\parbox{\textwidth}{\setfontsize{18pt}\lut@lutname\lut@thesisname}};

      \tikz[remember picture,overlay]
        \node [xshift=5.4cm,yshift=-12cm] at (current page.north west)%
            [below right,align=left]%
            {\parbox{12cm}{\bf\sffamily\setfontsize{22pt}\lut@title}};

      \tikz[remember picture,overlay]
        \node [xshift=5.2cm,yshift=-18cm] at (current page.north west)%
            [below right,align=left] {%
          \setlength{\@tw}{107pt}
          \setlength{\@cw}{9.5cm}

          \setfontsize{12.5pt}%
          \begin{tabular}{@{}l}%
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{学位申请人姓名：}}\qquad\lut@author} \\%
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{培养单位：}}\qquad\lut@college} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{导师姓名及职称：}}\qquad\lut@supervisor} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{专业名称：}}\qquad\lut@major} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{论文提交日期：}}\qquad\lut@submitdate} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{论文答辩日期：}}\qquad\lut@defensedate} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{答辩委员会主席：}}\qquad\lut@chair}
          \end{tabular}};%
    \end{titlepage}
}

% 英文封面
\newcommand\make@entitle{%
    \begin{titlepage}%
      \vpostext{4cm}{\setfontsize{15pt}{\lut@entitle}}%
      \vpostext{6.5cm}{\setfontsize{14pt}{by}}
      \vpostext{8cm}{\setfontsize{14pt}{\lut@enauthor}}%
      \vpostext{9.5cm}{\setfontsize{16pt}{\lut@enbachelor}}
      \vpostext{11cm}{\setfontsize{14pt}{A thesis submitted in partial satisfaction of the}}
      \vpostext{12cm}{\setfontsize{14pt}{Requirements for the degree of}}
      \vpostext{13cm}{\setfontsize{14pt}{\lut@endoctor}}
      \vpostext{14cm}{\setfontsize{14pt}{in}}%
      \vpostext{15cm}{\setfontsize{14pt}{\lut@enmajor}}%
      \vpostext{16cm}{\setfontsize{14pt}{in the}}%
      \vpostext{17cm}{\setfontsize{14pt}{School of Mechanical and Electronical Engineering}}%
      \vpostext{18cm}{\setfontsize{14pt}{\lut@enlutname}}%
      \vpostext{19cm}{\setfontsize{14pt}{Supervisor}}%
      \vpostext{20cm}{\setfontsize{14pt}{\lut@ensupervisor}}%
      \vpostext{21cm}{\setfontsize{14pt}{\lut@endate}}%
    \end{titlepage}
}

% 声明
\newcommand{\lut@declaretext} {
  本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。除了文中特别加以标注引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写的成果作品。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律后果由本人承担。
}

\newcommand{\lut@authorization}{
  本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权兰州理工大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。

  本学位论文属于

    \qquad\qquad\qquad\quad 1、保密 $\square$，在\lut@underline[2.5em]{}年解密后适用本授权书。

    \qquad\qquad\qquad\quad 2、不保密 $\square$。

    \qquad\qquad\qquad\quad（请在以上相应方框内打“\checkmark ”）
}

\newcommand\make@statement{
    \newgeometry{left=3.3cm,right=3.3cm,top=3.5cm, bottom=3cm}
    \thispagestyle{plain}
    \pagenumbering{gobble}
    \setfontsize{12.5pt}[20pt]
    \vspace*{-0.15cm}
    \begin{center}
      \sffamily
      \setfontsize{18pt}
      \makebox[3.5cm][s]{\textbf\lut@lutname}\\
      \textbf{学位论文原创性声明}
    \end{center}
    \vskip 0.3cm

    \lut@declaretext\par

    \vskip 1cm
    作者签名：\qquad\qquad\qquad\qquad\qquad\quad 日期：\qquad\quad 年\qquad 月\qquad 日
    \vskip 1cm

    \begin{center}
      \sffamily
      \setfontsize{18pt}\textbf{学位论文版权使用授权书}
    \end{center}
    \vskip 0.3cm

    \lut@authorization\par
    \vskip 1cm

    作者签名：\qquad\qquad\qquad\qquad\qquad\quad 日期：\qquad\quad 年\qquad 月\qquad 日
    
    导师签名：\qquad\qquad\qquad\qquad\qquad\quad 日期：\qquad\quad 年\qquad 月\qquad 日
    \restoregeometry
}

% 目录
\renewcommand\tableofcontents{%
    \clearpage%
    \pagenumbering{gobble}
    % \addcontentsline{toc}{chapter}{\lut@tocname}
    \lut@chapter{\lut@tocname}%
    \@starttoc{toc}
}

\RequirePackage{titletoc}
\renewcommand\contentsname{\bf\sffamily\setfontsize{18pt} 目录}
\newcommand\lut@leaders{\titlerule*[0.5pc]{$\cdot$}}
  \titlecontents{chapter}[3.8em]
    {\hspace{-3.8em} \hei}
    {\thecontentslabel}
    {}{\titlerule*[4pt]{.}\contentspage}
    \dottedcontents{section}[38pt]{}{22pt}{0.3pc}
    \dottedcontents{subsection}[57pt]{}{32pt}{0.3pc}
    \dottedcontents{acknowledgements}[38pt]{}{22pt}{0.3pc}

  \titlecontents{figure}[0bp]
      {\setfontsize{12.5pt}}
      {\figureautorefname\hspace*{0.5em}\thecontentslabel\quad}
      {}{\lut@leaders\contentspage}
  \titlecontents{table}[0bp]
      {\setfontsize{12.5pt}}
      {\tableautorefname\hspace*{0.5em}\thecontentslabel\quad}
      {}{\lut@leaders\contentspage}
      % 为了让图目录另页起，重新定义 \cs{listoffigures}
\renewcommand\listoffigures{%
    \clearpage
    \lut@chapter{\setfontsize{14pt}\hei\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}
    \@starttoc{lof}}
    % 表目录同样
\renewcommand\listoftables{%
    \clearpage
    \lut@chapter{\setfontsize{14pt}\hei\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}
    \@starttoc{lot}}

% 摘要、关键字
\newenvironment{abstract}{%
    \lut@chapter{\setfontsize{18pt}\lut@abstractname}%
    \addcontentsline{toc}{chapter}{\lut@abstractname}
    \pagenumbering{Roman}
    \setcounter{page}{1}
  }{}
\newenvironment{enabstract}{%
    \lut@chapter{\setfontsize{18pt}\textbf{\lut@enabstractname}}
    \addcontentsline{toc}{chapter}{\lut@enabstractname}
  }{}

\newenvironment{summary}{%
    \lut@chapter{\setfontsize{18pt}\hei\lut@summaryname}%
    \addcontentsline{toc}{chapter}{\lut@summaryname}
}{}

\newenvironment{acknowledgements}{%
    \lut@chapter{\setfontsize{22pt}\hei\lut@acknowledgementsname}%
    \addcontentsline{toc}{chapter}{\lut@acknowledgementsname}
}{}

\newenvironment{appendixA}{%
    \lut@chapter{\setfontsize{18pt}\hei\lut@appendixAname}%
    \addcontentsline{toc}{chapter}{\lut@appendixAname}
}{}

\newenvironment{appendixB}{%
    \lut@chapter{\setfontsize{18pt}\hei\lut@appendixBname}%
    \addcontentsline{toc}{chapter}{\lut@appendixBname}
}{}

\newcommand\keywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=4\ccwd\relax%
  \setfontsize{12pt}\sffamily\hei{关键词}：#1}
\newcommand\enkeywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=5.3em\relax%
  \textbf{Key Words}: #1}

\newenvironment{notation}{%
    \cleardoublepage
    \thispagestyle{lut@notation}
    \ctexset{chapter/format = \centering\rmfamily\setfontsize{12bp}}
    \lut@chapter{\lut@notationname}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}
\newdimen\bp@ \bp@=1bp

% 符号与大小的设定
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12\bp@}{20\bp@}%
  \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
  \renewcommand\small{%
     \@setfontsize\small{10.5\bp@}{17.5\bp@}%
     \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
     \abovedisplayshortskip \z@ \@plus3\bp@
     \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
     \def\@listi{\leftmargin\leftmargini
                 \topsep 9\bp@ \@plus3\bp@ \@minus5\bp@
                 \parsep 4.5\bp@ \@plus2\bp@ \@minus\bp@
                 \itemsep \parsep}%
     \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\footnotesize{%
     \@setfontsize\footnotesize{9\bp@}{15\bp@}
     \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
     \abovedisplayshortskip \z@ \@plus3\bp@
     \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
     \def\@listi{\leftmargin\leftmargini
                 \topsep 6\bp@ \@plus2\bp@ \@minus2\bp@
                 \parsep 3\bp@ \@plus2\bp@ \@minus\bp@
                 \itemsep \parsep}%
     \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{12.5\bp@}}
  \renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{10.83\bp@}}
  \renewcommand\large{\@setfontsize\large{15\bp@}{25\bp@}}
  \renewcommand\Large{\@setfontsize\Large{18\bp@}{30\bp@}}
  \renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{36.67\bp@}}
  \renewcommand\huge{\@setfontsize\huge{24\bp@}{40\bp@}}
  \renewcommand\Huge{\@setfontsize\Huge{26\bp@}{43.33\bp@}}

% 排版风格，标题，图表
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{\z@}
\RequirePackage{upgreek}
\renewcommand\pi{\uppi}
\RequirePackage{amssymb}
\renewcommand\le{\leqslant}
\renewcommand\leq{\leqslant}
\renewcommand\ge{\geqslant}
\renewcommand\geq{\geqslant}
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.65}
\renewcommand\textfraction{.15}
\renewcommand{\floatpagefraction}{.6}
\RequirePackage{caption}
\RequirePackage{calc}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\DeclareCaptionFont{hei}{\hei}
\captionsetup{
    format = hang,
    font = {small,hei},
    labelsep = zhspace,
}
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = {12bp-\intextsep},
}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp,
}
\newcommand\note[1]{%
    \captionsetup{position = bottom, font = small}
    \caption*{\hangindent=2\ccwd\relax\lut@notesname\rmfamily#1}}
\renewcommand{\thefootnote}{\lut@textcircled{footnote}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.25\textwidth
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
  \parindent 2\ccwd%
  \noindent
  \hb@xt@2\ccwd{\hss\@makefnmark}#1}
\RequirePackage[sort&compress]{natbib}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\def\tmp@numerical{numerical}
\def\tmp@authoryear{authoryear}
\newcommand\lutbibstyle[1]{%
  \def\tmp@gbt{#1}%
  \ifx\tmp@gbt\tmp@numerical%
    \bibliographystyle{gbt7714-numerical}%
  \fi%
}

\if@lut@numerical
  \if@lut@super
    \citestyle{super}
  \else
    \citestyle{numbers}
  \fi
  \bibliographystyle{gbt7714-numerical}%
\else
  \citestyle{authoryear}
  \bibliographystyle{lutauthoryear}%
\fi

% 引用
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\renewcommand\NAT@citenum%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\renewcommand\bibfont{\setfontsize{12pt}[20bp]}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
  \do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
  \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
  \do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}
\renewcommand\bibsection{%
    \@mainmatterfalse
    \chapter{\bibname}%
    \@mainmattertrue
}

% 数学符号：
\RequirePackage{amsmath,amsthm}
\makeatletter
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{16pt}
  \setlength\belowdisplayskip{16pt}
  \setlength\abovedisplayshortskip{16pt}
  \setlength\belowdisplayshortskip{16pt}
}
% \newcommand\eu{\mathrm{e}}
% \newcommand\iu{\mathrm{i}}
%\newcommand*{\diff}{\mathop{}\!\mathrm{d}}
%\DeclareMathOperator*{\argmax}{arg\,max}
%\DeclareMathOperator*{\argmin}{arg\,min}
% 数学定理：
% 以下定义数学定理环境默认风格为 lutplain。
\newtheoremstyle{lutplain}%
    {}{}%
    {}{2\ccwd}%
    {\bfseries}{}%
    {\ccwd}{}
\theoremstyle{lutplain}
% 定义新的定理

\newcommand\lut@assertionname{断言}
\newcommand\lut@axiomname{公理}
\newcommand\lut@corollaryname{推论}
\newcommand\lut@definitionname{定义}
\newcommand\lut@examplename{例}
\newcommand\lut@lemmaname{引理}
\newcommand\lut@proofname{证明}
\newcommand\lut@propositionname{命题}
\newcommand\lut@remarkname{注}
\newcommand\lut@theoremname{定理}
\newtheorem{theorem}                {\lut@theoremname}     [chapter]
\newtheorem{assertion}  [theorem]   {\lut@assertionname}
\newtheorem{axiom}      [theorem]   {\lut@axiomname}
\newtheorem{corollary}  [theorem]   {\lut@corollaryname}
\newtheorem{lemma}      [theorem]   {\lut@lemmaname}
\newtheorem{proposition}[theorem]   {\lut@propositionname}
\newtheorem{definition}             {\lut@definitionname}  [chapter]
\newtheorem{example}                {\lut@examplename}     [chapter]
\newtheorem*{remark}                {\lut@remarkname}
% \pkg{amsthm} 单独定义了 proof 环境，这里重新定义以满足格式要求。
% 原本模仿 \pkg{amsthm} 写成 |\item[\hskip\labelsep\hskip2\ccwd #1\hskip\ccwd]|，
% 但是却会多出一些间隙。
\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
        \item\relax\hskip2\ccwd
        \textbf{#1}
        \hskip\ccwd\ignorespaces
    }{%
    \popQED\endtrivlist\@endpefalse
}
\renewcommand\proofname\lut@proofname

% 算法和代码：
% 算法环境
\RequirePackage[algoruled, algochapter, lined, linesnumbered]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\RequirePackage{listings}
\lstset{
    basicstyle=\small\ttfamily,
    xleftmargin=2pc,
    xrightmargin=2pc,
    frame=single,
    columns=flexible,
    numbers=left,
}
\newcommand{\rememberlines}{\xdef\rememberedlines{\number\value{AlgoLine}}}
\newcommand{\resumenumbering}{\setcounter{AlgoLine}{\rememberedlines}}

\RequirePackage[skins]{tcolorbox}
\newtcolorbox{talgorithm}[2][]{%
  blanker,float=tbp,grow to left by=#2,grow to right by=#2,
  before upper={\begin{algorithm}[H]},
  after upper={\end{algorithm}},
  #1
}
