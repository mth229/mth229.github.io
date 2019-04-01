# Symbolic math with julia

## Introduction


The `julia` language bills itself as "fresh approach to technical
computing." By saying "fresh" the implication is that there exists
many older approaches to technical computing. Indeed there are. For
mathematical areas there are three different philosophies for
computing: symbolic, numeric, and general purpose. The symbolic
approach is the domain of Computer Algebra Systems (CAS), and is
exemplified by very comprehensive programs like `Mathematica`, `Maple`,
and the open-source alternative `Sage`.  The numeric approach is the
domain of tailored programming languages such as `MATLAB` and `R`. A
general purpose approach would be to leverage a widely used
programming language, such as `Python` or `Haskell`, for a specific
use.  The `julia` language is an alternative approach to `MATLAB` or
`R` for numerical computation.

One strength of `julia` is how well it plays with others. This is
leveraged in the `SymPy` package for `julia` to provide a symbolic
math interface through a connection to `Python` and its SymPy
library via `julia`'s `PyCall` package. We see in this project how this
additional functionality affords an alternative approach to performing
calculus problems.



The `SymPy` package for `julia` is an add on, it is loaded into a session with the command

```
using SymPy  # also loaed with the MTH229 package
```

If the package is not already installed, it can be installed through
the command

```verbatim
Pkg.add("SymPy")
```

The package itself requires a version of `Python` that works with
`julia`'s `PyCall` package *and* a version of sympy installed for
`Python`.



## About

The `SymPy` program extends `julia` by providing a type for *symbolic
expressions*. Such an expression is encapsulated by a symbolic
variable `x` instantiated through:

```
using SymPy
x = Sym("x")
```


The "x" on the right-hand side is a character argument to the `Sym`
constructor which returns a symbolic object stored as `x`:

```
x |> typeof
```


That was painless. The type is `Sym`.



```
alert("""

We use the pipeline operator `|>` to compose functions in this project, as it makes the expressions a bit easier to read. That above would be simply `typeof(x)` so there is no advantage in clarity, but there is elsewhere.

""")
```


The `@vars` macro can simplify variable creation:

```verbatim
@vars a b c
```

The `symbols` function can place assumptions on the created variables and create more than one at a time:

```
h, y = symbols("h, y", real=true)
```




Most of the typical math functions have been overloaded to work with
these symbolic expressions: the functions accept a symbolic expression
and return a newly computed one. For example, the expression `x^2 -2x
+2` when evaluated becomes a new symbolic expression:

```
x^2 - 2x + 2 |> typeof
```

Similarly, when working with mathematical functions a symbolic expression is returned:

```
f(x) = exp(-x^2/2)             ## a julia function
f(x)                           ## takes a symbolic object and returns a new one
```

This shows that the function object `f` will map a symbolic object to
another symbolic object.

In `SymPy`, the `subs` function allows you to evaluate a symbolic
expression for a given value. For example,

```
subs(f(x), x, 1)		## set x equal to 1
```

The natural "call" notation for functions can also be used for substitution:

```
ex = exp(-x^2/2)  # a symbolic expression, not a function
ex(1)
```

This works well when there is just one variable involved. Otherwise, the `=>` notation is useful to indicate which value is being substituted for, as with:

```
ex(x=>1)
```


The output of `subs` is still a symbolic object.  The `N` function will convert the value to a `julia`n one:

```
N(ex(1))
```


For the most part, one can work with symbolic expressions without
pulling them back into `julia` expressions until needed.




## Equations

`SymPy` can do much of the basic tasks learned during algebra:
simplification, factoring and solving equations. Just a few new
commands are needed.

### Basic algebra

`SymPy` does some automatic simplification of expressions. For example, terms are combined

```
(x+1) + (x+2) + (x+3)
```

However, not everything is as simplified as possible. The `simplify` function can be called to (sometimes) go further:

```
sin(x)^2 + cos(x)^2		# not simplified
```

```
simplify(sin(x)^2 + cos(x)^2)	# 1
```

One can `factor` polynomials:

```
factor(x^2 + 2x + 1)
```

`SymPy` will leave terms in factored form. To multiply them out can
be requested through the function `expand`:

```
expand( (x+1)*(x+2)*(x+3) )
```







### Solving equations

With `SymPy` there are *several* ways to solve an equation. Here we mention `factor`, `roots`, `real_roots`, `solve`, *and* `nsolve`.

First for *polynomial* (or rational) functions, we can factor:

```
p = expand((x-1)*(x-2)*(x-3)*(x^2 + x + 1))
```

```
factor(p)
```

From this we can see clearly the linear terms correspond to roots. The
`roots` function returns a dictionary of roots and their
multiplicities.

```
roots(p)
```

If the multiplicities are not of interest, we can get just the keys different ways, here is one:

```
Sym[k for (k,v) in roots(p)]
```

In this case there are two complex roots as well, that `factor` leaves
alone.  Factoring reduces over the rational numbers -- not the real
numbers (the domain can be adjusted). For example, this quadratic will
not be factored, even though the answers are real:

```
q = x^2 - 8x + 8
factor(q)
```


However, `roots` will work

```
roots(q)
```



The basic theorem is that for each linear factor over the complex
numbers there corresponds a root and vice versa after accounting for
multiplicity.



The `real_roots` function tries to return the real roots (omitting the
non-real roots). Here we see that it fails for some
polynomials when `roots` does not:

```
q = x^4 - 8x^2 + 8
real_roots(q)			# should find 4
```

("Fails" is unfair, the above does actually find the roots, just not
symbolically. Just call `N` on the output to get numeric
approximations, as with `N(real_roots(q))`.)

The `solve` function is used to solve an equation of the type `expr = 0` for a variable.
The above `q` can be solved:

```
solve(q)
```

If it isn't clear which of these are real, they can be converted to numeric values via `N`:

```
as = solve(q)
N.(as)			# all are real
```

One could also try converting to complex (`complex(as)`) and seeing which have `0.0im` for an imaginary part.


The `solve` function solves for when an expression is 0. Sometimes, the problem is to find when `f(x) = g(x)`, for example, `2x^2 = exp(x)`. Here we see:

```
solve(exp(x) - 2x^2, x)
```


We could also have used `nsolve`, a numeric solver. The second zero
above can be found with `nsolve`, which is a numeric algorithm to find
a zero starting with an initial guess (which often comes from making a
simple plot):

```
nsolve(exp(x) - 2x^2, x, 3)	# 2.617...
```


Trigonometric functions have infinitely many solutions, with the `sin`
function `SymPy` solves only within the range $[-90, 90]$ degrees (the range of the `asin` function).

```
solve(sin(x)^2 - (1//2)^2) * 180 / pi
```

SymPy introduced the `solveset` function for such scenarios. The answer now will be an infinite set, suitably described.



To solve an expression in another variable, we specify it through the second argument:

```
out = solve(x^2 + y^2 - 1, y)
```


This returns a vector of two symbolic answers, as the expression being
solved is a quadratic.  We can then evaluate these two values at a
point, say $x=1/2$, as before:

```
subs.(out, x, 1//2)
```

You can even do systems of equations. For this you specify the system and the variables to solve for using a vector:

```
@vars x y
eq1 = x + y -1
eq2 = x - y - (-1)
solve([eq1, eq2], [x,y])
```



### Practice

#### Question

What is the coefficient of $x^3$ in $(x-1)(x-2)(x-3)(x-4)(x-5)$?

```
@vars x
p = (x-1)*(x-2)*(x-3)*(x-4)*(x-5)
val = sympy.Poly(p, x).coeffs()[3]
numericq(N(val))
```

### Question <small>Horner's method</small>

Expand $(((1x + 2)x + 3)x + 4)$. What do you get?

```
choices = ["4x^3 + 3x^2 + 2x + 1",
	"1x^3 + 2x^2 + 3x + 4",
	"(1+2+3+4)x"];
ans = 2;
radioq(choices, ans)
```

(Horner's method is an alternate way of evaluating $a_n x^n +
a_{n-1}x^{n-1} + \cdots a_1 x + a_0$ expressed in terms of the
coefficients, which are 1,2,3,4 in the example.)

#### Question

Find the largest root of $x^3 - 6x^2 + 11x - 6$.

```
x = Sym("x");
rts = N(real_roots(x^3 - 6x^2 + 11x -6))
val = maximum(rts);
numericq(val, 1e-2)
```

#### Question

```
ImageFile("figures/symbolic/symbolic-findx.jpg")
```

Solve for $x$ using `solve(x^2 - (3^2 + 4^2))` not the picture. What do you get

```
choices = ["Same as the picture",
	"two answers -5 and 5",
	"The value 5"];
ans=2;
radioq(choices, ans)
```


#### Question

The Soviet historian I. Y. Depman claimed that in 1486,
Spanish mathematician Valmes was burned at the stake for claiming to
have solved the [quartic
equation](https://en.wikipedia.org/wiki/Quartic_function). Here we
don't face such consequences.

Find the largest root of $x^4 - 10x^3 + 32x^2 - 38x + 15$.

```
ans = solve(x^4 - 10x^3 + 32x^2 - 38x + 15);
val = maximum(N(ans));
numericq(val)
```

#### Question

Solve $e^x = x^4$ using `SymPy`. (You will need to convert to numeric with `N`.) What is the smallest value?

```
val = minimum(N.(solve(exp(x) - x^4)))
numericq(val, 1e-2)
```

## Graphing expressions

Plotting a symbolic expression is done by coercing the expression into
a function. For simple plots, this happens behind the scenes:

```
using Plots
ex = x^2 - 2x + 4
plot(ex, -1, 3)          # plot of a symbolic expression
```

This is similar to how functions can be used as well. The following is similar, but different:

```
f(x) = x^2 - 2x + 4
plot(f, -1, 3)           # plot of a function object
```


Graphing more than one expression at a time is, of course, possible. For
example, to graph a function and its tangent line at a point we can do
this.

```
f(x) = sqrt(x);
c = 2;
fp = diff(f(x));		# diff finds derivative, fp an expression (not function)
m = fp(x=>c)	        # at c=2
plot(f(x), 1, 3)
plot!(f(c) + m * (x - c))
```

### Practice

#### Question

Plot the expression `x^4 - 3x^3 + 3x^2 - 3x +2` over $[-1, 3]$. How many real roots are there?

```
val = real_roots(x^4 - 3x^3 + 3x^2 - 3x +2) |> length;
numericq(val)
```


## Limits


The `Limit` function can find the limit of an expression. Let's see how well it does. The basic question

$$~
\lim_{x \rightarrow c} f(x) = L
~$$

has three inputs: A function the limit is being taken of, a dummy
variable $x$, and a value where the limit is taken, $c$. The output is
the limit, when it exists. The `limit` function is similar. Here we
find an old classic:

```
limit(sin(x)/x, x, 0)
```


We can do other similar questions:

```
limit((1-cos(x))/x^2, x, 0)
```

The second argument is needed, as the expression may have more than one variable:

```
lambda = symbols("lambda")
limit((1 - lambda *x)^(1/x), x, 0)
```


Limits can be taken at infinity as well. We can specify infinity using
`oo`:

```
limit(sin(x)/x, x, oo)
```

We can even compute derivatives using limits. Here we do so symbolically:

```
h = Sym("h")
f(x) = x^10
limit( (f(x+h) - f(x))/h, h, 0)
```

We can see that some of the more complicated formulas for derivatives
give the same answer. Here we see the central difference gives the
same answer:

```
central_difference(f, x, h) = ( f(x+h) - f(x-h) ) / (2h)
a = limit(central_difference(f, x, h), h, 0)
```

Even this more complicated expression works as expected:

```
central_4th_difference(f, x, h) = (-f(x + 2h) + 8f(x+h) - 8f(x-h) + f(x-2h))/(12h)
limit(central_4th_difference(f, x, h), h, 0)
```

This limit matches the chain rule:

```
g(x) = sin(x)
limit( (f(g(x+h)) - f(g(x)))/h, h, 0) |> subs(x, 1)
```


### Practice

#### Question

Find

$$~
\lim_{x \rightarrow 4} \frac{(3 - \sqrt(x + 5))}{(x-4)}
~$$

```
val = limit((3 - sqrt(x + 5))/(x-4), x, 4) |> float;
numericq(val)
```

#### Question

Compute

$$~
\lim_{x \rightarrow 1} \frac{x^{1/4} - 1}{x^{1/3} - 1}.
~$$


```
val = limit((x^(1/4)-1)/(x^(1/3)-1), x, 1) |> float;
numericq(val)
```


#### Question

At [math overflow](http://mathoverflow.net/questions/51685/how-did-bernoulli-prove-lh%C3%B4pitals-rule) we learn that L'Hopital was motivated by the following limit:

$$~
\lim_{x \rightarrow a} \frac{(2a^3x-x^4)^(1/2) - a (a^2x)^(1/3)}{a - (ax^3)^(1/4)}
~$$

What did he find (with the help of a Bernoulli)?

You need to inform `SymPy` that $a > 0$. The following is a good start (though it is complicated enough the output is mis-formatted):

```
x = Sym("x")
a = symbols("a", positive=true)
top = (2a^3*x-x^4)^(1//2) - a *(a^2*x)^(1//3) # rationals are converted exactly to SymPy
bottom =  a - (a*x^3)^(1//4)
ex = top/bottom
```

Now find the limit.

```
choices = [L"16a/9", L"0", L"9\sqrt{a}", "Does not exist"]
ans = 1
radioq(choices, ans)
```


#### Question


Define a symbolic variable `h` and let $f(x) = \sin(x)$:

```
@vars h
f(x) = sin(x);
```

Compute the following:

$$~
\lim_{h->0} \frac{f(x+h) - 2f(x) + f(x-h)}{h^2}
~$$

Based on your answer, what do you think the above expression finds for any `f`?

```
choices = ["`f'(x)`", "`f''(x)`", "`f'''(x)`"];
ans = 2;
radioq(choices, ans, keep_order=true)
```


#### Question

Define a symbolic quantity `a`. Compute the limit

$$~
\lim_{x \rightarrow 0} \frac{\cos(ax) - 1}{\cos(x) - 1}
~$$

What is the answer?

```
choices = ["1",
	   "a",
	   "a^2",
	   "No limit exists"];
ans = 3;
radioq(choices, ans, keep_order=true)
```


#### Question

Let

```
f(x) = 1/(x^(log(log(log(log((1/x)))))-1))
```

We can investigate the limit $\lim_{x \rightarrow 0} f(x)$ numerically:

```
xs = (0.1).^(2:10);
fxs = map(f, xs);
[xs fxs]
```


It looks like the limit is $0$. What does `limit` compute for the *real* answer?

```
choices = ["`0`",
	"`1`",
	"`e = 2.7182818284590455`",
	"`Inf`"];
ans=4;
radioq(choices, ans)
```

(This is an example in [Gruntz's thesis](http://www.cybertester.com/data/gruntz.pdf) from which `SymPy`'s `limit` function is based upon.)


#### Question

Let

```
f(x) = log(log(x*exp(x*exp(x)) + 1)) - exp(exp(log(log(x)) + 1/x))
```

This function has a limit at $\infty$. It can't be found numerically
though (well, not easily). You can verify this by trying to evaluate
the function at $10$, let alone for really large values. However, it
can be computed symbolically. What is the answer?

```
val = 0;
numericq(val, 1e-8)
```

(Again, this is from Gruntz.)

## Derivatives

We just saw we can take derivatives with a limit, though just as with
pen and paper, it is better to use the rules of derivatives.  These
rules are implemented by the `diff` operator, which takes a symbolic
expression, a variable to differentiate in (the default is `x`) and an
optional integer for the number of derivatives and returns a symbolic
derivative.

For example

```
f(x) = exp(exp(x))
diff(f(x))		       ## not f, but the symbolic expression f(x)
```


```
diff(f(x), x)                  ## optional x is necessary if other symbols involved
```

```
diff(f(x), x, 2)               ## Finds f''(x), not f'(2).
```


Here we find and plot the derivative of $x^x$ avoiding the asymptote at $x=0$.

```
f(x) = x^x
plot(diff(f(x)), 1/10, 2)
```

Here we plot $f(x)$ and it's tangent line at $c=1$:

```
f(x) = x^x; c = 1
m = diff(f(x)) |> subs(x, c);
plot(f, 0.5, 1.5)
plot!(f(c) + m*(x-c))
```

### Extrema

We can combine `solve` with `diff` to find extrema of a differentiable
function over a closed interval, by locating the critical points where $f'(x) = 0$.

For example, consider the problem enclosing the maximum amount of area
with 3 sides of a rectangle where the length of the 3 sides is fixed.

For this, we have

$$~
L = 2x + y, \quad A = xy, \quad\text{or}\quad A(x) = x \cdot (L-2x)
~$$

We can solve this with $L$ as a symbolic value, by looking at critical
points of $A$ or when $A'(x) = 0$:

```
L = Sym("L")
A = x*y
A = A(y => L - 2x)
out = solve(diff(A, x), x)[1]	## solve returns an array, we need its first component
subs(L - 2x, x, out)
```

This shows that  $y = L/2$. So solve for $x$ we have

```
solve(L/2 - (L - 2x), x)
```

### Practice

Find the derivative of $\tan^{-1}(x)$. What do you get?

```
choices = jprint(map(diff, [asin(x), atan(x), log(x)]));
ans = 2;
radioq(choices, ans)
```



#### Questions

Let $f(x) = \exp(-\cos(x))$. Evaluate $f'(3)$. (You'll need to
`subs`titute 3 for `x` and convert to floating point.)

```
f(x) = exp(-cos(x))
val = subs(diff(f(x)), x, 3) |> float
numericq(val)
```


#### Questions

Find the single critical point of $f(x) = 1/x^2 + x^3$.

```
f(x) = 1/x^2 + x^3
@vars x
val = nsolve(diff(f(x)), 1);
numericq(N(val), 1e-2)
```

#### Question

Let $f(x) = \tan(x)$. Newton's method finds the zero of the tangent
line $f(c) + f'(c)(x-c)$. You can do this with `julia` via:

```
@vars c
f(x) = tan(x)
solve(f(c) + diff(f(c)) * (x - c), x)
```

What do you get when $c = \pi/4$?

```
ex =solve(f(c) + diff(f(c)) * (x - c), x)[1];
val = subs(ex, c, pi/4) |> float;
numericq(val, 1e-3)
```

#### Question

You have a 12-inch wide rectangular piece of metal that you will fold
into three 4 inch strips in a symmetric manner. Let $\theta$ be the
amount each wing is folded up ($\theta \in [0, 90^\circ]$). What value of
$\theta$ will produce the larges cross sectional area?

The area as a function of $\theta$ is that of two right triangles with hypotenuse $4$ and height given by $h/4 = \sin(\theta)$ and base given by $b/4 = \cos(\theta)$. The total area then is:

$$~
A(\theta) = 2 \cdot (1/2) \cdot 4\sin(\theta) \cdot 4 \cos(\theta) + 4 \cdot 4\sin(\theta)
~$$

In degrees, what angle maximizes the area?

```
ans =  49.6569
numericq(ans, 1e-2)
```


## Integration

The `SymPy` program can do symbolic integration, though it is not as
effective at it, as say `Mathematica`, it can do many things. The
standard function is `integrate`.

One can find general antiderivatives:

```
@vars x a
f(x) = cos(x) - sin(x)
integrate(f(x), x)
```

One can parameterize an integral using a constant:

```
integrate(1/cos(x + a), x)
```

Integrate can do many of the integrals thrown at it.

```
integrate(x^3 * (1-x)^4, x)
```

```
integrate(x/(x^2+1), x)
```



### Definite integrals

By specifying a range to integrate over, the definite integral
$\int_a^b f(x) dx$ can be found.

```
integrate(x^2, (x, 0, 1))
```


More interestingly, we can find the median value of an integral by
solving with the  resulting symbolic answer from `integrate`:

```
f(x) = 4x^3
@vars b
eq = integrate(f(x), (x,  0, b)) - 1/2 * integrate(f(x), (x, 0, 1))
xs = real_roots(eq, b)
```

The equation `eq` is a 4th degree polynomial. It has two real and two complex roots. We used `real_roots` to get the two real ones. The positive one is clear.

### Practice

#### Question

Integrate $f(x) = 2/(x \cdot \log(x))$. What do you get:

```
choices = jprint(map(integrate, [3/x, 3/x*log(x), 1/(x*log(x)), 3/(x*log(x))]))	;
ans = 3;
radioq(choices, ans, keep_order=true)
```

#### Question

Integrate $f(x) = (2x+5)(x^2 + 5x)^7$ from $0$ to $1$.

```
f(x) = (2x+5) * (x^2 + 5x)^7
val = integrate(f(x), (x, 0, 1)) |> float;
numericq(val, 1e-3)
```

#### Questions

Integrate `f(x) = sqrt(4 - sqrt(x))` over $[0,9]$. What value do you get? Does it make any sense?

```
choices = ["12.5333, and yes it makes sense.",
	"-8.884, and no it makes no sense as f(x) > 0, but the integral is negative",
 	"Inf, and yes it makes sense as the vertical asymptote at 0 makes this a problem integral."];
ans=2;
radioq(choices, ans)
```



## Applications

We present some applications of symbolic math

### Tangent lines and parabolas

An interesting fact about parabolas: any two different tangent lines will intersect at the midvalue.

That is the tangent line at $a$ and that at $b$ will intersect at $(a+b)/2$.


A graph might be illuminating:

```
f(x) = x^2			# simplest parabola
a,b = -3, 1
tl(c) = x -> f(c) + 2*c*(x-c)
plot(f, a, b)
plot!(tl(a))
plot!(tl(b))
```

The intersection point is clearly $c=-1 = (a+b)/2$.





Let's see if we can get this fact using `SymPy`. First we define many variables:

```
x, c2, c1, c0, a, b =  symbols("x, c2, c1, c0, a, b")
p = c2*x^2 + c1*x + c0
```

Then we create values for the tangent lines at `a` and `b`

```
fa, fb = [subs(p, x, c) for c in [a,b]]
ma, mb = [subs(diff(p, x), x, c) for c in [a,b]]
tla = fa + ma*(x-a)
tlb = fb + mb*(x-b)
```

Finally, we solve for the intersection:

```
solve(tla - tlb, x)
```


### Maximization in two variables

For simple ballistic motion, we "know" that launching the projectile at 45 degrees will yield the optimal distance. Let's see that it is the case. We'll start with the equation of motion

$$~
y(x) = \tan(\theta) x - (1/2) \cdot g(\frac{x}{v_0 \cos\theta})^2.
~$$

This is valid for $\theta \in [0,\pi/2]$ and for $x \in [0, x^*]$,
where $x^*$ is when the projectile returns to ground, that is $y(x*) =
0$.

We code this expression with:


```
x, theta, v0, grav =  symbols("x, theta, v0, grav")
y = tan(theta) * x - (1//2)*grav*(x / (v0*cos(theta)))^2
```

The use of the rational value for $1/2$ (the `1//2`) is needed, as
this will convert to a symbolic value of $1/2$, and not a floating
point value of $0.5$.

First we need to solve when `y(x)=0`:

```
xs = solve(y, x)
```

There are, of course, two values. The first is 0, the starting point. We want the latter:

```
xstar = xs[2]
```

Now, we want to find the critical point for `xstar`. We take the
derivative with respect to `theta` and solve for when that is 0:

```
solve(diff(xstar, theta), theta)
```


The value of $3\pi/4$ is clearly, wrong (it shoots in the opposite direction). We get $\pi/4$ as expected.


### More on tangent lines

For parabolas, we just saw that the tangent lines intersect in the
midpoint. Let $c$ be that midpoint. That's not the only fact about
that picture that is true for parabolas. For a given parabola, the
area between the parabola and the tangent lines over $[a,c]$ equals
that over $[c,b]$ and the total area over $[a,b]$ depends only on
$|b-a|$ and not the position of either. Can we demonstrate that?

We start with the same setup to create the tangent lines as symbolic
expressions

```
x, c2, c1, c0, a, b = symbols("x, c2, c1, c0, a, b")
p = c2*x^2 + c1*x + c0
fa, fb = [subs(p, x, c) for c in [a,b]]
ma, mb = [subs(diff(p, x), x, c) for c in [a,b]]
tla = fa + ma*(x-a)
tlb = fb + mb*(x-b)
```

We need to solve for the intersection point:

```
c = solve(tla - tlb, x)[1]	# only one solution
```

Then the areas are:

```
area_ac = integrate(p - tla, (x, a, c))
area_cb = integrate(p - tlb, (x, c, b))
area_ac, area_cb
```


Okay, are they equal?

```
area_ac - area_cb
```

Hard to tell. Maybe we need to simplify:

```
simplify(area_ac - area_cb)
```

Ahh, 0, as expected.

Now, is the sum only dependent on the distance -- and not the values?

```
simplify(area_ac + area_cb)
```

Hard to tell, we also factor:

```
simplify(area_ac + area_cb) |> factor
```

We see in fact, that it only depends on the distance (`b-a`) and the
value of `c2`, the quadratic term, and not the linear or constant
term.
