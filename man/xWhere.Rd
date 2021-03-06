% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xWhere}
\alias{xWhere}
\alias{xWhere_}
\title{xWhere}
\usage{
xWhere(bools)

xWhere_(...)
}
\arguments{
\item{bools}{a collection of boolean values. The collection to
   find the true elements in.}

\item{...}{see above.}
}
\value{
An integer vector.
}
\description{
Return the indices for which a boolean vector is true.
}
\section{Type Signature}{

    |logical| -> &lt;integer>
}

\section{Corner Cases}{

   Returns the empty list if \bold{coll} is length-zero,
   or no match is found. If the predicate returns a
   non-logical value an error is thrown. If an na value
   is returned by the predicate it is treated as a false value.
}
\examples{

# 1. Select the odd letters

x_(letters) $ x_Slice(xWhere(1:26 \%\% 2 == 0))

# list("b", "d", "f", "h", "j", "l", "n", "p", "r", "t", "v", "x", "z")
}

