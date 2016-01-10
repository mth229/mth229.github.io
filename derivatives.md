# Approximate derivatives in julia

```noout
using Plots
gadfly()
```

## Introduction

Single-variable calculus has two main concepts: the derivative and the
integral, both defined in terms of a third important concept: the limit. The
derivative is what we discuss here. The derivative allows us to talk
about a tangent line to a curve. This is often called a line that touches
the curve at just one point, but that isn't quite correct, though
often the case locally. A better idea would be to say it is the line
that best approximates the curve at that point. That is, if we were to
zoom in to the graph it might appear to look straight, and that
straightness would have a slope that would match the tangent line.
This idea leads to a primary use of the derivative -- to approximate
functions with simpler lines.  Of course, this intuition is informal,
a definition is in terms of the slope of approximating secant lines.

Historically, Fermat, in a treatise on finding maxima and minima,
approached the problem of finding the tangent line by comparing the
value of $f(x)$ to a nearby value $f(x+h)$. Working with polynomials,
meant that subtracting $f(x+h) - f(x)$ led to a polynomial in
$h$. Dividing by $h$ and then setting $h=0$ yields an answer for the
slope.


The more modern approach (well Cauchy in the 1820s) defines the
derivative of a function, $f$, at a point $c$ as the slope of the
*tangent line*, defined in terms of the *limit* of the slopes of
approximating secant lines. The notation is:

$$~
f'( c ) = \lim_{h \rightarrow 0} \frac{f(c + h) - f( c)}{h}.\quad\text{Derivative at a point}
~$$

As mentioned, intuitively, the tangent line is the best straight-line
approximation to a function near the point $(c, f( c))$ and would have
slope given by the derivative.

This graph shows $f(x) = 2 - x^2$ and various secant lines when $c=-0.75$:

```
f(x) = 2 - x^2
c = -0.75
sec_line(h) = x -> f(c) + (f(c + h) - f(c))/h * (x - c)
plot([f, sec_line(1), sec_line(.75), sec_line(.5), sec_line(.25)], -1, 1)
```

As the value of $h$ goes towards 0 along the path $1$, $0.75$, $0.5$, $0.25$,
... the slope of the secant line heads towards the slope of the
tangent line, in this case $2\cdot 0.75 = 1.5$.

Using the idea of a derivative at a point, one defines the derivative
of the function $f$ to be the function which for each $x$ returns the
derivative of $f$ at the point $x$. Notationally, this just replaces
$c$ above with $x$, but conceptually there is a bit more to it.



## Forward differences <small>Slope of the tangent line</small>


The rules of derivatives allow for a mechanical approach to taking
derivatives with the power rule, chain rule and some special cases. In
this project we look at approaching the derivative numerically. We start by
investigating *approximate derivatives* computed with *finite differences*.

The most naive approximation is simply to assume $h$ is some small
number and use that to approximate the limit above:

```
f(x) = x^2 - 2x; fp(x) = 2x - 2
h = .001
c = 3
( f(c + h) - f(c) ) / h
```

This is known as the *forward difference* approximation to the
derivative. For this example, the difference between the approximation
and the actual slope is:

```			
( f(c + h) - f(c) ) / h - fp(c)
```

That is not too close, just to 3 digits of accuracy.

Notationally, we may write this as:

$$~
f'( c) \approx \frac{f(c + h) - f( c) }{h}
~$$

For some small value of $h$. The equals sign is replaced by an
approximation symbol, as there is no limit expression written.

```
example("Derivative at a point")
```

Let's try the derivative of some well known function.  We know the
derivative of $f(x) = \sin(x)$ is $f'(x) = \cos(x)$. Let's see if the
above works well:

```
f(x) = sin(x); fp(x) = cos(x)
c = pi/4; h = 0.0001
( f(c + h) - f(c) )/h - fp(c)
```

Not as good as we can get -- the error is like `1e-5`, but not too bad already.



```
example("Finding profit")
```

Suppose the tractor company John Deere models its profit per units
sold through the function $P(x) = 50 e^{x/250}/(1 - e^{x/250})$. Find
the marginal profit for $x=200$.

The marginal profit is the change in profit per unit sold -- or the
derivative -- at $x=200$.  We can find this quite simply by either
differentiating directly, or as we do here, approximating the answer
with `julia`. We first note that the function above, is a composition, so
it may be written using two functions:

```
f1(x) = exp(x)/(1 - exp(x))
f(x) = 50 * f1(x/250)
c = 200; h = 0.0001;
res = (f(c+h) - f(c))/h
```

If $50$ is the maximum profit, this is a percentage increase of:

```
(res/50) * 100
```

or a bit more than half a percent.


```
example("Finding the tangent line at a point")
```

Let $f(x) = x^x$. Find the tangent line at $c=2$. Compare the
difference between the value of the tangent line  and the function at $x=2.1$.

The tangent line is most easily expressed in terms of the
*point-slope* formula for a line where the point is $(c, f( c))$ and
the slope is $f'( c)$. This gives:

$$~
y = f( c) + f'( c)\cdot(x - c)
~$$

In the following, the slope of the tangent line will be *approximated*
using a numeric derivative.  We use $h=0.0001$:

```
f(x) = x^x
c = 2; h = 0.0001
m = ( f(c + h) - f(c) ) / h	 
tangent_line(x) = f(c) + m * (x - c)
```

To compare the difference, we have:

```
f(2.1) - tangent_line(2.1)
```


A graph shows this difference:

```
plot([f, tangent_line], 1.85, 2.15)
```


### Practice

#### Question

Find the slope of the tangent line of $f(x) = x\log(x)$ at the value
$x=1$ using $h=0.0001$ and the forward difference method:

```
f(x) = x*log(x)
c, h = 1, 0.0001;
val = (f(c+h) - f(c))/h;
numericq(val, 1e-6)
```

#### Question


Find the slope of the tangent line of $f(x) = x-\log(x)$ at the value
$x=1$ using $h=0.0001$ and the forward difference method:

```
f(x) = x-log(x)
c, h = 1, 0.0001;
val = (f(c+h) - f(c))/h;
numericq(val, 1e-6)
```


#### Question

The built-in `airy` function, when called as `airy(x)`, returns the
so-called Airy function, a special function named after

[George Biddell Airy](http://en.wikipedia.org/wiki/Airy_function). 

Compute the derivative at $c=-3$ using $h=0.0001$.


```
f(x) = airy(x)
c, h = -3, 0.0001;
val = (f(c+h) - f(c))/h;
numericq(val, 1e-6)
```


#### Question

Let $f(x) = \sin(x)$. The slope of the tangent line at $c=\pi/4$ is
well known to have slope $\sqrt{2}/2$. 

Compute the forward difference quotient for $f$ at $c$ using
$h=0.01$. What is the order of the difference between the two values?

```
choices=["3 parts in 100",
         "3 parts in 1000",
	 "3 parts in 10,000",
	 "3 parts in 100,000"]
ans = 2
radioq(choices, ans, hint="Look at `sqrt(2)/2` minus the computed value")
```

#### Question

For the function $f(x) = x^3 - 5x$ use a forward difference with
$h=0.0001$ to approximate the slope of the tangent line at $c=1$. Use
this value to create a tangent line at `(c, f( c))`. Plot both the
function and the tangent. Estimate graphically where the tangent line
crosses the $x$ axis. The value is near:

```
choices = [-2, -1.5, -1, -0.5, 0, 1]
ans = 3
radioq(choices, ans)
```



## Derivative of a function


We might be interested not in the derivative at a point, but in the
derivative as a function. This is how we think of the derivative when
we say if $f(x) = \sin(x)$, the $f'(x) = \cos(x)$.  Mathematically,
from this viewpoint, the derivative is referred to as an *operator*, as it
takes a function and returns a function.

We can reproduce this behavior easily enough with `julia`, as
functions are *first class objects*: they can be passed as arguments and
returned as values.

First, let's define a function to find the derivative at a point using
the "forward difference":

```
forward_difference(f, x0, h) = (f(x0 + h) - f(x0))/h
```

We need three arguments of course as we have three ingredients to
worry about: the function, the point and the size of $h$.

To make an operator that takes $f$ and returns a function (an
anonymous function in this case) that computes our approximation to
$f'$ we can do the following:

```
Df(f; h=1e-8) = x -> forward_difference(f, x, h)
```

We specified a default value of $h$ for convenience, but allow it to be varied if desired.


To see this work, we can find and plot the derivative of $\sin(x)$:

```
f(x) = sin(x)
fp(x) = Df(f)(x)
plot([f, fp], 0, 2pi)
```

Well, we already knew that should just be $\cos(x)$.  The point is we
can easily make the an approximate derivative function from `f` with
the definition `fp(x) = Df(f)(x)`. 

```
alert("""

**Parsing `Df(f)(x)`** Seeing the pair of parenthesis can lead to
confusion, as it isn't common math notation. Here parentheses are not
used for grouping, but rather function application. There are two
function applications and the associativity rules for function
application are left to right, as with most -- but not all --
operations. So `Df(f)` is done first. This returns a function (the
approximate derivative) which is then evaluated at `x`.

""")
```


```
alert("""
**Defining `fp` or `fp(x)`**
We could also have just plotted `[f, Df(f)]` without naming `fp`. As
well, could have written `fp = Df(f)`, but that creates `fp` as an
*anonymous* function and we then couldn't redefine it through `fp(x) =
...`, which would attempt to make it a *generic* function.

""")
```



Let's look at a different function, where we don't know in our heads the answer.

```
f(x) = exp(x)/(1 + exp(x))
plot([f, Df(f)], 0, 5)
```

If we look, we can see from the graph that `f` is increasing and `Df(f)` is positive -- this is no coincidence, of course.


```
example("Critical points")
```


A function's *critical points* are where its derivative is $0$ or
undefined. We can examine these by graphing the function's
derivative. Let's do so for the polynomial $f(x) = x^3 - 5x + 4$:

```
f(x) = x^3 -5x + 4
fp(x) = Df(f)(x)
plot(fp, -5, 5)
```

You can check the zeroes graphically, say by zooming in a bit and
adding the line $y=0$:

```
plot([fp, x->0], -2, 2) 
```

If you want, we can find the roots numerically. For example,

```
using Roots
roots(fp)
```       

In general, we could use the `fzero` function for finding roots, but
in this case, the approximate derivative is still a polynomial, so
`roots` will work, as above. 



```
example("When is a function increasing?")
```

Let $f(x) = \cos(x)$ over the interval $[0, 360]$ (in degrees). When is the
function increasing?

From the relationship of the derivative and the function, we know the
answer is when $f'(x) > 0$. For this example, we can solve this
directly as $f'(x) = -\sin(x)$ and we know when that is positive (well
you are supposed to anyways: when the angle is in the third and fourth
quadrants). Let's see how we would do this task with `julia` and compare.

First, we only need the derivative, so we just ask:

```
f(x) = cosd(x)			# using degrees
fp(x) = Df(f)(x)                # use default h
```

Then we wish to indicate on the graph where `fp(x) > 0`. We can do
this by defining a function that is $0$ when that is the case and
`NaN` otherwise (so that those points are not plotted). We do so below
with an anonymous function:


```
plot([f, x -> fp(x) > 0 ? 0.0 : NaN], 0, 360)
```

The graph of the second function is only drawn when the first function
is increasing. It is from 180 to 360 degrees, or the third and fourth
quadrant, as anticipated.



### Practice

#### question

Let $f(x) = e^x$. Using a forward difference and $h=0.001$ graph both
the function and its approximate derivative over the interval $[0,
3]$. Estimate graphically the largest difference between the function
and its approximate derivative.

```
choices = ["It is about 0.1", "It is about 0.01", "It is about 0"]
ans = 3
radioq(choices, ans)
```

#### question

Let $f(x) = x^2 \exp(-x)$. Using $h=0.0001$ and an approximate
derivative, estimate graphically where $f'(x)$ is positive on the
interval $[0,3]$.


```
choices = ["It is for the entire interval",
	   "Between 0 and 2",
	   "From 0 to about 0.45"]
ans = 2
radioq(choices, ans)
```

#### question

The critical points of a function are where its derivative is
undefined or where its derivative is $0$. For the function $f(x) =
3x^4 -28x^3 + 96x^2 - 144x$ graphically find any critical points over the
interval $[0,10]$

```
choices=["There is one at 3",
	 "There are two distinct ones: 2, 3",
	 "There are two distinct ones: 2, 2.6667",
	 "There are two distinct ones: 2, 4.69"]
ans = 2
radioq(choices, ans)
```


## Improvements to the basic forward difference equation

The error in the approximation of the derivative depends on the size
of $h$. Mathematically, as $h$ gets smaller we get better
approximations, though with the computer other complications arise. To
see mathematically that this is the case, let's look at the difference
between the approximate numeric derivative from the forward difference
and a known derivative.


```
f(x) = sin(x)
fp(x) = cos(x)
[ Df(f,h=h)(.5) - fp(.5) for h=[.1, .01, .001, .0001, .00001] ] 
```

It gets better as $h$ gets smaller. In fact, it looks like when $h$
gets smaller by a factor of $1/10$ so does the error. Let's look a
little deeper though. Rather than type in the values of $h$ as above,
let's use an expression to compute them. Here we find the powers
$10^{-1}, \dots, 10^{-16}$ at once and then compute the differences:

```
hs = [(1/10)^i for i in 1:16];
out = [ Df(f,h=h)(.5) - fp(.5) for h in hs ];
[hs out]
```

When we look, we see that for awhile the approximation gets better (to
about `1e-9`), but then does a U-turn and starts getting worse. The
mathematical approximation gets better and better, but what happens is
the computational error gets worse. We'll see below how to pick the
$h$ that best balances these off, but first lets look at how using
different approximations for the derivative can improve the
"mathematical" error.


### Central difference

It turns out that just by looking to the left and the right we can
improve the mathematical error from getting better at a rate of $h$ to
a rate of $h^2$, provided our function is smooth enough and we don't have issues on the boundaries. The formula,
called the *central difference* approximation to the derivative is:

$$~
f'(x) \approx \frac{ f(x + h) - f(x - h) }{2h}
~$$

For this the mathematical error is like $h^2$, not $h$.


Let's compare. To make our life easier we again create some functions, as we did with `Df` above.

```
central_difference(f, x0, h) = (f(x0 + h) - f(x0 - h)) / (2h)
Dc(f; h=0.0001) = x -> central_difference(f, x, h) 
```

Now to see whether a forward difference or central difference works
better. We can do so with a table. Again with $f(x) = \sin(x)$

```
f(x) = sin(x)
fp(x) = cos(x)
using_D =  [ Df(f,h=h)(.5) - fp(.5) for h in hs ];
using_Dc = [ Dc(f,h=h)(.5) - fp(.5) for h in hs ]; 
[hs using_D using_Dc]
```

The errors for the central difference are either much smaller for the
same size $h$ or the same. We see that we can use a larger $h$ to get
the most accuracy in this example.


```
example("When does the tangent line hit 0?")
```


Let $f(x) = 10/(1+x^2) - 10\exp(-(1/2)x^2)$. The tangent line at $x=c$ is given by

$$~
y = f( c) - f'( c)(x - c)
~$$ 

and this intersects the $x$ axis when $y=0$. Solving this gives:

$$~
c - f( c)/f'( c)
~$$

Our goal is to compute this value for any $c > 0$.

Doing so is easy:

```
f(x) = 10/(1+x^2) - 10*exp(-(1/2)*x^2)
fp(x) = Dc(f)(x)
intersection_point(c) = c - f(c)/fp(c)
```

For example, when $c=1$ we have:

```
c = 1;
intersection_point(c)
```

You can tell from the graph of $f(x)$ that this value should be more than 1, as it is.

```
plot([f, x -> 0, x -> f(c) + fp(c)*(x-c)], .5, 2.1) 
```

<hr/>

```
note("More generally ...")
```


We could have defined `intersection_point` to accept a
function with:

```
intersection_point(f, c) = c  - f(c)/Dc(f)(c)
```

Then it could easily be reused for other problems.



### Practice

#### question

Let 

```
f(x) = besselj(1, x)
```

This defines $f$ as a Bessel function of the first kind with order
$\alpha=1$. Plot the approximate derivative over the interval $[0,5]$. There is
one zero. What is its approximate value:

```
using Roots
val = fzero(Dc(f), [0,5])
numericq(val, 1e-1)
```




#### question

Let $f(x) = \sin(\cos(x))$. Plot the approximate derivative of
$f$. How many zeros are there between $5$ and $20$?

```
ans=5
numericq(ans, 1e-10)
```

#### question

Let $f(x) = |x^2 - 2|$. Plot the derivative of $f(x)$ over the
interval $[-2,2]$. How many critical points do you see? (A critical
point is where the derivative is $0$ *or* undefined.)

```
ans = 3
numericq(ans, 1e-10)
```




## Automatic differentiation


We discuss now [Forward Mode Automatic Differentiation](http://en.wikipedia.org/wiki/Automatic_differentiation). 



Automatic differentiation avoids the numeric instability issues of
finite differences by using a different approach. Whereas finite
differences have a long history, automatic differentiation only dates
back to the 60s.

The `Roots` package provides an operator `D` that (essentially)
implements this. It is used like our previously defined `Df` and `Dc`
functions, only it need not be redefined each `julia` session -- just
the `Roots` package need be loaded. 





Unlike, finite differences automatic differentiation does not have
issues arising from the loss of precision encountered when subtracting
two like-sized numbers. Unlike symbolic derivatives (such as those
found by the Wolfram Alpha website used by your iPhone's Siri) they
can be computed quickly, even if the computations defining the
function involve many steps.


So what is automatic differentiation? The idea of the forward mode is
quite intuitive. The *tangent line* approximation of a function at the
point $c$ becomes

$$~
f(x) = f(c) + f'( c)(x-c) + O((x-c)^2)
~$$

Where the notation $O(x-c)^2$ means that the last term is not precisely spelled out, but is like some constant times the difference $(x-c)^2$. This has many applications, but for this one it reduces the knowledge of the function values at this level to two values $(f(c), f'(c))$

Now consider the product of two functions $f(x)$ and $g(x)$? The above formula applied to $f \cdot g$ is:

$$~
(f\cdot g)(x) = f(c) \cdot g(c) + (f'( c)g( c) + f( c)g'( c))(x-c) + O((x-c)^2)
~$$

This follows by the product rule. Again we have that two values
determine the product $f\cdot g$ at this level, these being $(f(c)
\cdot g(c)$, and $f'( c)g( c) + f( c)g'( c)$. *But*, this combination
can be made from the values $(f(c), f'(c))$ and $(g(c), g'(c))$ which
represent $f$ and $g$. Hence it is enough to know the two values for
$f$ and $g$ to compute the two values for $f\cdot g$.

In fact, the rules of derivatives allow us to say the same for addition, subtraction, multiplication, division, powers *and* composition. For composition this is from the chain rule:

$$~
(f \circ g)(x) = (f \circ g)(c) + f'( g(c)) g'(c) (x-c) + O((x-c)^2).
~$$


Automatic differentiation can be implemented by extending how we store
a value, storing both $(x, dx)$ as above.  With this, the rules of
differentials inform us how we combine these values. For example:

* $(x, dx) + (y, dy) = (x + y, d(x+y)) = (x + y, 1dx +  1dy)$

* $(x, dx) \cdot (y, dy) = (xy, d(xy)) = (xy, y dx + x dy)$

* $(x, dx)^n = (x^n, d(x^n)) = (x^n, n x^{n-1} dx)$

etc.

For functions we need to use the chain rule:

* $f((x, dx)) = (f(x), d(f(x))) = (f(x), f'(x) dx )$


### The `D` operator

The `Roots` package provides the `D` operator that implements automatic differentiation using the underlying `ForwardDiff` package. Here we see it used:

```
using Roots			# where the D function is found
f(x) = sin(x)
fp(x) = D(f)(x)			# create a function that is the derivative of f
fp(pi)				# basically cos(pi)
```

The advantage over `Df` and `Dc` is greater accuracy, and as mentioned
it is built in to a package. (Though the `Calculus` package has
forward difference built-in to it, so this last point not too
compelling.) The disadvantage? It will only work for *most*
functions. That is, functions composed of our basic elementary
operations, such as powers; trigonometric; exponential; and
logarithmic functions.




Here we see that plotting a function and its derivative is straightforward:

```
f(x) = exp(-x)*sin(x)
plot([f, D(f)], 0, 2pi)
```

The `D` operator allows for a second argument to specify the number of
derivatives, as in `D(f, 2)` to find the second derivative. 
```
f(x) = x^2 - 2x
plot([f, D(f), D2(f)], -2, 2)
```

```
alert("""
Be warned, higher order derivatives of degree 8 or more require extra attention.
""")
```

```
note("Simplifying the notation by overriding a definition")
```

We can simplify the notation involved with using `D` if we define the following:

```
Base.ctranspose(f::Function) = D(f)
```

At the cost of a warning (as we are overriding some other defintion) we can now use the "prime" notatin for derivatives:

```
f'(10), f''(10)
```






Here is an example where we plot the tangent line and the
function. We first define a tangent line operator that returns a
function representing the tangent line at a point `c`:

```
tangent(f, c) = x -> f(c) + f'(c)*(x-c)
```

Then this is employed as follows:

```
f(x) = x^x
c = 1
plot([f, tangent(f, c)], 1/2, 2)
```

<hr/>

```

example("""
AP Calculus question
""")

```

The 2014 AP Calculus exam included this question:

Grass clippings are placed in a bin, where they decompose. For
$0 \leq t \leq 30$, the amount of grass clippings remaining in the bin is
modeled by $A(t) = 6.687(0.931)^t$. Where $A(t)$ is measured in pounds
and $t$ is measured in days.

* Find the average rate of change of $A(t)$ over the interval of
  $0 \leq t \leq 30$. Indicate units of measure.

* Find the value of $A'(15)$. Using correct units, interpret the
  meaning of the value in the context of the problem.

* Find the time $t$ for which the amount of grass clippings in the bin
  is equal to the average amount of grass clippings in the bin over
  the interval $0 \leq t \leq 30$.

* For $t > 30$, $L(t)$, the linear approximation to $A$ at $t=30$ is a
  better model for the amount of grass clippings remaining in the
  bin. Use $L(t)$ to predict the time at which there will be $0.5%
  pound of grass clippings remaining in the bin. Show the work that
  leads to your answer.


We can do all this relatively quickly with `D` and the `fzero` function from the `Roots` package.

First, we define $A(t)$:

```
A(t) = 6.687(0.931)^t
```

The first question is answered by the slope of the secant line connecting $(0,A(0))$ and $(30, A(30))$:

```
m = (A(30) - A(0)) / (30 - 0)
```

The units are in pounds per day.

The second question is done with `D` as follows:

```
A'(15)
```

This also has units in pounds per day. This is the instantaneous rate
of decomposition, and is less (in absolute value) than the average
decay rate.

The mean value theorem tells us that there is at least one time where
the instantaneous decomposition rate equals the average rate over the
interval $[0,30]$. Thus the endpoints form a bracketing interval for
the equation $A'(t) = m$, which we solve with:

```
fzero(t -> A'(t) - m, [0, 30])
```

So at 12.4 days, the instantaneous rate is equal to the average rate
of decomposition over the first 30 days.

But this doesn't really answer the question asked, which is about the
average amount of grass clippings in the bin. For this we need the
integral form of the mean value theorem. Skipping ahead a few lessons to solve this problem, we have:

```
a, err = quadgk(A, 0, 30)	# area under A from 0,30
avg = a/(30-0)
fzero(t -> A(t) - avg, [0, 30])
```

We get the same answer -- think about whether that is a coincidence.



Finally, we can define $L(t)$ using the point-slope form of the line. The point is $(30, A(30))$ and the slope is $A'(30)$:

```
L(t) = A(30) + A'(30) * (t - 30) # t > 30
```

We could restrict $L$ to insist that $t > 30$, but this isn't necessary. We are asked to solve this. Using `fzero` requires a bracket. We check that $L(30) > 0.5$ and that $L(100)$ is negative:


```
L(30), L(100)
```

So, we can use $[30, 100]$ as a bracket for $L(t) - 0.5 = 0$:

```
fzero(t -> L(t) - 0.5, [30, 100])
```


So a bit over 35 days to decompose to half a pound.


Here is a picture, showing the decay:

```
f(t) = t <= 30 ? A(t) : L(t)
plot(f, 0, 40)
```


### Practice

#### question

Which definition would be right for  $(x,dx) - (y, dy)$?

```
choices = [
"`(x - y, dx - y)`",
"`(x-y, dx - dy)`",
"`(x - dx, y -dy)`"
];
ans = 2;
radioq(choices, ans)
```





#### question (Find tangent line intersection)

Redefine `intersection_point` as:

```
intersection_point(f, c) = c - f(c)/f'(c)
```

Now for $f(x) = 10/(1+x^2) - 10 \cdot \exp(-(1/2) \cdot x^2)$ and $c=1$ find the
intersection point.

```
val = 2;
numericq(val, 1e-4)
```

#### question (What is the size of the error?)

We can compare the error at many different points with the following construct

```verbatim
f(x) = exp(-x)*sin(x)
fp(x) = exp(-x)*(cos(x) - sin(x))
[abs(f'(x) - fp(x) ) for x in linspace(0, pi, 25)]
```

What is the order (exponent) of the largest difference above?

```
choices = [
"`1e-10`",
"`1e-14`",
"`1e-17`"
];
ans = 3;
radioq(choices, ans)
```




## Error analysis

We end with a digression on how big `h` should be to have the approximate derivatives as close as can be.


The choice of $h$ in the derivative approximations above was done
somewhat arbitrarily, with only the intuition that smaller $h$'s
should produce more accurate approximations (which of course may be
way off, as we are subtracting like-sized values in the derivative
formula). Here we look a bit more closely at how to choose $h$.


As mentioned, with a bit of work from the second semester of calculus
one can learn that the *mathematical error* in the forward difference
is "order $h$" whereas the mathematical error in the central
difference is "order $h^2$. This means that as $h$ gets small the
approximation error in the first is a multple of $h$, but for the
second a multiple of $h^2$ -- a much smaller error in general.

However there is also error due to *floating point approximation*. Such
error is different in that it gets bigger as $h$ gets smaller. So one
error gets bigger, the other gets smaller. So clearly if $h$ gets too
small, the floating point error will dominate and the overall error
will not get smaller, rather larger.

So, how big is the floating point error? For any given number, it can
be roughly as big as the the machine precision amount, $\epsilon$. So in the
forward-difference approximation we could have errors in both
terms $f(x+h)$ and $f(x)$ so the total error could be as big as
$2\epsilon$. But this is divided by $h$ as we have:

$$~
\frac{f(x+h) - f(x)}{h} = \frac{float(x +h) + \epsilon - float(x) + \epsilon}{h} = 
	     \frac{float(x+h)-float(x)}{h} + \frac{2\epsilon}{h}.
~$$

The errors may or *may not* cancel so the algebra with $\epsilon$ is unusual to
the untrained eye. It basically takes into account the worse case.

The key is the $2\epsilon/h$ term -- it gets bigger as $h$ gets smaller.

So if each floating point approximation is no more off than
$\epsilon$, we have this bound on the error:

$$~
\text{error} \leq \frac{2\epsilon}{h} + (M/2)h
~$$

Where $M$ is a constant that depends on the maximum absolute value of the
second derivative and the $1/2$ comes from second semester
calculus. Choosing $h$ to make this as small as possible is possible
with some calculus involving the derivative, but for now we simply
note the answer is $h=((2\epsilon)/(M/2))^{1/2}$.

Taking $\epsilon$ as machine tolerance and (conveniently) $M=1$ we get

$$~
h_{min} = \sqrt((2\epsilon)/(1/2)) \approx 10^{-8}
~$$

Or more precisely:

```
sqrt( (2*eps())/(1/2) )
```

We can check this is about right,but graphing on a different scale:

```
f(h; M=1) = 2*eps()/h + (M/2)*h
g(x) = log10(f(10.0^(-x)))
plot(g, 1, 10)			# min near 8, which means h like 1e-8
```




Numerically, we can check how this basically works for some test function:

```
f(x) = exp(x) - x^3
fp(x) = exp(x) - 3x^2
[hs [Df(f,h=h)(.5) - fp(.5) for h in hs] ]
```

We see the best case is around $h=10^{-8}$, as expected by the theory.

### Approximation errors for the central difference

For the central difference, the errors are different. The error in $h$ becomes:

$$~
\text{error} \leq (2\epsilon)/(2h) + (M/6) h^2
~$$


This gives $(3\epsilon/M)^{1/3}$ as the choice for $h$ that minimizes the right-hand expression.

Taking $\epsilon$ as the machine tolerance and (conveniently) $M=3$ we get

$$~
h_{min} \approx 10^{-6}
~$$

We can again check how this works for our function and point:

```
[hs [ Dc(f,h=h)(.5) - fp(.5) for h in hs] ]
```

### Practice

#### question (Best depends on the function and value)

A subtle point above is that we are minimizing an upper bound in $h$
with an assumption, not the actual error. The actual answer may differ
as it depends on a function and the point of evaluation. Look at the
function $f(x) = x^2 - 2x$ and compare the values at $0.5$ as
above:

```
hs = [(1/10)^i for i in 1:16]
f(x) = x^2 - 2x
fp(x) = 2x - 2
[hs [Dc(f,h=h)(.5) - fp(.5) for h in hs] ]
```


What is the best value of $h$?

For which of these values of $h$ is the error smallest?

```
choices = [
"`1e-3`",
"`1e-6`",
"`1e-8`",
"`1e-12`"
];
ans = 1;
radioq(choices, ans)
```



#### question (Error analysis)

Consider these commands:

```noout
f(x) = sin(x)
fp(x) = cos(x)
[hs [ Dc(f,h=h)(.5) - fp(.5) for h in hs] ]
```
Do they show the smallest error around $10^{-6}$ as expected?

```
booleanq(true)
```


