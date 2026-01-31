% apuntes.cls
% Clase personalizada para tomar apuntes
% Autor: Pablo Martín Yuste, 19/01/2026

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apuntes}[2026/01/19 Clase personalizada para Apuntes]

% Esta clase parte de la clase básica {article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Paquetes utilizados

% Tipografía y Encoding
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} %Fuente por defecto, otras opciones son:
%\RequirePackage{times} %Times New Roman
%\RequirePackage{tgpaella} %Otra fuente que me gusta mucho
\RequirePackage[protrusion=true, expansion=true, nopatch=footnote]{microtype} %mejora la lectura del documento

% Matemáticas
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{array}

% Listas
\RequirePackage{enumitem}

% Tablas
\RequirePackage{tabularx}  % Tablas con control de su anchura
\RequirePackage{makecell}  % Mejor control sobre las celdas de una tabla
\RequirePackage{booktabs}  % Tablas más profesionales, que no parecen libros de 
\RequirePackage{multirow}  % Tablas con celdas que ocupan más de una fila
\RequirePackage{multicol}  % Tablas con celdas que ocupan más de una columna

% Colores
\RequirePackage[table]{xcolor}

% Gráficos y figuras
\RequirePackage{graphicx}
\RequirePackage[small, hang, bf]{caption} % Poner pie a los elementos, con configuración
\RequirePackage{subcaption} % Útil para varias imágenes
\RequirePackage{tikz} %Rey de los paquetes de dibujo gráfico

% Cambiando el idioma al español
\RequirePackage[spanish,es-tabla]{babel}

% Geometría de la página
\RequirePackage[a4paper, top=2.5cm, bottom=2.5cm, right=2.5cm, left=2.5cm]{geometry}

% Encabezados y pies de página (no utilizado al máximo)
\RequirePackage{fancyhdr}

% Hipervínculos (debe cargarse el último siempre)
\RequirePackage{hyperref}


% 3. Configuración y comandos nuevos

% Espaciado y sangría en los párrafos
\setlength{\parskip}{7pt} %Espaciado
\setlength{\parindent}{0pt} %Sangría

% Configuración del encabezado y el pie de página
\setlength{\headheight}{14.5pt}
\pagestyle{fancy}   % Que aparezcan los elementos que se añaden a continuación
\fancyhf{}          % Limpiar todos los campos de header/footer
\fancyhead[R]{}     % encabezado a la derecha vacío
\fancyfoot[R]{\thepage} % Número de página a la derecha %[C] para ponerlo centrado
\renewcommand{\headrulewidth}{0pt} % Quitar la línea del encabezado


% Estilo distinto para el título (gusto personal)
\renewcommand{\maketitle}{
  \begin{center}
    {\LARGE\bfseries \@title\par}
    \vspace{0.5cm}
    {\large \@author\par}
    \vspace{5mm}
  \end{center}
}

% Abreviatura de `Figura' a `Fig`'
\addto\captionsspanish{\renewcommand{\figurename}{Fig}}

% Comandos útiles
\newcommand{\htref}[2]{\href{#1}{\texttt{#2}}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}

% --------------- TODO Command Configuration ---------------

\newcounter{mytodocounter}

% Command to add a ToDo item
\newcommand{\todo}[1]{%
    \stepcounter{mytodocounter}%
    \ifnum\value{mytodocounter}=1 % Only do this for the first todo item
        \@bsphack % Prevents unwanted spaces
        \protected@write\@auxout{}{%
            \string\gdef\string\todosfound{true}% Define \todosfound globally in aux
        }\@esphack 
    \fi
    % Print the item in red
    \textcolor{red}{\textbf{ToDo~\themytodocounter:} #1}%
    % Add to the custom 'tdo' list
    \addcontentsline{tdo}{todoitem}{\protect\numberline{\themytodocounter}#1}%
}

% Command to print the list (only if todos exist)
\newcommand{\listoftodos}{%
    \@ifundefined{todosfound}{}{%
        \section*{Lista de cosas pendientes}% 
        \addcontentsline{toc}{section}{Lista de cosas pendientes}%
        \@starttoc{tdo}%
    }%
}

\newcommand*\l@todoitem[2]{%
    \setlength{\parskip}{7pt}
    \par
    \setlength{\@tempdima}{1.5em}% 
    \noindent
    {#1}% 
    \nobreak
    \dotfill \ p.~#2%
    \par
}

% --------------- End of TODO Command Configuration ---------------

% Configuración de TikZ
\usetikzlibrary{shapes, shapes.geometric, arrows.meta, shadows, positioning, calc, chains, scopes}

% Configuración de los hipervínculos
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=blue,
    citecolor=blue,
}

\endinput