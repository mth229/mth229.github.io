## This seemed a bit hard??

#### Question

Rewriting: Substitution

According to Strang
(http://ocw.mit.edu/resources/res-18-001-calculus-online-textbook-spring-2005/textbook/MITRES_18_001_strang_5558.pdf)
integration routines on calculators did some tricks to make difficult
integrals easier. He gives the example of integrating $f(x) =
1/\sqrt{x}$ over the interval $[0,1]$, with known answer 2. This is an
improper integral as $f(x)$ diverges as $x$ goes to 0. In practice, we
can avoid this issue by using the right Riemann sums, as this integral
does exist.

Okay, what is the trick? One can use a technique called
_substitution_ to see that if we let $h(u) = 3u^2 - 2u^3$ that

$$~
\int_0^1 f(x) dx = \int_0^1 f(h(u)) h'(u) du
~$$

Let $g(u) = f(h(u))h'(u) = 6u(1-u)/\sqrt{3u^2 - 2u^3}$. Then the above is $\int_0^1 g(u) du$. This trick has two purposes:

* if you cancel a common $u$ on top and bottom, the integral of $g$ is a proper integral
* It also mixes up the regularity of points used to integrate which in the case of periodic functions can lead to *aliasing*.

The right Riemann sum of $f(x)$ at $n=100,000$ is not even accurate at the scale of `1e-3`:

```
f(x) = 1/sqrt(x)
abs( 2 - riemann(f, 0, 1, 100000, right_riemann) ) < 2e-3
```

```{hide=true}
n = ifloor(1000 + 4000*rand(1))[1];
```


Is the integral of $g$ over $[0,1]$ accurate to within `1e-3` by $n=$ `n`{.julia}?



```
ans = n < 1733
booleanq(ans)
```

