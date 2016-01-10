# Questions to be handed in for project 4:

Read about this topic here: [Solving for zeros with julia](http://mth229.github.io/zeros.html).

For the impatient, these questions are related to the zeros of a
real-valued function. That is, a value $x$ with $f(x)=0$. We will use
two packages: one for plotting and a new one that brings in some
functionality for finding zeros.

```
using Plots
gadfly()
using Roots
```



Graphically, a zero of the function $f(x)$ occurs where the graph
crosses the $x$-axis. Without much work, a zero can be *estimated* to
a few decimal points. For example, we can zoom in on the zero of $f(x)
= x^5 + x - 1$ by graphing over $[0,1]$:

```
f(x) = x^5 + x - 1
plot(f, 0, 1)
```

We can see the answer is near $0.7$. We could re-plot to get closer,
but if more accurate answers are needed, numeric methods are
preferred.

----

The notes talk about a special case - zeros of a polynomial function. Due to
the special nature of polynomials, there are many facts known about
the zeros. A typical example is the quadratic equation which finds
both answers to any quadratic polynomial. These facts can be exploited
to find roots. The `Roots` package provides the `roots` function to
*numerically* find all the zeros of a polynomial function (real and
complex) and the `fzeros` function to find just the real roots. (The
heavy lifting here is done by the `Polynomials` package.)

```
f(x) = x^5 + x - 1
roots(f) ## all roots
```

```
fzeros(f)  ## real roots only
```


(Notice that in both cases the argument is a function. This is a
recurring pattern in these projects: A function is operated on by some
action which is encapsulated in some function call like `roots`.)

#### Bisection method

For the general case, non-polynomial functions,  the notes mention the bisection method for
zero-finding. This is based on the *intermediate value theorem* which
guarantees a zero for a continuous function $f(x)$ over any interval
$[a,b]$ *when* $f(a)$ and $f(b)$ have *different* signs. Such an
interval is called a **bracket** or bracketing interval.

The algorithm finds a zero by successive division of the
interval. Either the midpoint is a zero, or one of the two sub
intervals must be a bracket. The notes define a `bisection` method and
a stripped down version is given below.  More conveniently the `Roots`
package implements this in its `fzero` function when it is called
through `fzero(f, [a,b])` (or `fzero(f, a, b)`). For example,

```
f(x) = x^2 - 2
fzero(f, [1,2])			# find sqrt(2)
```

As mentioned, for polynomial function the `fzeros` function finds the
real roots. In general, the `fzeros` function will try to locate real
roots for any function but it needs to have an interval in which to
search. For example this call will attempt to find all zeros within
$[-5,5]$ of $f(x)$:

```
f(x) = x^2 - 2
fzeros(f, [-5,5])
```

[This function will have issues with non-simple roots and with roots that are very close together, so should be used with care.]

This summary might help:

`*` the call `roots(f)` finds all roots of a polynomial function, even
complex ones

`*` the call `fzeros(f)` finds all *real* roots of polynomial function

`*` the call `fzero(f, [a,b])` finds a root of a function between a
**bracketing** interval, `[a,b]`, using the bisection method.

`*` the call `fzeros(f, [a,b])` function *attempts* to find all roots
of a function in an interval `[a,b]`. This may miss values; answers
should be checked graphically.


## Questions to answer

### Polynomial functions

* Find a zero of the function $f(x) = 214 - 0.65x$.

```
```

```julia
using Roots
f(x) = 214 - 0.65x
val = fzero(f, 0)
numericq(val, 1e-3, "zero of f(x) = 214 - 0.65x")
```

* The parabola $f(x) = -16x^2 + 200x$ has one zero at $x=0$. Graphically find the other one. What is the value

```
```

```julia
f(x) = -16x^2 + 200x
rts = roots(f)
val = maximum(rts)
numericq(val, 1e-3, "\\(Other root of -16x^2 + 200x\\)")
```

* Use the [quadratic equation](http://en.wikipedia.org/wiki/Quadratic_equation) to find
  the roots of $f(x) = x^2 + x - 1$. Show your work.

```
```

```julia
longq("quadratic equation to solve \\(x^2 + x - 1\\)")
```

* Use the `roots` function to find the zeros of $p(x)=x^3 -4x^2 -7x + 10$. What are they?

```
```

```julia
choices = ["-2.0, 1.0, 5.0", "-0.788376+1.08241im,  -0.788376-1.08241im, 5.57675+0.0im", "-2.33333, 0.0"]
ans = 1
radioq(choices, ans, "zeros of \\(p(x)=x^3 -4x^2 -7x + 10\\)")
```

* Use the `fzeros` function to find the *real* zeros of $p(x) = x^5
-5x^4 -2x^3 + 13x^2 -17x + 10$. (The `roots` function returns all 5
zeros guaranteed by the Fundamental Theorem of Algebra, not all of them are real.)


```
```

```julia
choices = ["-2.000 + 0.0im, 0.500 + 0.866im, 0.500 - 0.866im, 1.0 + 0.0im, 5.0 + 0.0im",
	"-2.0, 1.0, 5.0",
	"0.0, 2.0, 6.0",
	"1.0, 5.0"]
ans = 2
radioq(choices, ans, "zeros of \\( x^5-5x^4 -2x^3 + 13x^2 -17x + 1\\)")
```

* Descarte's [rule of
  signs](http://en.wikipedia.org/wiki/Descartes_rule_of_signs) allows
  one to estimate the number of *positive* real roots of a real-valued
  polynomial simply by counting plus and minus signs. Write your
  polynomial with highest powers first and then count the number of
  changes of sign of the coefficients. The number of positive real
  roots is this number or this number minus $2k$ for some $k$.

  Apply this rule to the polynomial $x^5 - 4x^4 + 5x^3 - 16x^2 -
  3$. What is the maximal possible number of positive real roots? What is
  the exact number?

The maximal possible number of real roots is:

```
```

```julia
numericq(3,0, "possible positive roots")
```

The actual number of positive real roots is:

```
```

```julia
numericq(1,0, "actual number of positive roots")
```



### Other types of functions

* Graph the function $f(x)= x^2 - 2^x$. Try to graphically estimate
  all the zeros. Answers to one decimal point.

```
```

```julia
choices = ["0.0, 2.0", "-1.0, 1.0", "2.0, 4.0", "-1.414, 1.414"]
ans = 3
radioq(choices, ans, "roots of \\( x^2 - 2^x \\)")
```


* Graphically find the point(s) of intersection of the graphs of $f(x) = 2.5-
  2e^{-x}$ and $g(x) = 1 + x^2$.

```
```

```julia
longq("intersections of \\(f(x) = 2.5-2e^{-x}\\) and \\(g(x) = 1 + x^2\\)", "around 0.4 and 0.7")
```

* The notes have a `bisection` method, here is an abbreviated version.

```
function bisection(f, bracket)
  a,b = sort(bracket)
  @assert f(a) * f(b) < 0	# an error if [a,b] is not a bracket
  mid = a + (b - a) / 2

  while a < mid < b
    if f(mid) == 0.0 break end
    f(a) * f(mid) < 0 ? (b = mid) : (a = mid)  
    mid = a + (b - a) / 2
  end
  mid
end
```

The function above **starts** with two values, $a$ and $b$ with the
property that $f(a)$ and $f(b)$ have different signs, hence if $f(x)$
is continuous, it must cross zero between $a$ and $b$. The algorithm
simply bisects this interval by finding `mid`. It then selects either
`[a,mid]` or `[mid,b]` to be the new interval where a zero is
guaranteed. It **stops** if the interval is too small to
subdivide. This is an impossibility mathematically, but is the case with
floating point numbers.

The `bisection` function is used to find a zero, when $[a,b]$ brackets
a zero for $f$. It is called like `bisection(f, [a,b])`, for 
suitable `f`, `a`, and `b`.

Use this function to find a zero of $f(x) = \sin(x)$ on $[3,4]$. Show your commands and
both the zero (`x`) and its value `f(x)`.

```
```

```julia
longq("Commands to find zero of sin(x) in [3,4]")
```

* Let $f(x) = \exp(x) - x^5$. In the long run the exponential
  dominates the polynomial and this function grows unbounded. By
  graphing over the interval $[0,15]$ you can see that the largest
  zero is less than 15. Find a bracket and then use `bisection` to
  identify the value of the largest zero. Show your commands.

```
```

```julia
f(x) = exp(x) - x^5
val = maximum(fzeros(f, 0, 15))
numericq(val, 1e-4, "largest root of \\( e^x - x^5 \\) in [0,15]")
```

* Find the intersection point of $4 - e^{x/10} = e^{x/15}$ by first
  graphing to see approximately where the answer is. From the graph,
  identify a bracket and then use `bisection` to numerically estimate the
  intersection point.

```
```

```julia
h(x) = 4 - exp(x/10) - exp(x/15)
val = maximum(fzeros(h, 0, 30))
numericq(val, 1e-3, "largest intersection point of  4 - exp(x/10) = exp(x/15)")
```

* The `Roots` package has a built-in function `fzero` that does
  different things, with one of them being a (faster) replacement for
  the `bisection` function. That is, if `f` is a continuous function
  and `[a,b]` a bracketing interval, then `fzero(f, [a,b])` will find
  a zero of `f`.

Show that it works by finding a zero of the function `f(x) = (1 + (1 -
n)^2)*x - (1 - n*x)^2` when $n=10$. Use $[0, 0.5]$ as a bracketing
interval. What is the value?

```
```

```julia
n = 10
f(x) = (1 + (1-n)^2)*x - (1-n*x)^2
val = fzero(f, [0, 0.5])
numericq(val, 1e-4, "zero of  \\( (1 + (1-n)^2)*x - (1-n*x)^2 \\)")
```


* The `airy` function is a special function of historical
  importance. (It is a built-in function.) Find its largest *negative* zero by first plotting, then
  finding a bracketing interval and finally using `fzero` to get a
  numeric value.

```
```

```julia
val = fzero(airy, -3, 0)
numericq(val, 1e-4, "largest negative root of airy function")
```


* Suppose a crisis manager models the number of cases of water left
  after $x$ days by $f(x) = 550,000 \cdot (1 - 0.25)^x$. When does the
  supply of water dip below $100,000$? Find a bracket and then use a
  numeric method to get a precise answer.

```
```

```julia
longq("When does the supply of water dip below 100,000?", "\\(f(x) = 550000*(1-0.25)^x\\);\\verb+fzero(x->f(x)-100000,[0,10])+; 5.92580")
```


* Use `fzeros` to find the roots of $e^x = x^5$ over $[-20,20]$.

```
```

```julia
choices = [".129856",".129856, 12.7132", "1.85718, 4.53640", "-0.8155, 1.42961, 8.6131"]
ans = 2
radioq(choices, ans, "roots of \\( e^x - x^5 in [-20,20] \\)")
```

### Using answers

The output of `fzeros` is a collection of values. It may be desirable
to pass these onto another function. This is essentially
*composition*.  For example, we can check our work using this pattern:

```
f(x) = cos(x) + cos(2x)
zs = fzeros(f, [0,2pi])
map(f, zs)
```

We see that the values are all basically $0$, save for round-off error.


* Let $f(x) = 5x^4-6x^2$ and $g(x) = 20x^3 - 12x$. What are the values
  of $f$ at the zeros of $g$? Show your commands and answer.

```
```

```
longq("Values of f at zeros of g", "map(f, fzeros(g)): [-1.8, 0, 1.8]")
```






### Issues with numerics

The `fzero` function implementing the bisection method is guaranteed
to return a value where the function being evaluated crosses zero,
though that value may not be an exact zero. However, this need not be
the actual value being sought. This can happen when the function being
evaluated is close to zero near the zero. For example, the function
$(x-1)^5 = x^5 - 5x^4 + 10x^3 - 10x^2 + 5x - 1$ will be very flat near
the one real zero, $1$. If we try to find this zero with the expanded
polynomial, we only get close:

```
f(x) = x^5 - 5x^4 + 10x^3 - 10x^2 + 5x - 1
fzero(f, [.9, 1.1])
```

* What zero does `fzero` return if instead of the expanded polynomial, the factored form `f(x) = (x-1)^5` were used?

```
```

```
val = fzero(x -> (x-1)^5, [.9, 1.1])
numericq(val)
```

* Make a plot of the expanded polynomial over the interval $[0.9, 1.1]$. How many zeros does the graph show?

```
```

```
choices = [L"Just one at $x=1$", "Many zeros"]
ans = 2
radioq(choices, ans)
```

* The *intermediate value theorem* guarantees a zero by the bisection
  method **if** the function is continous. However, when the function
  is not continuous the bisection method may still be used to find a
  place where the function "jumps" over $0$. What does `fzero` find?
  For the function $f(x) = 1/x$, the values $a=-1$, $b=1$ form a
  bracketing interval. What value is found from `fzero`?

```
```

```
choices = [L"0", "NaN", L"An error, as the function is never $0$"]
ans = 1
radioq(choices, ans,keep_order=true)
```

* There can be numeric issues when roots of a polynomial are close to each other. For example, consider the polynomial parameterized by `delta`:

```
delta = 0.01
f(x) = (x-1-delta)*(x-1)*(x-1+delta)
fzeros(f)
```

The above easily finds three roots separated by `delta`. What happens
if `delta` is smaller, say `delta = 0.0001`, so the three mathematical
roots are even closer together? Are all three roots still found by `fzeros`?

```
```

```
delta = 0.0001
f(x) = (x-1-delta)*(x-1)*(x-1+delta)
val = length(fzeros(f))
booleanq(val==3, labels=["Yes","No"])
```



