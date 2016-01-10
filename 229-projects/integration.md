# Questions to be handed in on integration:

To get started, we load the `Gadfly` backend for `Plots`, so that we can make plots; load the `Roots` package for its `D` function; and the `SymPy` package:

```
using Plots
gadfly()
using Roots			# for D and fzero
using SymPy
```

### Quick background

Read more about this material here: [integration](http://mth229.github.io/integration.html).



For the impatient, in many cases, the task of evaluating a definite integral is made easy
by the fundamental theorem of calculus which says that for a
continuous function $f$ the following holds for any antiderivate, $F$, of $f$:

$$~
\int_a^b f(x) dx = F(b) - F(a).
~$$

That is the definite integral is found by evaluating a related
function at the endpoints, $a$ and $b$.


The `SymPy` package can compute many antiderivatives using a version
of the [Risch algorithm](http://en.wikipedia.org/wiki/Risch\_algorithm) that works for [elementary functions](http://en.wikipedia.org/wiki/Elementary\_function). `SymPy`'s
`integrate` function can be used to find an indefinite integral:

```
f(x) = x^2
integrate(f)
```

Or a definite integral:

```
integrate(f, 0, 1)		# returns a "symbolic" number
```


However, this only works *if* there is a known antiderivative $F(x)$
$-$ which is not always the case. If not, what to do?

In this case, we can appeal to the definition of the definite
integral. For continuous, non-negative $f(x)$, the definite integral
is the area under the graph of $f$ over the interval $[a,b]$. For
possibly negative functions, the indefinite integral is found by the
*signed* area under $f$.  This area can be directly *approximated*
using Riemann sums, or some other approximation scheme.


The Riemann approximation can help. The following pattern will compute
a Riemann sum using right-hand endpoints:

```
f(x) = x^2
a, b, n = 0, 1, 5		# 5 partitions of [0,1] requested
delta = (b - a)/n		# size of partition
xs = a + (1:n) * delta	
fxs = [f(x) for x in xs]
sum(fxs * delta)		# a new function `sum` to add up values in a container
```

That value isn't very close to $1/3$. But we only took $n=5$
rectangles $-$ clearly there will be some error. Bigger $n$s mean
better approximations:

```
f(x) = x^2
a, b, n = 0, 1, 50_000		# 50,000 partitions of [0,1] requested
delta = (b - a)/n		
xs = a + (1:n) * delta	
fxs = [f(x) for x in xs]
sum(fxs * delta)
```

Note that only the first two lines needed changing to adjust to a new
problem. As the pattern is similar, it is fairly easy to wrap the
computations in a function for convenience. We borrow this more
elaborate one from the notes that works for some other methods beside
the default right-Riemann sum:

```
function riemann(f::Function, a::Real, b::Real, n::Int; method="right")
  if method == "right"
     meth(f,l,r) = f(r) * (r-l)
  elseif method == "left"
     meth(f,l,r) = f(l) * (r-l)
  elseif method == "trapezoid"
     meth(f,l,r) = (1/2) * (f(l) + f(r)) * (r-l)
  elseif method == "simpsons"
     meth(f,l,r) = (1/6) * (f(l) + 4*(f((l+r)/2)) + f(r)) * (r-l)
  end

  xs = a + (0:n) * (b-a)/n
  as = [meth(f, l, r) for (l,r) in zip(xs[1:end-1], xs[2:end])]
  sum(as)
end
```


The Riemann sum is very slow to converge here. There are faster
algorithms both mathematically and computationally. We will discuss
two: the trapezoid rule, which replaces rectangles with
trapezoids; and Simpson's rule which is a quadratic approximation.

```
f(x) = x^2
riemann(f, 0, 1, 1000, method="trapezoid"), riemann(f, 0, 1, 1000, method="simpsons")
```

Base `julia` provides the `quadgk` function which uses a different
approach altogether. It is used quite easily:

```
f(x) = x^2
ans, err = quadgk(f, 0, 1)
```

The `quadgk` function returns two values, an answer and an estimated maximum
possible error.  The ans is the first number, clearly it is $1/3$, and
the estimated maximum error is the second. In this case it is small
($10^{-17}$) $-$ basically 0.

### Questions


* Let $g(x) = x^4 + 10x^2 - 60x + 71$. Find the integral $\int_0^1
  g(x) dx$ by hand by finding an antiderivative and then using the fundamental theorem of calculus.

```
```

```
longq("Commands to do FTC", "\\verb# G(x) = x^5/5 + 10x^3/3 -60x^2/2+71x; G(1)-G(0)=44.53# (or \\verb#integrate(g, 0, 1)=668/15#)")
```


* For $f(x) = x/\sqrt{g(x)}$ (for $g(x)$ from the last problem) estimate the following using 1000 Riemann sums:

$$~
\int_0^1 f(x) dx
~$$

```
```

```
function riemann(f::Function, a::Real, b::Real, n::Int; method="right")
  if method == "right"
     meth(f,l,r) = f(r) * (r-l)
  elseif method == "left"
     meth(f,l,r) = f(l) * (r-l)
  elseif method == "trapezoid"
     meth(f,l,r) = (1/2) * (f(l) + f(r)) * (r-l)
  elseif method == "simpsons"
     meth(f,l,r) = (1/6) * (f(l) + 4*(f((l+r)/2)) + f(r)) * (r-l)
  end

  xs = a + (0:n) * (b-a)/n
  as = [meth(f, l, r) for (l,r) in zip(xs[1:end-1], xs[2:end])]
  sum(as)
end
g(x) =  x^4 + 10x^2 - 60x + 71
f(x) = x/sqrt(g(x))
val = riemann(f, 0, 1, 1000)
numericq(val, 1e-8, "riemann sum, n=1000")
```

* Let $f(x) = \sin(\pi x^2)$. Estimate $\int_0^1 f(x) dx$ using 20 right-Riemann sums

```
```

```
f(x) = sin(pi*x^2)
val = riemann(f, 0, 1, 20)
numericq(val, 1e-8, "riemann sum, n=20")
```

* For the same $f(x)$, compare your estimate with 20 Riemann sums to
  that with 20,000 Riemann sums. How many digits after the decimal
  point do they agree?

```
```

```
val2 =  riemann(f, 0, 1, 20_000)
abs(val - val2)			# 3 points
choices = ["They differ at the $x place after the decimal point" for x in ["first", "second", "third", "fourth", "fifth", "sixth"]]
ans=3
radioq(choices, ans, "Where do they differ?")
```

#### Left Riemann
The left Riemann sum uses left-hand endpoints, not right-hand ones. 

* For $f(x) = e^{x}$ use the left Riemann sum with $n=10,000$ to estimate $\int_0^1 f(x) dx$.

```
```

```
f(x) = exp(x)
val =  riemann(f, 0, 1, 10_000, method="left")
numericq(val, 1e-8, "left-hand intervals")
```

* The left and right Riemann sums for an increasing function are also
  lower and upper bounds for the answer. Find the difference between
  the left and right Riemann sum for $\int_0^1 e^x dx$ when
  $n=10,000$. (Use your last answer.) What is the approximate value
  $1/100$, $1/1000$, $1/10000$, or $1/100000$?

```
```

```
choices = ["1/$i" for i in [100, 1000, 10_000, 100_000]]
ans = 3
radioq(choices, ans, "Approximate difference for 10,000 steps")
```

#### Trapezoid, Simpson's

* The answer to $\int_0^1 e^x dx$ is simply $e^1 - e^0$ =
  $e-1$. Compare the error (in absolute value) of the trapezoid method when $n=10,000$.

```
```

```
f(x) = exp(x)
trap = riemann(f, 0, 1, 10_000, method="trapezoid")
val = abs(exp(1) - exp(0) - trap) # 1e-9
choices = ["The error is about 1e-$n" for n in 6:12]
ans = 4
radioq(choices, ans, "Size of error")
```



* The answer to $\int_0^1 e^x dx$ is simply $e^1 - e^0$ =
  $e-1$. Compare the error of the Simpson's method when $n=10,000$.

```
```


```
f(x) = exp(x)
trap = riemann(f, 0, 1, 10_000, method="simpsons")
val = abs(exp(1) - exp(0) - trap) # 1e-9
choices = ["The error is about 1e-$n" for n in 10:16]
ans = 4
radioq(choices, ans, "Size of error, simpsons")
```

(The error for Riemann sums is "like" $1/n$, the error for trapezoid sums is like $1/n^2$, and for Simpson's rule the error is like $1/n^4$.)

## quadgk

* Use `quadgk` to find $\int_{-3}^{3} (1 + x^2)^{-1} dx$. What is the answer? What is the estimated maximum error?

The answer is:

```
```

```
f(x) = (1+x^2)^(-1)
val, err = quadgk(f, -3, 3)
numericq(val, 1e-8, "area under f")
```

The error is about

```
```

```
choices = ["The error is about 1e-$n" for n in 6:12]
ans = 3
radioq(choices, ans, "Size of error, quadgk")
```

* Use `quadgk` to find the integral of $e^{-|x|}$ over $[-1,1]$.

```
```

```
f(x) = exp(-abs(x))
val, err = quadgk(f, -1,1)
numericq(val, 1e-8, "area under f")
```


* The integral of $\sqrt{1-x^4}$ over $[-1,1]$ can not be found with the Fundamental Theorem of Calculus using an elementary function for an antiderivative. What is the *approximate* value?

```
```

```
f(x) = sqrt(1-x^4)
val, err = quadgk(f, -1,1)
numericq(val, 1e-8, "area under f")
```


* The integral of $f(x) = \log(log(x))$ over $[e,e^2]$ can not be
  found with the Fundamental Theorem of Calculus using an elementary
  function for an antiderivative. What is the *approximate* value?

```
```

```
f(x) = log(log(x))
val, err = quadgk(f, e, e^2)
numericq(val, 1e-8, "area under f")
```

The graph of $f(x)$ over the interval $[e, e^2]$ makes clear that the
triangle formed by the line connecting $(e, f(e))$ and $(e^2,
f(e^2))$, the $x$ axis, and the line $x=f(e^2)$ will form a lower
bound for the area under $f$. What is the error in this approximation?
(Where error = answer $-$ approximation.)

```
```


```
f(x) = log(log(x))
val, err = quadgk(f, e, e^2)
appx = 1/2 * (e^2 -e) * (f(e^2) - f(e))
numericq(abs(val-appx), 1e-4, "area under f")
```


* A formula to compute the length of a the graph of the function $f(x)$ from $a$ to $b$ is given by the formula:

$$~
\int_a^b \sqrt{1 + f'(x)^2} dx
~$$

Use this formula when $f(x) = \sin(x)$ and the interval is $[0,\pi]$. What is the answer?

```
```

```
f(x) = sin(x)
val, err = quadgk(x -> sqrt(1 + D(f)(x)^2), 0, pi)
numericq(val)
```

Repeat, when the function is $f(x) = x^x$ over $(0, 3)$:

```
```

```
f(x) = x^x
b = 3
val, err = quadgk(x -> sqrt(1 + D(f)(x)^2), 0, b)
numericq(val)
```

* Compute the area between the intersection points of the two curves $f(x) = x$ and $g(x) = x^3$ by taking the difference between two definite integrals.

```
```

```
f(x) =x
n = 3
g(x) = x^n
a,b = 0, 1
val = quadgk(f, a, b)[1] - quadgk(g, a, b)[1]
numericq(val)
```

## Applications

We discuss an application of the integral to finding the volumes $-$
not just areas.

A *solid of revolution* is a figure with rotational symmetry around
some axis, such as a soda can, a snow cone, a red solo cup, and other
common objects. A formula for the volume of an object with rotational
symmetry can be written in terms of an integral based on a function,
$r(h)$, which specifies the radius for various values of $h$.

> If the radius as a function of height is given by $r(h)$, the
> the volume is $\int_a^b \pi r(h)^2 dh$.


So for example, a baseball has a overall diameter of $2\cdot 37$mm,
but if we place the center at the origin, its rotational radious is
given by $r(h) = (37^2 - h^2)^{1/2}$ for $-37 \leq h \leq 37$. The
volume in mm$^3$ is given by:

```
r(h) = (37^2 - h^2)^(1/2)
v(h) = pi * r(h)^2
quadgk(v, -37, 37)
```

### Glass half full



* A glass is formed as a volume of revolution with radius as a
  function of height given the equation $r(h) = 2 + (h/20)^4$. The
  volume as a function of height $b$ is given by $V(b) = \int_0^b \pi
  r(h)^2 dh$. Find $V(25)$. Show your work.

```
```

```
longq("Volume of glass", "\\verb#R(h) = 2 + (h/20)^4;V(b) = quadgk(x->pi*R(x)^2, 0, b)[1];V(25)# 519...")
```

* Find a value of $b$ so that $V(b) = 455$.

```
```

```
longq("b so that V(b) = 455", "\\verb#fzero(b->V(b)-455, 25)# 23.85")
```

* Now find a value of $b$ for which $V(b) = 455/2$. This height will
  have half the volume as the height just found. Compare the two
  values. Is the ratio of smallest to largest 1/2, more than 1/2 or
  less?

```
```

```
longq("b so that V(b) = 455/2", "\\verb#fzero(b->V(b)-455/2, 25/2)# 16.48")
```


