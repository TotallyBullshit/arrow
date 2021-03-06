% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xCapture}
\alias{xCapture}
\alias{xK}
\title{xCapture}
\usage{
xCapture(val)

xK(val)
}
\arguments{
\item{val}{an arbitrary value. The value to close over with a
   closure.}
}
\value{
A variadic function that returns \bold{val}.
}
\description{
Create a function that returns a particular value.
}
\details{
\bold{xCapture} is the contant combinator - a function
    that takes an arguments and returns a function that
    always returns that value.

    The function returned by \bold{xCapture} has ellipsis arguments,
    and ignores those arguments.
}
\section{Type Signature}{

   any -> (...any -> any)
}
\examples{

# 1. Capture returns a function that always return a particular value.

ten <- xCapture(10)
ten()

# 10
}
\seealso{
Other basic_functions: \code{\link{xFalsity}};
  \code{\link{xIrrelevance}}; \code{\link{xI}},
  \code{\link{xIdentity}}; \code{\link{xTruth}}

Other function_modifying_functions: \code{\link{\%and\%}},
  \code{\link{\%or\%}}, \code{\link{xLift}},
  \code{\link{xLift_}}; \code{\link{\%of\%}},
  \code{\link{\%then\%}}, \code{\link{xCompose}},
  \code{\link{xCompose_}}; \code{\link{xDelay}};
  \code{\link{xFix}}, \code{\link{xFix_}};
  \code{\link{xJuxtapose}}, \code{\link{xJuxtapose_}};
  \code{\link{xNegate}}; \code{\link{xSpread}};
  \code{\link{xThread}}, \code{\link{xThread_}};
  \code{\link{xUnspread}}; \code{\link{xVectorise}},
  \code{\link{xVectorize}}
}

