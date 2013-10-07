\name{xTakeWhile}
\alias{xTakeWhile}
\title{xTakeWhile}
\usage{
  xTakeWhile(pred, coll)
}
\arguments{
  \item{pred}{a predicate.}

  \item{coll}{a collection}
}
\value{
  a list.
}
\description{
  Take every element in a collection from the start until a
  predicate returns false.
}
\section{Corner Cases}{
  returns the empty list if \code{coll} is length-zero or
  the first element of \code{coll} returns false for the
  predicate. Na values are considered false.
}

\section{Glossary}{
  function: a closure or primitive function.  A symbol or
  string refering to such a function may also be used.

  predicate: A function that returns a logical value
  (unary, unless stated otherwise).  A symbol or string
  refering to such a function may also be used.

  collection: A list, pairlist or vector of any type.

  arity: The number of arguments a function can accept.
  Variadic functions have an arity of +Infinity,

  number: a double, integer or complex number, unless
  stated otherwise.
}
\examples{
inst/examples/blank.R
}
