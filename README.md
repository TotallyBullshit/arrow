Arrow v0.1
-----------------------------------

**Arrow** is a functional programming framework that adds partial application, 
jQuery-like method chaining, function composition, 
and over one-hundred higher-order- and utility-functions to the R language.
Arrow helps make R an elegant functional language with powerful operations on collections.

## 1 Installation

As of late September 2013 **Arrow** is only available on Github. To install the development version, copy the
following into an R console.

```javascript
install.packages('devtools')
require(devtools)

install_github("arrow", "rgrannell1", "develop")
require(devtools)

# check that arrow installed.
xVersion()
```
**Arrow** functions are usually prefixed with the letter 'x'.

## 2 Examples

### 2.1 Arrow Functions:

**Arrow** included a shorthand function constructor like that
 included in Scala or ECMAscript-6.

```javascript
x := x^2

function (x) x^2

(a : b) := {
    a + b
}
function (a, b) {
    a + b
}
```
### 2.2 Function Composition:

**Arrow** includes powerful function-composition functions.
These functions produce human-readable code.

```javascript
unlapply <- unlist %of% lapply

function (X, FUN, ...)
{
    fn1(fn2(X, FUN, ...))
}
```
### 2.3 Collection Manipulation

Most functions in **Arrow** are for manipulating collections of values. 

```javascript
isPrime <- function (n) {
    n == 2 || all(n %% 2:(n-1) != 0)
}
getPrimes <- xSelect(isPrime)
getPrimes(1:1000)

[1] 2  3  5  7 11 13 17 19 23 29 31 ...
```
### 2.4 Method Chaining:

**Arrow** includes jQuery-style method chaining for stepwise manipulation
of collections.

```javascript
x_( 1:100 )$
xSelect( x := x %% 2 == 0 )$
xReduce("+")$x()
```

Custom methods or anonymous functions can be added to the ```x_()``` object.

```javascript
x_()$xGraft('xMean', mean)

x_(1:100)$xMean$x()
x_(1:199)$xTap(mean)$x()
```

### 2.5 Partial Application

General functions like ```xSelect``` and ```xFold``` can be 
specialised by fixing some of their arguments permenantly. 

```javascript
strip_na <- xPartial( xReject, list(fn = is.na) )
```
### 2.6 Combinators

Combinators combine functions into other functions or control structures. These
can be used to define arithmetic, logical and set operations "on functions".

```javascript
mean <- xJuxtapose(mean, sd)
mean(1:10)

# add two functions together
f <- xPlusLift(
    n := n^2, 
    n := n + n)
```

### 2.7 Existential Quantifiers

Existential quantifiers test whether a predicate is true for any or all
elements in a collection, or the set product of multiple collections.

```javascript
xExists(
    (x: y) := {
        x^( floor(x) / y ) == x^y
    },
    1:100, 1:100
)
```

### 2.7 Immutable Values

**Arrow** wraps native R code for locking variable names to a single value 
permanently, making them easier to use.

```javascript
xVal(n, 10)
n <- 11

Error: cannot change value of locked binding for 'n'
```

## 3 Help

To access the documentation  simply put a question mark in front of a function of interest.

```
?xSelect
```

## 4 Authors

Ryan Grannell.

## 5 Licensing

**Arrow** is released under the terms of the GNU General Public License version 3. 

<img src="gpl3.png" height = "180"> </img>
