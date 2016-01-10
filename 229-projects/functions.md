# Questions to be handed in for project 2: Functions in Julia



Read about this [here](http://mth229.github.io/functions.html).

For the impatient, it is easy with `Julia` to create basic mathematical
functions, as the notation is identical:

```
f(x) = x^2 - 2
f(2)
```

As with typical mathematical notation, the function is "called" by
passing a value to it with parentheses.

That covers most of the uses within this project.


----

But there is more to functions...

#### Julia functions can have more than one variable

```
rectarea(b, h) = b * h		# area of rectangle
```

The `log` function is an example, where `log(b,x)` will find the log base $b$ of $x$.

#### Julia functions with different signatures, can have the same name!

```
rectarea(b) = rectarea(b,b)	# area of square using area of rectangle
```

Which function is used depends on the arguments that are passed when calling the function. Hence, `log(x)` will find log base $e$ of $x$ whereas `log(10,x)` can be used to find log base 10.


#### Multiline functions are defined with the function keyword

```
function multiline_function(x)
	 top = x^2 - 2x
	 bottom = x^4 - 4x
	 top/bottom		# last line is return value
end				# don't forget the end
```

#### Functions can have keyword arguments (like parameters). These have default values:

```
mxplusb(x; m=0, b=1) = m*x + b
mxplusb(10, m=3, b=4)		# arguments are named
```

The semicolon separates the two types of arugments.


#### Functions can be used as arguments to other functions:

```
using Plots	    		# for plotting
gadfly()
plot(sin, 0, 2pi)		# pass function for first argument plot(f,a,b)
```

Using functions this way will form a *very* common pattern.




#### Functions can be anonymous.

These are defined via the pattern: "`args -> body`". Look for the arrow `->`:

```
plot(x -> sin(x)*cos(2x), 0, 2pi)
```

----


### Questions


* Write a function that describes a line with slope $1$ going through
  the point $(2,3)$. What is the value of $f(10)$?

The function is:

```
```

```
shortq("f(x) = 3+1*(x-2)", "function m=1, p = (2,3)", "f(x) = 3+1*(x-2)")
```


The value of $f(10)$ is:

```
```

```
f(x) = 3 + 1*(x-2)
val = f(10)
numericq(val, 1e-4, "f(10)")
```

* Write a function to convert Celsius to Fahrenheit $F=9/5 C +
  32$. Use it to find the Fahrenheit value when $C=56.7$ and when
  $C=-89.2$. (The record high and low temperatures.)

The function is

```
```

```
shortq("f(x) = 9/5*x+32", "F=9/5 C + 32", "f(x) =  9/5*x+32")
```

The value at $C=56.7$ is

```
```

```
f(C) = 9/5 * C + 32
val = f(56.7)
numericq(val, 1e-4, "Fahrenheit at 56.7C")
```

The value at $C=-89.2$ is:


```
```

```
val = f(-89.2)
numericq(val, 1e-4, "Fahrenheit at -89.2C")
```

* Write a function that computes

$$~
f(x) = 8x^2 - 3x  - 7 - \frac{1}{x}
~$$

Use it to find the values of $f(1)$, and $f(3)$.

The function is defined by:

```
```

```
shortq("f(x) = 8*x^2 - 3x  - 7 - 1/x", "\\( 8x^2 - 3x  - 7 - \\frac{1}{x} \\)")
```

The value $f(1)$ is

```
```

```
f(x) = 8*x^2 - 3x - 7 - 1/x
val = f(1)
numericq(val, 1e-4)
```

The value $f(3)$ is


```
```

```
val = f(3)
numericq(val, 1e-4)
```



* Write a function that computes:

$$~
f(t) = A\sin(Bt - C) + D
~$$

where $A=3.1$, $B=2\pi/365$, $C=1.35$, and $D=12.12$.

This function models the amount of daylight in Boston when $t$ records
the day of the year. How much daylight is there for $t=1$, $t=365/2$,
$t = 35$?


The function is

```
```

```
shortq("f(t) = 3.1 * sin(2pi/365*t - 1.35) + 12.12", "Asin(Bt - C) + D",  "\\( f(t) = 3.1\\sin(2pi/365*t - 1.35) + 12.12 \\)")
```

The value at $t=1$ is

```
```

```
f(t) =  3.1 * sin(2pi/365*t - 1.35) + 12.12
t = 1
val = f(t)
numericq(val, 1e-4, "value at 1 (hours of daylight 1/1")
```

The value at $t=365/2$ is:


```
```

```
t = 365/2
val = f(t)
numericq(val, 1e-4, "value at 365/2 (hours of daylight at summer")
```


The value at $t=35$ is:


```
```

```
t = 365
val = f(t)
numericq(val, 1e-4, "value at 35")
```


* Person A starts at the origin and moves west at 60 MPH. Person B
  starts 200 miles north of the origin and moves south at 70
  MPH. Write a function that computes the distance between the two
  people as a function of $t$ in minutes.

(The $(x,y)$ position of person A is $(60\cdot t/60), 0)$ and the
$(x,y)$ position of person B is $(0, 200 - 70 \cdot t/60)$. Use the
distance formula to write a function.)


The distance at $t=0$ is:

```
```

```
f(t) = sqrt( (60t/60 - 0)^2 + (0 - (200 - 70t/60))^2)
t = 0
val = f(t)
numericq(val, 1e-4, "value at t=$t")
```


The distance at $t=30$ is:

```
```

```
t = 30
val = f(t)
numericq(val, 1e-4, "value at t=$t")
```


The distance at $t=120$ is:

```
```

```
t = 120
val = f(t)
numericq(val, 1e-4, "value at t=$t")
```



## Cases 

Some functions are defined in terms of cases. For example, a cell phone plan might depend on the data used through:

> The amount is 40 dollars for the first 1 Gb  of data, and 10 dollars more for each *additional* Gb of data.

This function has two cases to consider: one if the data is less than 1 Gb and the other when it is more.

How to write this in `julia`?


The ternary operator `predicate ? expression1 : expression2` has three
pieces: a predicate question, such as `x < 10` and two expressions,
the first is evaluated if the predicate is `true` and the second if
the predicate is `false`. They are useful to write functions that are
defined by cases. (They are a light-weight form of the traditional
`if-then-else` construct.)

The example above, could then be done with:

```
f(d) = d <= 1.0 ? 40.00 : 40.00 + 10.00 * (d - 1.0)
```


* Write a function to express the following: If a person buys up to
  100 units the cost per unit is 5 dollars, for every additional unit
  beyond 100 the cost is 4 dollars. The function should return the
  total cost to buy $x$ units. (Use the ternary operator with `x <=
  100` as the condition.

```
```

```
longq("Total cost for x units", "\\verb#f(x) = x <= 100 ? 5.0 * x : (5.0*100) + 4*(x-100) #")
```

* Use the ternary operator to write a function $f(x)$ which takes a
  value of $x$ when $x$ is less than 10 and is otherwise a constant
  value of 10.

```
```

```
shortq("f(x) = x < 10 ? x : 10", "Function which is x for x < 10 and 10 otherwise")
```

* Define a function $Sin(x) = \sin(x)$ if $-\pi/2 < x < \pi/2$ and
  `NaN` otherwise.


```
```

```
shortq("Sin(x) = -pi/2 < x < pi/2 ? sin(x) : NaN", "restrict sin(x) to -pi/2 to pi/2")
```

* Define a function `signal(x)` where when $x \leq 0$ the function is $0$, when $x > 1$ the function is $1$, and otherwise is $\sin(\pi/2 \cdot x)^2$.

Compare the difference between `signal(0.999)` and `signal(1.001)`.


You can used two ternary operations, or the easier to read `if-elseif-end` pattern which looks something like:

```verbatim
if x <= 0
  ...
elseif x < 1
  ...
else
  ...
end
```



The value at $0.999$ is:

```
```

```
f(x) = (x <= 0) ? 0.0 : ((x <= 1) ? sin(pi/2*x)^2 : 1.0)
x = 0.9999
val = f(x)
numericq(val, 1e-4, "f($x)")
```


The value at $1.0001$ is:

```
```

```
x = 1.0001
val = f(x)
numericq(val, 1e-4, "f($x)")
```

## Composition

Composition of functions is a useful means to break complicated
problems into easier to solve ones. The math notation is typically
$f(g(x))$ and in `julia` this is no different. When thinking about the
operation of composition, the notation $f \circ g$ is used. For that,
there isn't any built-in `julia` notation.

* For the function $h(x) = ((x+1)/(x-1))^{2/3}$ write this as the
  composition of two functions $f(x)$ and $g(x)$. Use these to evaluate
  $h(3)$. Show your work and the answer.

```
```

```
longq("write h(x) = ((x+1)/(x-1))^(2/3) as a composition, f(g(x)) and compute it at 10")
```


* Write the function $h(x) = (\cos(12x))^3$ as the
  composition of two functions $f(x)$ and $g(x)$ and use these to evaluate
  $h(2)$. Show your work and the answer.

```
```

```
longq("write h(x) =  (\cos(12x))^3 as a composition, f(g(x)) and compute it at 2")
```

## Parameters


* The formula for a [catenary](http://en.wikipedia.org/wiki/Catenary) has a parameter $a$:

$$~
y = a \cosh(x/a)
~$$

($\cosh(x)$ is the hyperbolic cosine, defined by $(1/2) \cdot (e^x + e^{-x})$ and implemented by `cosh`.) 

Write a function, `c(x;a=1)`, with `a` as a parameter defaulting to
$1$. Compute `c(1)`, `c(1,a=2)`, and `c(1, a=1/2)`.

The function is:

```
```

```
shortq("c(x; a=1) = a * cosh(x/a)", "\\( y = a \\cosh(x/a) \\)", "c(x; a=1) = a * cosh(x/a)")
```

The value of `c(1)`:

```
```

```
c(x; a=1) =  a * cosh(x/a)
ex = "c(1)"
val = eval(parse(ex))
numericq(val, 1e-4, "$ex")
```


The value of `c(1, a=2)`:

```
```

```
ex = "c(1, a=2)"
val = eval(parse(ex))
numericq(val, 1e-4, "$ex")
```


The value of `c(1, a=1/2)`:

```
```


```
ex = "c(1, a=1/2)"
val = eval(parse(ex))
numericq(val, 1e-4, "$ex")
```




## Returning a function

Familiar mathematical functions take a real number and return a real
number. However, the concept of a function is more general. With
`julia` it is useful to write functions that take functions as
arguments, and return a derived function as an output. For the return
value an *anonymous function* is typically used. These are specified
as `arg -> rule`, where the arg is a variable, like `x`, and the rule
can depend on the value of `x`.

* Describe what the following function does to the argument $f$, when
  $f$ is a function. (There isn't anything to do but recognize that
  `n` takes a function as input and returns a function as output, this
  question is how is `n(f)` related to `f`.)

```
n(f::Function) = x -> -f(x)
``` 



```
longq("Describe \\verb+n(f::Function) = x -> -f(x)+", "The defines g(x) = -f(x)")
```


* This function takes a function and two points and returns a new function that evaluates the secant line:

```
function secant(f, a, b)
  m = (f(b) - f(a)) / (b - a)
  x -> f(a) + m * (x - a)
end
```

Let $f(x) = \sin(x)$. Let $a=\pi/6$ and $b=\pi/3$. Show that the secant line at $\pi/4$ is less than the function value at $\pi/4$ by computing both:

```
```

The function at $\pi/4$ is:

```
f(x) = sin(x)
numericq(f(pi/4))
```

The secant line's value at $\pi/4$ is:

```
numericq(secant(f, pi/6, pi/3)(pi/4))
```
