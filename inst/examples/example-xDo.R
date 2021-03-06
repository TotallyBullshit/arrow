
#1. print the files in your current directory.

xDo(print, list.files('.'))

#    or

x_(list.files('.')) $ xDo(print)

#    or even

xDo(print %of% list.files, '.')

#2. plot a trig function.

plot(
    0, 0,
    xlim = c(0, 10),
    ylim = c(-10, 10),
    type = 'n')

xDo(
    x := {
        y <- tan( sin( x ) / cos( x )^2 )
        points(x, y)

    },
    (1:1000) / 100
)

#3. HR Functional Programming
#   Print "Hello World" n times

# xDo is Arrow's construct for mapping over a collection and discarding the result, for use
# with side-effectful functions. An anonymous function or print composed with a constant function can
# be used to print the actual message.

n <- 5

xDo(print %of% xK('hello'), 1:n)
xDo(num := print('hello'),  1:n)

