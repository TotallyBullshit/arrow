% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xUnspread}
\alias{xUnspread}
\title{xUnspread}
\usage{
xUnspread(fn)
}
\arguments{
\item{fn}{an arbitrary function. The function to be
    converted to a function that takes a single collection.}
}
\value{
A unary function of \bold{coll}, that applies its arguments
    to its underlying function.
}
\description{
Convert any function to a unary function.
}
\details{
\bold{xUnspread} takes a function and returns a function that
    has one argument. The first element of the argument is
    passed to the first parametre of the underlying function,
    the second element to the second parametre, and so on.

    \bold{xUnspread} adapts a multi-parametre function to work
    as a unary function; for example in functions like \bold{xMap}.
}
\section{Type Signature}{

    (...any -> any) -> (any -> any)
}
\examples{

# 1. xUnspread can be used to adapt higher-order
#    functions to make them work with non-unary functions.

xSelect_(
    xUnspread(
        (a : b) := {
            a > 0 && b >= 0
        }
    ),
    list(+1, +1),
    list(+0, +1),
    list(-1, 1),
    list(-1, -1)
)

# list(+1, +1)
}
\seealso{
Other function_application_functions: \code{\link{xApply}},
  \code{\link{xApply_}}; \code{\link{xDeepMap}},
  \code{\link{xDeepMap_}}; \code{\link{xFlatMap}},
  \code{\link{xFlatMap_}}; \code{\link{xMapply}},
  \code{\link{xMapply_}}; \code{\link{xMap}},
  \code{\link{xMap_}}; \code{\link{xSpread}};
  \code{\link{xThread}}, \code{\link{xThread_}};
  \code{\link{xVectorise}}, \code{\link{xVectorize}}

Other function_modifying_functions: \code{\link{\%and\%}},
  \code{\link{\%or\%}}, \code{\link{xLift}},
  \code{\link{xLift_}}; \code{\link{\%of\%}},
  \code{\link{\%then\%}}, \code{\link{xCompose}},
  \code{\link{xCompose_}}; \code{\link{xCapture}},
  \code{\link{xK}}; \code{\link{xDelay}};
  \code{\link{xFix}}, \code{\link{xFix_}};
  \code{\link{xJuxtapose}}, \code{\link{xJuxtapose_}};
  \code{\link{xNegate}}; \code{\link{xSpread}};
  \code{\link{xThread}}, \code{\link{xThread_}};
  \code{\link{xVectorise}}, \code{\link{xVectorize}}

Other parametre_functions: \code{\link{xArityOf}};
  \code{\link{xFix}}, \code{\link{xFix_}};
  \code{\link{xFormalsOf}}; \code{\link{xIsVariadic}};
  \code{\link{xParamsOf}}; \code{\link{xSpread}}
}

