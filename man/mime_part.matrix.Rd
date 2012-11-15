\name{mime_part.matrix}
\alias{mime_part.matrix}
\title{Create a MIME part from a matrix.}
\usage{
  \method{mime_part}{matrix} (x,
    name = deparse(substitute(x)), ...)
}
\arguments{
  \item{x}{Matrix}

  \item{name}{Basename of file attachment that is
  generated.}

  \item{...}{Ignored.}
}
\value{
  An S3 \code{mime_part} object
}
\description{
  Create a MIME part from a matrix.
}

