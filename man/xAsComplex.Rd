% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xAsComplex}
\alias{xAsComplex}
\alias{xAsComplex_}
\title{xAsComplex}
\usage{
xAsComplex(ims)

xAsComplex_(...)
}
\arguments{
\item{ims}{a collection of complex values. A list, pairlist or vector
   of length-one complex vectors to convert to a complex vector.}

\item{...}{see above.}
}
\value{
An complex vector.
}
\description{
Convert a collection of complex values to a complex vector.
}
\details{
\bold{xAsComplex} converts a list, pairlist or vector of
   length-one complex values to a complex vector.
}
\section{Type Signature}{

    |complex| -> &lt;complex>
}

\section{Corner Cases}{

    xAsComplex will throw an error if its input is
    not a collection of complex numbers. All length-zero collections
    can be converted to complex.
}
\examples{

# 1. Convert a list of complex values to a complex vector.

xAsComplex(list(1 + 1i, 2 - 3i))

# c(1 + 1i, 2 - 3i)
}
\seealso{
Other container_conversion_functions: \code{\link{xAsCharacter}},
  \code{\link{xAsCharacter_}}; \code{\link{xAsDouble}},
  \code{\link{xAsDouble_}}; \code{\link{xAsInteger}},
  \code{\link{xAsInteger_}}; \code{\link{xAsLogical}},
  \code{\link{xAsLogical_}}; \code{\link{xAsRaw}},
  \code{\link{xAsRaw_}}
}

