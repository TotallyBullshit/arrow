Arrow v0.1
-----------------------------------

**Arrow** is a functional programming framework that adds partial application, 
jQuery-like method calling, function composition, 
and over one-hundred higher-order functions and utility functions to the R language.
Arrow helps make R an elegant functional language with an emphasis on the composition
of simple functions to create complex but expressive programs.

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
All **Arrow** functions are prefixed with the letter "x". This is to avoid naming conflicts and to 
help the user find the function they are looking for.

## 2 Features

### 2.1 Generic & Idiomatic

### 2.2 Functional

Arrow includes the standard map, select, fold, zip, flip, dropwhile, and position higher-order
functions (among others) as well as function composition and partial application.

```javascript

unlapply <- unlist %of% lapply
function (X, FUN, ...) 
{
    fn1(fn2(X, FUN, ...))
}

```

Functions that return functions - like ```xCompose()``` - preserve parameter names 
and produce human-readable code.

```javascript
isPrime <- function (n) {
    n == 2 || all(n %% 2:(n-1) != 0)
}
getPrimes <- xSelect(isPrime)
getPrimes(1:1000)

[1] 2  3  5  7 11 13 17 19 23 29 31 ...
```

FP allows a declarative style of programming; rather than using 
looping and pushing and pulling values into and out of containers, you focus more on 
the definition of the problem in terms of common patterns like filtering lists, 
or accumulating a value by recursing over a list.

Note that the user is not required to know the Lambda Calculus, or to understand monoids
in the category of endofunctors [1] to use this library; functions are only 
included in **Arrow** if they have a plausable use-case, and 
even then their mathematical underpinnings are masked [2].

### 2.3 Arrow Functions

**Arrow** includes a useful shorthand for function definitions; arrow functions. [4]

```javascript
(a: b : c) := {
    a > b && a > c
}

x := x^2
```

is equivalent to

```javascript

function (a, b, c) {
    a > b && a > c
}

function (x) x^2
```
The shorter form is especicially useful given that **Arrow** is a function heavy library. 
Curly braces are almost always syntactically optional, but I include them for readability.

### 2.4 Cascading Style

In this style data is fed into the type constructor [1] ```x_```, and methods are called off that object. 

```javascript

x_(1:100)$
xSetProd(1:100)$
xMap(
    xAsUnary( 
        (a : b) := {
            a^b + b^a
        }
    )
)$
xSelect(
    a := {
        a %% 2
    }
)$
x()
```

### 2.5 Partial Application

Specialising general functions like select and fold is simple in **Arrow**.

```javascript
# be gone, na values and nan!

strip_na <- xPartial(xReject, list(pred = xIsNa))
strip_nan <- xPartial(xReject, list(pred = is.nan))

# compose both functions, and call.
(strip_nan %of% strip_na)(
    list(1, 2, NaN, NA, 3, 4))

```
Is this case, the general function ``xReject`` was specialised into two functions that remove Na and NaN values
respectively.

```javascript
function (coll) 
{
    fn(.Primitive("is.na"), coll)
}
<environment: 0x5e8eb38>
```


### 2.6 Combinators

Combinators are powerful functions that combine functions in interesting ways. **Arrow** implements many 
combinators, giving them a formal name (eg. ```xPhi```), a descriptive name (eg. ```xBiCompose```) and
most importantly, an avian name (```xPhoenix```)[3].

```javascript
add_fn <- xPartial(xBiCompose, list(fn1 = "+"))

# equivalant to the function xPlusLift()
add_fn(
    x := 2*x + x,
    x := 3*x + x
)(1:100)
```


```javascript
x_(1:100)$
xSelect( xOrLift(
    # find numbers with at one of these two uncommon properties
    n := {
        n^2 == 2^n
    },
    n := {
        n*2 == n*n
    }
))
[1] 2 4

```

Of course, this is a less likely use of combinators than defining
your own control structures for functions. Arrow particularily emphasises 
arithmetic on functions, with several functions with short names added for that purpose.

#### 2.7 Existential Quantifiers

**Arrow** includes the powerful quantifiers `xForall` and `xExists`, as well
as other quantifier functions.

For example, to verify that addition is commutative, you could write:

```javascript
xForall(
    (a : b) := {
        a + b == b + a
    }
    1:100,
    1:100
)
```

In the above case, the set product of 1...100 x 1...100 is checked to see 
if each combination (a, b) holds true.

```javascript
x_(1:1000)$
xExists( n := {
    n^2 == 5*n
} )
```
### 2.8 Immutable Values

Using immutable values can make reasoning about code easier.
R provides a mechanism for permenantly binding a value to a name, but it it somewhat clumsy. **Arrow** wraps these 
native functions.

```javascript

xVal(a, 'try change me!')
a <- 'will fail'

Error: cannot change value of locked binding for 'a'
```

It is also possible to 'lock' and 'unlock' variabes after creation:

```
b <- "try change me!"
xAsVal(b)
```

## 3 Footnotes

[1] I won't use *that* word; every mention of *that* word cuts the usership of an FP library by half.

[2] This is a good thing: the worst example of overally mathematical code I saw while researching FP libraries was 
a function called a zygohistomorphic propremorpism. Useful concept I'm sure, but one with a horrible name.

[3] Raymond Smullyan's incredible *To Mock a Mockingbird* aliases combinators like K with a 
birdname (kestrel). These names are used fairly often, so I included them.

[4] Not to be confused with Arrows, the more general cousin of the Category-that-shall-not be named.

## 4 Licensing

**Arrow** is released under the terms of the GNU General Public License version 3. 

<img src="gpl3.png" height = "180"> </img>
