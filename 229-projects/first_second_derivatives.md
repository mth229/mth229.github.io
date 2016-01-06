# Questions to be handed in for project 7:


To get started, we load the `Gadfly` backend for `Plots` so that we can make plots, and the `Roots` package for its `D` and `fzero` functionality:

```
using Plots
gadfly()
using Roots			
```


### Quick background

Read about this material here: [Exploring first and second derivatives with Julia](http://mth229.github.io/first-second-derivatives.html).


For the impatient, this assignment looks at the relationship between a
function, $f(x)$, and its first and second derivatives, $f'(x)$ and
$f''(x)$. The basic relationship can be summarized (though the devil
is in the details) by:

1) if the first derivative is _positive_ on $(a,b)$ then the function
  is _increasing_ on $(a,b)$.

2) If the second derivative is _positive_ on $(a,b)$ then the function
  is _concave up_ on $(a,b)$.

(The devil here is that the converse statements are not quite always true.)

We can use the `D` operator from the `Roots` package to find the
first and second derivatives of `f`. Recall, if `f` is a function, then `D(f)` will be a function that computes its *first* derivative and `D(f,2)` will be a function that computes its *second* derivative. If you define this function (ignoring any warnings):

```
Base.ctranspose(f::Function) = D(f)
```

then you can use `f'` instead of `D(f)` and `f''` in place of `D(f,2)`.


In the notes, the following function is used to plot a function `f`
using two colors depending on whether the second function, `g` is positive or not.

```
function plotif(f, g, a, b)
  plot([f, x -> g(x) > 0.0 ? f(x) : NaN], a, b, linewidth=5)
end
```

This allows a graphical exploration of the above facts. For example, this graph shows where the sine function in *increasing* over $[0, 2pi]$:

```
f(x) = sin(x)
plotif(f, f', 0, 2pi)		# shows sin(x) and when its derivative is 0
```

<br/>

As a reminder

* a _critical_ point of $f$ is a value in the domain of $f(x)$ for
which the derivative is $0$ or undefined. These are often but **not
always** where $f(x)$ has a local maximum or minimum. 

* An _inflection point_ of $f$ is a value in the domain of $f(x)$
where the concavity of $f$ changes. (These are _often_ but **not
always** where $f''(x)=0$.)



We can graphically identify these points or find them numerically by finding zeroes of the appropriate function.
To find zeros we have the function call `fzero(f, a)` to find a zero iteratively starting at $x=aS$ or `fzeros(f, [a,b])` to nievely search for
any zeros in the interval $[a,b]$.  (Recall, `fzeros` may miss some values, so a graph should always be made to double check)

For example:

```
f(x) = 1 + cos(x) + cos(2x)
fzero(f, 1.5)
```

Or to get all values in an interval:

```
fzeros(f, [0, 2pi])
```

The answer from `fzeros` is a vector of values, which may require some extra work.

### Questions

#### Graphical explorations


* The `airy` function is a *built$-in function that is important for
  some applications. It is likely to be unfamiliar. Make a graph using
  `plotif` to investigate when the `airy` function is positive on the
  interval $(-5,5)$. Your answer should use interval
  notation. (Recall, when the second function passed to `plotif` is
  positive, the graph uses a different color, so you need to think
  about what function that should be.)

```
```

```
longq("Commands to plot airy to see when it is positive", "(-5,-4.08) and (-2.33, 5)")
```

* Make a graph using `plotif` to investigate when the function $f(x) =
  x^x$ is _increasing_ on the interval $(0,2)$. Your answer should use
  interval notation. 

```
```

```
longq("Interval(s) in (0,2) where \\( x^x \\) is increasing.", "Roughly (0.3678, 2)")
```


* Make a graph using `plotif` to investigate when the function

$$~
f(x) = \frac{x}{x^2+9}
~$$

is _concave up_ on the interval $(-10,10)$. Your answer should use interval notation. 

```
```

```
longq("When on (-10, 10) is \\( x/(x^2 + 9) \\) concave up?",
     L"(-5.196, 0), (5.196, \infty)")
```

* Make a graph using `plotif` to identify any _critical points_ of
  $f(x) = x \ln(x)$ on the interval $(0,4)$. Points where the function changes from increasing to decreasing will be critical points (though there may be others).

```
```

```
longq("Critical point of \\( x \\log(x) \\) on (0,4)",
      "0.367879 is only one")
```

* Make a graph using `plotif` to identify any _inflection points_ of
  $f(x) = \sin(x) - x$ over the interval $(-5,5)$. Points where the function changes concavity are inflection points (though there may be others).

```
```

```
longq("inflection points of sin(x) - x in (-5,5)", "-pi, 0, pi")
```


* For any polynomial $p(x)$, between any two consecutive zeros there must be a
  critical point, perhaps more than one.

  For $p(x) =x^4 + x^3 - 7x^2 - x + 6$, there are zeros $-3$, $-1$, $1$ and $2$. Find the critical points using `plotif`. Which critical point(s) are between $-1$ and $1$?



```
```

```
choices = [L"0", L"-1, 1", L"-2,2, 0, 1.5", L"-2.2", L"3"]
ans = 1
radioq(choices, ans)
```

#### Finding more precise numeric values

* Use `fzero` to numerically identify all _critical points_ to the
function $f(x) = 2x^3 - 6x^2 - 2x + 4$. (There are no more than $2$.)

```
```




```
longq("critical points of \\( f(x) = 2x^3 - 6x^2 - 2x + 4 \\)", "\\verb+fzeros(D(f), -10,10)+ gives -0.15455, 2.1547")
```

* Use `fzero` to numerically identify all _inflection points_ for the
  function $f(x) = \ln(x^2 + 2x + 5)$.

```
```

```
choices = ["There are none",
	"There is one at x=-1.0",
	"There is one at x=1.0 and one at x=-3.0",
	"There is one at each of x=-4.4641, -1.0, and 2.4641"]
ans = 3
radioq(choices, ans, "all inflection points")
```

* Numerically identify all _critical points_ to the rational function $f(x)$ defined below. Graphing is useful to identify where the possible values are.

$$~
f(x) = \frac{(x-3)\cdot (x-1)\cdot (x+1)\cdot (x+3)}{(x-2)\cdot (x+2)}.
~$$

```
```

```
choices = [L"-2.44949, 2.44949",
L"0",
L"-3,-1,1,3",
L"-2,2"
]
ans = 2
radioq(choices, ans)
```



* Suppose $f'(x) = x^3 - 6x^2 + 11x - 6$. Where is $f(x)$ increasing?
  Use interval notation in your answer.

```
```

```
choices = ["It is always increasing",
	L"(-\infty, 1.42265) and (2.57735, \infty)",
	L"(1.0, 2.0) and (3.0, \infty)",
	L"(2.0, \infty)"]       
ans = 3
radioq(choices, ans, "When is f(x) increasing?")
```

* Suppose $f''(x) = x^2 - 3x + 2$. Where is $f(x)$ concave up? Use
  interval notation in your answer.

```
```


```
choices = [L"(-\infty, \infty) -- it is always concave up",
	L"(1.5, \infty)",
	"(1.0, 2.0)",
	L"(-\infty, 1.0) and (2.0, \infty)"]
ans = 4
radioq(choices, ans, "When is f(x) concave up?")
```

### The derivative tests

#### The first derivative test

This states that for a differentiable function
$f(x)$ with a critical point at $c$ then if $f'(x)$ changes sign
from $+$ to $-$ at $c$ then $f(c)$ is a local maximum and if it
changes sign from $-$ to $+$ then $f(c)$ is a local minimum.

* For the function $f(x)$ suppose you know $f'(x)=x^3 - 5x^2 + 8x -
4$. Find *all* the critical points. Use the first derivative test to
classify them as local extrema *if* you can. If you can't say why.

```
```

```
longq("Find critical points of f(x), when \\( f'(x)=x^3 - 5x^2 + 8x -4 \\). Classify",
"1,2 are cps, changes sign - to + at 1, so a min; does not change sign at 2, not an extrema")
```

#### The second derivative test

This states that if $c$ is a critical point of
$f(x)$ and $f''(c) > 0$ then $f(c)$ is a local minimum and if
$f''(c) < 0$ then $f(c)$ is a local maximum.

* Suppose $f'(x) = (x^2 - 2) \cdot e^{-x}$. First find the critical
points of $f(x)$, then use the second derivative test to classify
them.

The critical points are:

```
```

```
choices = ["-1.41421, 1.41421", "0.0", "-0.732051", "-0.732051, 2.73205"]
ans = 1
radioq(choices, ans, "critical points")
```

Classify your critical points using the second derivative test

```
```

```
longq("Classify critical points with second derivative test", "\\verb+[D(fp)(x) for x in sort(fzeros(fp, -5,5))]+ indicates max at -sqrt(2) and min at sqrt(2)")
```



* Suppose $f'(x) = x^3 - 7x^2 + 14$. Based on  the plot over the interval
  $[-4, 8]$. On what subintervals is $f(x)$ increasing?

```
```

```
choices = [L"(-1.29, 1.61) and (6.69, \infty)",
	L"(-\infty, 0) and (4.67, \infty)",
	L"(-\infty, 0)",
	L"(-\infty, 00) and (6.69, \infty)"]
ans = 1
radioq(choices, ans, "when is f increasing")
```

What did you use to find your last answer?

```
```

```
choices = [
"f'(x) > 0 on these subintervals",
"f''(x) > 0 on these subintervals",
"f'(x) < 0 on these subintervals",
"f''(x) < 0 on these subintervals"
]
ans = 1
radioq(choices, ans, "how?")
```

What are the $x$-coordinates of the relative minima of $f(x)$?

```
```

```
choices = ["4.56", "-1.29 and 6.69", "4.56 and 0", "-1.29 and 1.61"]
ans = 2
radioq(choices, ans, "where are minima?")
```

On what subintervals is $f(x)$ concave up?

```
```

```
choices = [
L"(-\infty, 0) and (4.67, \infty)",
L"(1.167, \infty)",
L"(-\infty, 1.167)",
"It is always concave down"
]
ans = 1
radioq(choices, ans, "Where is f(x) concave up?")
```

What did you use to decide?

```
```

```
choices = [
"f'(x) > 0 on these subintervals",
"f''(x) > 0 on these subintervals",
"f'(x) < 0 on these subintervals",
"f''(x) < 0 on these subintervals"
]
ans = 2
radioq(choices, ans, "Where is f(x) concave up?")
```

Find the $x$ coordinates of the inflection points of $f(x)$.

```
```

```
choices = ["4.56", "4.67", "0 and 4.67", "Not listed"]
ans = 3
radioq(choices, ans, "inflection points")
```

* Suppose you know the function $f(x)$ has the second derivative given
  by the `airy` function. Use this to answer the following questions
  about $f(x)$ over the interval $(-5, 0)$.

```
```

On what interval(s) is the function $f(x)$ positive?

```
choices = [
L"$(-5, -4.08795)$ and $(-2.33811,0)$",
L"$(-5, -4.8201)$ and $(-3.2482, -1.01879)$",
L"$(-4.83074, -3.27109)$ and $(-1.17371, 0)$",
"Can't tell."
]
ans = 4
radioq(choices, ans, keep_order=true)
```

On what interval(s) is the function $f(x)$ increasing?

```
choices = [
L"$(-5, -4.08795)$ and $(-2.33811,0)$",
L"$(-5, -4.8201)$ and $(-3.2482, -1.01879)$",
L"$(-4.83074, -3.27109)$ and $(-1.17371, 0)$",
"Can't tell."
]
ans = 4
radioq(choices, ans, keep_order=true)
```

On what interval(s) is the function $f(x)$ concave up?

```
choices = [
L"$(-5, -4.08795)$ and $(-2.33811,0)$",
L"$(-5, -4.8201)$ and $(-3.2482, -1.01879)$",
L"$(-4.83074, -3.27109)$ and $(-1.17371, 0)$",
"Can't tell."
]
ans = 1
radioq(choices, ans, keep_order=true)
```


* A simplified model for the concentration of a certain slow-reacting
  medicine in the bloodstream $t$ hours after injection into muscle
  tissue is given by

$$~
f(t) =  3t^2 \cdot e^{-t/5}, \quad t \geq 0.
~$$

When will there be maximum concentration?

```
```

```
using Roots
conc(t) =  3*t^2*exp(-t/5)
val = Roots.fzero(D(conc), 10)
numericq(val, 1e-4, "when is max. concentration?")
```

In the units given, how much is the maximum concentration?

```
```

```
conc(t) =  3t^2*exp(-t/5)
val = fzero(D(conc), 10)
numericq(f(val), 1e-2, "what is max. concentration?")
```

When will the concentration dip below a level of 1.0?

```
```

```
c(t) =  3t^2*exp(-t/5)
val = fzero(x -> c(x) - 1, 40)
numericq(val, 1e-2, "when will it dip below 1.0?")
```

Estimate from a graph when the concentration function changes concavity:

```
```

```
longq("When does concentration change concavity?", "At 2.92 and 17.07, e.g. fzeros(D(f,2), 0, 30)")
```


### Concave up has alternate definitions

The Rogawski book defines $f(x)$ to be concave up for differentiable
functions by: 

> $f(x)$ is concave up on $(a,b)$ if $f'(x)$ is increasing on $(a,b)$.


But, not all functions have derivatives. For *continuous* functions, an alternate definition of concave up on $(a,b)$ is that for any pair of points, $(c,d)$ with $a < c < d < b$ the function value at the average is less than or equal the average of the function values:

$$~
f(\frac{c + d}{2}) \leq \frac{f(c) + f(d)}{2}
~$$


* Verify that this holds for the continuous, concave up function $f(x) = e^x$ by picking two values for $c$ and $d$ and checking the inequality. Show your commands.

```
```

```
longq("Commands to verify f((a+b)/2 <= (f(a) + f(b))/2 for e^x", """
f(x) = exp(x)
c,d = rand(2)
f((c+d)/2) <= (f(c) + f(d))/2
""")
```


For any function, [Wikipedia](https://en.wikipedia.org/wiki/Convex_function) gives a different definition which basically says $f(x)$ is concave up on $(a,b)$ if for
**any** pair of points, $c$ and $d$ with $a < c < d < b$ the has the
secant line connecting $(c,f(c))$ and $(d,f(d))$ lies _above_ the
graph of $f(x)$ over $(c,d)$.

This can be investigated graphically. This function is helpful for making a secant line:

```
function secline(f, c, d)
  x0, y0, m = c, f(c), (f(c) - f(d)) / (c - d)
  x -> y0 + m * (x - x0)	# pt-slope form as function
end
```

For a function, say, $f(x) = \sin(x)$, it is used as:

```
f(x)=sin(x)
plot([f, secline(f, pi/6, pi/3)], 0, pi/2)
```

That makes a graph of $\sin(x)$ over $[0, \pi/2]$ and draws the secant line between $[\pi/6, \pi/3]$. This line lies *below* the graph of $f(x)$, so we can say definitively that $\sin(x)$ is *not* concave up over $[0, \pi/2]$. (It is concave down.)


For the function $f(x) = x^2 - 2x$, graphically verify $f$ is concave up by 
showing for any 3 pairs of points between $(-5,5)$ the secant line is above $f$ over the chosen interval. (You pick the the three pairs of points.) Show your commands.


```
```

```
longq("Commands to produce graph of \\( x^2 - 2x \\) and three secant lines")
```

* For the function $f(x) = x^3 - 2x$ find a pair of points, $c$ and
  $d$, in $(-3,3)$ which illustrate that the function is not concave
  up.

```
```


```
longq("Commands to produce graph of \\( x^3 - 2x \\) and a secant line that is not always above graph")
```


