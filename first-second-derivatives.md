# Exploring first and second derivatives with Julia


## Introduction

This project explores the relationship between a function, $f(x)$ and its first and second derivatives. 

The following definitions describe features of functions over an interval:

* The function $f(x)$ is *positive* on an interval $I=(a,b)$ if $f(x) > 0$ for any $x$ in $(a,b)$.

* The function $f(x)$ is *increasing* (strictly) on an interval $I=(a,b)$ if $f(x) < f(y)$
  whenever $a < x < y < b$.

* The function $f(x)$ is *concave up* on an interval $I=(a,b)$ if any
  secant line between values $x$ and $y$ with $a < x < y < b$ lies
  above the graph of $f(x)$.


```
note("""
There are similar definitions for *negative*, *decreasing*, and *concave down*.
""")
```

### Consequences

You may be more familiar with these implications for functions with derivatives:

* An increasing function will have the property that any secant line connecting $x$ and $y$ with $a < x < y < b$ will have positive slope.

* An increasing function on $I$ that is differentiable has $f'(x) \geq
  0$ on $I$.

* If $f'(x)$ exists and is positive on $I=(a,b)$, then $f(x)$ is
  *increasing* on $I$.

* If $f'(x)$ exists and is increasing on $I=(a,b)$, then $f(x)$ is
  concave up on $I$.

* If $f''(x)$ exists and is positive on $I=(a,b)$, then $f'(x)$ is
  increasing on $I$, and so $f(x)$ is concave up on $I$.


```
alert("""

Pay attention to the difference between positive and non-negative. For
example, an increasing, differentiable function on *I=(a,b)* is only
guaranteed to have a *non-negative* derivative -- not a *positive*
derivative on *I*.

""", title="Positive and negative.")
```



## Graphically Identifying positive, increasing, concave up, critical points, ...


We begin by loading in two packages, one to make a graphic and one to perform differentiation:

```
using Plots; gadfly()
using Roots			# provides D and fzero
Base.ctranspose(f::Function) = D(f)  # allows f'(x) notation
```


Recall the plotting convention with `NaN` values -- they aren't
plotted. This makes it easy for us to highlight when a function is
positive. We make a simple function which plots the function $f(x)$
twice, the second time doing so only *if* $g(x) > 0$. 

```
function plotif(f, g, a, b)
  plot([f, x -> g(x) > 0.0 ? f(x) : NaN], a, b, linewidth=5)
end
```

Then we can plot when a function is positive by using `f` for `g`. For example, when $f(x) = x^3 - 2x - 1/2$ we make the plot

```
f(x) = x^3 - 2x - 1/2
plotif(f, f, -2, 2)
```



In this graph, we estimate graphically that the intervals $(-1.2,
0.2)$ and $(1.5, 2)$ are where $f$ is positive within this viewing
windows.


We can do the same with the derivative, then our graph will show when
the function is increasing

```
plotif(f, f', -2, 2)
```

Again, we eyeball from the graph to estimate that this occurs on
$(-2, -0.8)$ and $(0.8, 2)$.



And of course, concave up:


```
plotif(f,  f'', -2, 2)
```

with the function being concave up on $(0, 2)$.



#### Question

Graphically identify when the function $f(x) = x^x$ is increasing on $(0,2)$

```
choices = ["(0,2)", "(0.4, 2)"];
ans = 2;
radioq(choices, ans)
```

#### Question 

Graphically identify when the function $f(x) = \sqrt{|1 - x^2|}$ is increasing on the interval $[-2, 2]$.

```
choices = ["(-2, -1) and (0,1)",
	"(-1, 0) and (1, 2)",
	"(-2, 2)"];
ans = 2;
radioq(choices, ans)
```




#### Question

Graphically identify when the function $f(x) = x^2 \cdot e^{-x}$ is concave up on the interval $(0,10)$.

```
choices = ["(0, 0.6) and (3.5, 10)",
	"(0.6, 3.5)",
	"(0, 2)",
	"(0,10)"];
ans = 1;
radioq(choices, ans)
```



## Relationships  

Suppose we only know indirect things about a function $f(x)$, how much
can we say?

We previously mentioned two basic relationships:

> If $f'(x) > 0$ on an interval $(a,b)$ then the function $f(x)$ is *increasing* on $(a,b)$. (It may also increase when $f(x)=0$, but it isn't guaranteed.)



> If $f''(x) > 0$ on $(a,b)$ then the function $f(x)$ is *concave up* on $(a,b)$.

Similar statements can be made for negative values of the derivative
and second derivative.


For example, lets suppose we know that the derivative of $f(x)$ is
$f'(x) = \exp(x)$. What can we say about $f(x)$ on the interval
$(0,4)$?

We make two graphs:

```
fp(x) = exp(x)	
plotif(fp, fp, 0, 4)
```

```
plotif(fp, fp', 0, 4)
```

From the graphs we see that $f'(x)$ is always *positive* and *increasing*. 

From the first fact ($f'(x) > 0$) we know that $f(x)$ is increasing on this interval.

From the second fact ($f'(x)$ is  increasing)
we know that $f(x)$ is  concave up on this interval.

Do we know any specific values, or even less ambitiously, when $f(x)$
is positive? The answer must be *no* -- we could always add a constant
to $f(x)$ and not effect its derivative.

----

Now suppose we have a different $f(x)$. In this case all we know is
the second derivative is $f''(x) = x^2 - 2x$. What can we say about
$f(x)$ on the interval (-1,3)$?

A plot to see where the second derivative is positive will show that this
$f''(x)$ is positive on $(-1, 0)$ and $(2,3)$:

```
fpp(x) = x^2 - 2x
plotif(fpp, fpp, -1, 3)
```

This means $f(x)$ is concave up on these same intervals.

Can we tell if our unknown $f(x)$ is increasing? Nope, we have no such
ability.  We could always add a term $mx$ to $f(x)$ and keep the same
second derivative. So we *can't* tell if the function $f(x)$ is
increasing and we *can't* tell where the function $f(x)$ is positive, but we
**can** say where it is concave up when we all we know is a second
derivative.


#### Question

You know that $f'(x) = |x|$. Over $[-1,1]$ where if $f(x)$ increasing and where is it concave up?

```
choices=["You don't know -- the derivative of |x| does not exist",
	 L"f is increasing on $(0,1)$ and concave up on $(-1,1)$",	
 L"f is increasing on $(-1,1)$ and concave up on $(0,1)$"];
ans = 2;
radioq(choices, ans)
```


#### Question

Suppose $f'(x) = (x^4 - x^2 + 2)/(x^4 - 2x^2 + 1)$. When is $f(x)$ increasing on $(-2, 2)$?

```
choices = ["On (-2, -1) and (0, 1)",
	"On (-1, 1)",
	"Wherever it is defined"];
ans = 3;
radioq(choices, ans)
```


#### Question

If $f'(x) = \tan(x) - 3x/2$. When is $f(x)$ concave down on the
interval $(-\pi/3, \pi/3)$?


```
choices = ["(-pi/3, pi/3)",
	"(-0.6, 0.6)",
	"(-pi/3, 0)"];	
ans = 2;
radioq(choices, ans)
```




## Classifying critical points

The first- and second-derivative tests are a means to classify if a
critical point is also a local extrema. A local extrema will correspond to a critical point -- but not vice versa. There are two theorems that ensure a critical point will be a local extrema:



>  **The first derivative test** 
> 
> If $c$ is a critical point *and*
> $f'(x)$ changes sign at $x=c$, then $(c,f( c))$ will be a local
> extrema. (If the sign change is from positive to negative, it will
> be a local maximum.)

> **The second derivative test**
>
> If $c$ is a critical point *and* $f''(x) \neq 0$ then $(c,f( c))$ will
> be a local extrema. If $f''( c) > 0$ this will be a local minimum and
> if $f''( c) < 0$ a local maximum.

----

For example, let $f(x) = 2\sin(x) + \cos(2x)$. Find all critical points on $[0, 2\pi]$.

As $f(x)$ is everywhere differentiable, these critical points would be
where the derivative is $0$. A plot helps us identify how many and
roughly where:

```
f(x) = 2sin(x) + cos(2x)
plot(D(f), 0, 2pi)
```

We see four: one near 0.8, one near 1.5, one near 2.5 and one near
5. We use `fzeros` to identify:

```
cps = fzeros(f', [0, 6])
```

Use the first derivative test to classify these values as relative
maximum or minimum. From the graph of `D(f)` we see at the first one
the derivative is changing sign from positive to negative at the first
one (hence a local maximum), and this alternates as we go along. So we
have a max, min, max, min which we see when we plot `f`:

```
plot(f, 0, 2pi)
```

To get the same from the second derivative test, we evaluate $f''(x)$ at these four points:

```
map(f'', cps)
```

If you wanted something fancy, you could do convert using `sign`:

```
["max", "can't tell", "min"][2 + sign(map(f'', cps))]
```


#### Question

Let $f'(x) = x^4 - 4x^2 + 1$. Classify all relative extrema of $f(x)$ on the interval $(-1, 1)$.

```
choices =[
	"at 0 there is a maximum",
	"Near -1.93185 and 0.51763 there are relative maxima, near 1.93185 and -0.51763 there are relative minima",
	"Near -0.51763 there is a relative minimum, near 0.51763 there is a relative maximum"];
ans = 3;
radioq(choices, ans, keep_order=true)
```



#### Question

Let `fp(x) = (2x-1)/cbrt(x^2 - x - 2)^2)`. Over the interval $(-1.5,1.5)$
identify all relative maxima and minima of $f(x)$.


```
choices=["-1 is a relative min and 0.5 is a maximum",
	"-1 is a critical point but not an extram, 0.5 is a relative minimum",
	"This function only has an asymptote at -1, no relative extrema"];
ans = 2;
radioq(choices, ans)
```







#### Question

Suppose, $f(x)$ has a critical  at $0$ and $1$. If possible, classify them as relative maximum or minimum assuming $f''(x) = 1 - 2x - \sin(x)$


```
choices = ["0 is  relative minimum, 1 is a relative max",
	"0 is a relative maximum, 1 is a relative minimum",
	"both are relative maximum",
	"One can not say from the given information."];
ans = 1;
radioq(choices, ans)
```



