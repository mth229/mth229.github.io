# Questions to be handed in for project 5 on limits

To get started, we load the `Plots` package so that we can make plots.

```
using Plots
gadfly()
```

----

### Quick background

Read about this material here: [Investigating limits with Julia](http://mth229.github.io/limits.html).

For the impatient, the expression

$$~
\lim_{x \rightarrow c} f(x) = L
~$$

says that the limit as $x$ goes to $c$ of $f$ is $L$. If $f(x)$ is
*continuous* at $x=c$, the $L=f(c)$. This is almost always the case
for a randomly chosen $c$ - but almost never the case for a textbook
choice of $c$. There invariably -- though not always -- we will have
`f(c) = NaN` indicating the function is indeterminate at `c`. For such
cases we need to do more work to identify if any such $L$ exists and
when it does, what its value is.


We can investigate limits three ways: analytically, with a table of
numbers, or graphically. Here we focus on two ways: graphically or
numerically.



Investigating a limit numerically requires us to operationalize the
idea of $x$ getting close to $c$ and $f(x)$ getting close to $L$. The
first is easy: just create numbers getting close to 0:

```
xs = [(1/10)^i for i in 1:10]
```

Then we can investigate limits by looking the corresponding `f(x)`
values. For example, the limit of $\sin(x)/x$ near $0$ is investigated
with:

```
f(x) = sin(x)/x
ys = [f(x) for x in xs]		# y values. Alternatively ys = map(f, xs)
[xs ys]				# arrange in a table
```

From this we see a _right_ limit at 0 appears to be $1$. (Look at what happens to the second column.)


Limits when $c\neq 0$ are similar, but require points getting close to $c$. For example, 

$$~
\lim_{x \rightarrow \pi/2} \frac{1 - \sin(x)}{(\pi/2 - x)^2}
~$$ 

has a limit of $1/2$. We can investigate with:

```
hs = [(1/10)^i for i in 1:10]
c = pi/2
xs = c + hs
f(x) = (1 - sin(x))/(pi/2 - x)^2
ys = map(f, xs)     # alternative to [f(x) for x in xs]
[xs ys]
```

Wait, is the limit $1/2$ or $0$? At first $1/2$ seems like the answer, but the last numbers are $0$.


Here we see a limitation of tables --
when numbers get too small, that fact that they are represented in floating point becomes important. In this case, for numbers too close to $pi/2$ the value on the computer for `sin(x)` is just 1 and not a number near 1. Hence the denominator becomes $0$, and so then the expression. (Near $1$, the floating point values are about $10^{-16}$ apart, so when two numbers are within $10^{-16}$ of each other, they can be rounded to the same number.)
So watch out when seeing what the values of $f(x)$ get
close to. Here it is clear that the limit is heading towards $0.5$
until we get too close.

For convenience, this function can make the above computations easier to do:

```
function lim(f::Function, c::Real; n::Int=6, dir="+")
	 hs = [(1/10)^i for i in 1:n] # close to 0
	 if dir == "+"
	   xs = c + hs 
	 else
	   xs = c - hs
	 end
	 ys = map(f, xs)
	 [xs ys]
end
```

It use follows the common `action(function, arguments...)` pattern:

```
f(x) = (1 - sin(x))/(pi/2 - x)^2
lim(f, pi/2)
```

#### Graphical approach

The graphical approach is to plot the expression near $c$ and look visually what $f(x)$ goes to as $x$ gets close to $c$.

A graphical approach doesn't give as many significant digits, but
won't have this floating point error. Here is a graph to investigate
the same problem. We simply graph near $c$ and look:


```
plot(f, c - pi/6, c + pi/6)
```

From the graph, we see clearly that as $x$ is close to $\pi/2$, $f(x)$
is close to $1/2$. (The fact that `f(pi/2) = NaN` will either not come up, as `pi/2` is not among the points sampled or the `NaN` values will not be plotted.)


## Questions: Graphical approach

* Plot the function to estimate the limit. What is the value?

$$~
\lim_{\theta \rightarrow 0} \frac{\sin(5\theta)}{\sin(2\theta)}.
~$$

```
```

```julia
using SymPy
f(t) = sin(5t)/sin(2t)
val = limit(f, 0) |> float
numericq(val, 1e-1, "limit of sin(5t)/sin(2t)")
```


* Plot a function to estimate the limit. What is the value?

$$~
\lim_{x \rightarrow 0} \frac{2^x - \cos(x)}{x}.
~$$

```
```

```julia
val = float(limit(x -> (2^x - cos(x))/x, 0))
numericq(val, 1e-1, "limit of \\( (2^x  - \cos(x))/x \\)")
```

* Plot the function to estimate the limit. What is the value?

$$~
\lim_{\theta \rightarrow 0} \frac{\sin^2(4\theta)}{\cos(\theta) - 1}.
~$$

```
```

```julia
f(x) = sin(4x)^2 / (cos(x) - 1)
val = float(limit(f, 0))
numericq(val, 1e-1, "limit of \\( sin(4x)^2 / (cos(x) - 1) \\)")
```

## Questions: Tables


* This expression is indeterminate at $0$ of the type $0/0$:

$$~
\frac{1-\cos(x)}{x}.
~$$

What value does `julia` return if you try to evaluate it a 0?

```
```

```julia
shortq("What does julia return for (1-cos(x))/x at 0?", "NaN")
```

* This expression is indeterminate at $0$ of the type $0 \cdot \infty$:

$$~
x\log(x).
~$$

```
```

```julia
shortq("What does julia return for x*log(x) at 0?", "NaN")
```

* This expression is indeterminate at $0$ of the type $0^0$:

$$~
x^{1/\log(x)}.
~$$

What value does `julia` return?

```
```

```julia
shortq("What does julia return for cos(x)/(pi/2-x) at 0?", "1.0")
```




* This expression is indeterminate at at $\pi/2$ of the type $0/0$. 

$$~
\frac{cos(x)}{\pi/2 - x}
~$$

What value does `julia` return?

```
```

```julia
shortq("What does julia return for cos(x)/(pi/2-x) at 0?", "Inf")
```





*  Find the limit using a table. Show your commands. 

$$~
\lim_{x \rightarrow 0+} \frac{\cos(x) - 1}{x}.
~$$

```
```

```julia
longq("Commands for a table to investigate limit of (cos(x) -1)/x")
```

What is the estimated value? 

```
```

```julia
f(x) = (cos(x) - 1)/x
val = float(limit(f, 0))
numericq(val, 1e-2, "estimate limit")
```

*  Find the limit using a table. What is the estimated value?

$$~
\lim_{x \rightarrow 0+} \frac{\sin(5x)}{x}.
~$$

```
```

```julia
f(x) = sin(5x)/x
val = float(limit(f, 0))
numericq(val, 1e-2, "estimate limit")
```


* Find the limit using a table. What are your commands? What is the estimated value? (You need
   values getting close to $3$ not $0$.)

$$~
\lim_{x \rightarrow 3} \frac{x^3 - 2x^2 -9}{x^2 - 2x -3}.
~$$

The commands are:

```
```

```julia
longq("Command to find limit at 3 of \\( \\frac{x^3 - 2x^2 -9}{x^2 - 2x -3} \\)")
```

The value is

```
```

```julia
f(x) = (x^3 - 2x^2 - 9) / (x^2 - 2x - 3)
val = limit(f, 3)
numericq(val, 1e-2, "limit of \\( \\frac{x^3 - 2x^2 -9}{x^2 - 2x -3} \\)")
```


* Find this limit using a table. What is the estimated value?

$$~
\lim_{x \rightarrow 0} \frac{\sin^{-1}(4x)}{\sin^{-1}(5x)}
~$$

```
```


```julia
f(x) = asin(4x)/asin(5x)
val = f(1e-6)
numericq(val, 1e-2, "limit at 0 of \\( asin(4x)/asin(5x) \\)")
```



* Find the _left_ limit of `f(x) = cos(pi/2*(x - floor(x)))` as $x$
   goes to $2$. 

```
```

```julia
val = 0
numericq(val, 1e-3, "limit of f(x) = cos(pi/2*(x - floor(x)))")
```


* Find the limit using a table. What is the estimated value? Recall,
   `atan` and `asin` are the names for the appropriate inverse
   functions.

$$~
\lim_{x \rightarrow 0+} \frac{\tan^{-1}(x) - 1}{\sin^{-1}(x) - 1}.
~$$

```
```

```julia
f(x) = (atan(x) - 1)/(asin(x) - 1)
val = float(limit(f, 0, dir="+"))
numericq(val, 1e-2, "limit of   (atan(x) - 1)/(asin(x) - 1)")
```

## Symbolic limits

The add-on package `SymPy` can compute the limit of a simple algebraic
function of a single variable quite well. The package is loaded with:

```
using SymPy
```

The `limit` function is called just as our `lim` function is above. For example:

```
f(x) = sin(x)/x
limit(f, 0)
```

Alternatively, you can use a symbolic expression, not a function, but then you need to specify which variable, as in `limit(sin(x)/x, x, 0)`.


* Find this limit using `SymPy` (use a decimal value for your answer, not a fraction):

$$~
\lim_{x \rightarrow 3} \frac{1/x - 1/3}{x^2 - 9}.
~$$

```
```

```julia
f(x) = (1/x - 1/3) / (x^2 - 9)
val = float(limit(f, 3))
numericq(val, 1e-2, "limit at 3 of \\( (1/x - 1/3) / (x^2 - 9) \\)")
```


* Find this limit using `SymPy`:

$$~
\lim_{x \rightarrow 0} \frac{\sin(x^2)}{x\tan(x)}.
~$$

```
```


```julia
f(x) = sin(x^2)/(x*tan(x))
val = float(limit(f, 0))
numericq(val, 1e-2, "limit at 0 of \\( sin(x^2)/(x*tan(x)) \\)")
```

*  Find the limit using `SymPy`. What is the estimated value?

$$~
\lim_{x \rightarrow 0+} \frac{x - \sin(|x|)}{x^3}.
~$$

```
```


```julia
f(x) = (x - sin(abs(x)))/x^3
val = float(limit(f, 0))
numericq(val, 1e-2, "limit of \\( (x - sin(abs(x)))/x^3 \\)")
```

## Other questions

* Let `f(x) = sin(sin(x)^2) / x^k`. Consider $k=1$, $2$, and $3$. For
  which of values of $k$ does the limit at $0$ **not** exist? (Repeat
  the problem for the 3 different values.)

```
```

```julia
choices = ["k=1,2,3", "k=2,3", "k=3","it exists for all k"]
ans = 3
radioq(choices, ans, "which k does the limit not exist")
```

* Let `l(x) = (a^x - 1)/x` and _define_ $L(a) = \lim_{x\rightarrow 0} l(x,a)$.

Show that $L(3 \cdot 4) = L(3) + L(4)$ by computing all three limits
numerically. (In general, you can show algebraically that $L(a\cdot b)
= L(a) + L(b)$ like a logarithm. Show your work.

```
```

```julia
longq("Show that \\( L(3 \cdot 4) = L(3) + L(4) \\) by computing all three limits numerically")
```
