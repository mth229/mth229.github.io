## Improper integrals are *not* on the syllabus.

### Improper integrals

An _improper integral_ is one which involves infinity one of  few ways:

1) one or both limits is infinite

2) the function $f$ has a vertical asymptote in the interval $[a,b]$ (e.g., $f(x) = 1/x$ on $[0,1]$.


For these cases, the fundamental theorem of calculus does not apply,
but the definite integral can be defined in terms of limiting values
over sub-ranges. (For example, use $\lim_{M\rightarrow \infty} \int_0^M e^{-x} dx$ to define
$\int_0^\infty e^{-x} dx$.)

[Kahan](http://www.hpl.hp.com/hpjournal/pdfs/IssuePDFs/1980-08.pdf)
(in a very interesting article about integration on a calculator)
goes on to add these as troubling:

3) the integrand oscillates infinitely rapidly in the interval $[a,b]$ (e.g., $f(x) = \sin(1/x)$ on $[-1,1]$.

4) the integrand or its first derivative changes wildly within a relatively narrow subinterval or oscillates frequently.

The `quadgk` function can handle these cases well, as we see through some examples

* The integral $\int_0^1 1/\sqrt{x}dx$ is an improper integral that is defined. What is the value?

```
```

```
f(x) = 1/sqrt(x)
val, err = quadgk(f, 0, 1)
numericq(val, 1e-8, "1/sqrt(x) from 0 to 1")
```

Why is this integral "improper?"

```
```

```
choices = ["The domain to integrate over is infinite",
	"There is a vertical asymptote",
	"The integral oscillates wildly"]
ans = 2
radioq(choices, ans, "Why improper")
```

* The integral $\int_0^1 x^{-2} dx$ is an improper integral that is not defined. How does `julia` report the error?

```
```

```
shortq("DomainError", "How is the error reported?", "It throws a domain error")
```


Why is this integral "improper?"

```
```

```
choices = ["The domain to integrate over is infinite",
	"There is a vertical asymptote",
	"The integral oscillates wildly"]
ans = 2
radioq(choices, ans, "Why improper")
```

* The integral $\int_0^\infty e^{-x^2} dx$ is important in probability theory and many other areas. Compute its value with `quadgk`. (`Inf` is infinity.)

```
```

```
f(x) = exp(-x^2)
val, err = quadgk(f, 0, Inf)
numericq(val, 1e-6, "integral \\( exp(-x^2) \\)")
```


Why is this integral "improper?"

```
```

```
choices = ["The domain to integrate over is infinite",
	"There is a vertical asymptote",
	"The integral oscillates wildly"]
ans = 1
radioq(choices, ans, "Why improper")
```


* The function $f(x) = x \cdot \sin(1/x)$ must be redefined to have a limit at
  $0$. The integral $\int_0^1 x \cdot \sin(1/x)dx$ is defined. What is
  the value estimated by `quadgk`?

```
```

```
f(x) = x * sin(1/x)
val, err = quadgk(f, 0, 1)
numericq(val, 1e-6, "integral of x*sin(1/x)")
```



Why is this integral "improper?" (In Kahan's widening of the sense.)

```
```

```
choices = ["The domain to integrate over is infinite",
	"There is a vertical asymptote",
	"The integral oscillates wildly"]
ans = 3
radioq(choices, ans, "Why improper")
```


* Define

$$~
f(u) = \frac{\sqrt{u}}{u-1} - \frac{1}{\log{u}}
~$$

The improper integral $\int_0^1 f(u) du$ is defined. What is the
value? What is the estimated error? Is this consistent with a value of
$0.03649$ give or take `1e-10`?

```
```

```
choices=["yes","no"]
ans=1
radioq(choices, ans, "Consistent with the value")
```
