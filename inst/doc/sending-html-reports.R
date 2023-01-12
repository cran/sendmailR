## ----echo = FALSE-------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 5, warning = FALSE, message = FALSE)
if (!requireNamespace("rmarkdown", quietly = TRUE) ||
    !requireNamespace("htmltools", quietly = TRUE)) {
  knitr::opts_chunk$set(eval = FALSE, tidy = FALSE)
}

## ----include=FALSE------------------------------------------------------------
test.Rmd <- "---
title: '&#32;'
output: 
  html_document:
    theme: null
    highlight: null
    mathjax: null
---

Hello everyone,\n

here is a calculation.

**2+2 =**
\```{r echo=FALSE}
2+2

\```

All the best
"
writeLines(test.Rmd, con = "my_file.Rmd")

## ----echo=TRUE, results = 'hide'----------------------------------------------
htmlout <- tempfile(fileext = ".html")

rmarkdown::render(
      input = "my_file.Rmd",
      intermediates_dir = ".",
      output_file = htmlout,
    )

## ----echo=FALSE, results='asis'-----------------------------------------------
unlink("my_file.Rmd")
htmltools::includeHTML(htmlout)

## -----------------------------------------------------------------------------
library(sendmailR)
sendmail(from="from@example.org",
         to="to1@example.org",
         subject="File attachment",
         msg=c(
           mime_part("Hello everyone,\n here is the newest report.\n Bye"),
           mime_part(htmlout, name = "report.html")),
         engine = "debug")


## ----message=TRUE-------------------------------------------------------------
sendmail(from="from@example.org",
       to="to1@example.org",
       subject="Inline HTML",
       msg=mime_part_html(htmlout),
       engine = "debug")


