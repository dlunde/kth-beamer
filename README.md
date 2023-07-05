# kth-beamer
A minimalistic LaTeX beamer theme for KTH presentations. Adds a few graphical elements on top of the default beamer theme.

## Usage
See `example.tex`. Note that the title frame needs to be specified as

```
\begin{frame}[plain, t]
  \titlepage
\end{frame}
```

in order to display correctly.

## Contributions
Contributions to the theme are welcome!


## Progress bar
Need to have the `\jobname.toc` file

https://tex.stackexchange.com/questions/66476/generating-toc-file-without-generating-a-toc
```tex
\makeatletter
  \begingroup
    \let\@input\@gobble
    \@starttoc{toc}%
  \endgroup
\makeatother
```
