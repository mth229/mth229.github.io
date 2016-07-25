# MTH 229 Projects

```
note(""" For a more thorough introduction, visit [Calculus with Julia](http://calculuswithjulia.github.io).""")
```


## Introduction


This is a collection of notes for exploring calculus concepts
with the `Julia` programming language, as is done with MTH229 at the College of Staten Island.


These  notes are broken into different sections, where most all sections
have some self-grading questions at the end that allow you to test
your knowledge of that material. The code should be copy-and-pasteable
into a `julia` session. The code output is similar to what would be
shown if evaluated in an `IJulia` cell, our recommended interface while
learning `julia`.

The notes mostly follow topics of a standard first-semester
calculus course after some background material is presented for
learning `julia` within a mathematical framework.

The notes assume that the [MTH229](https://github.com/mth229/MTH229.jl) add-on package is installed. This can be done through the command:

```verbatim
Pkg.clone("https://github.com/mth229/MTH229.jl")
```

(If using `IJulia`, this command should be run in a Julia "Console".)

The projects, or "ipynb" files, can be installed into `juliabox.com` by following the instructions [here](https://github.com/mth229/229-projects). Otherwise, they can be downloaded by clicking, and uploaded through `juliabox`'s "Files" tab.


----


* [Calculator](http://mth229.github.io/calculator.html)

Basics of types, order of operations, assignment and variables. 

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/calculator.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/calculator.ipynb?create=1)

* [Functions](http://mth229.github.io/functions.html)

Shows how to define and call a function. Technical parts include
ternary operator, multiple arguments, and return values (tuples).

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/functions.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/functions.ipynb?create=1)


* [Graphing](http://mth229.github.io/graphing.html)


This demonstrates the use of the `Plots` package for plotting. This
package provides a very simple `plot` interface for graphing one or more
functions.

As well, a discussion about arrays and mapping a function over an
array is given. This will be useful later on with limits, ...

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/graphics.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/graphics.ipynb?create=1)


* [Zeros](http://mth229.github.io/zeros.html)


Finding zeros for polynomials, graphically finding zeros, and using
the bisection method.

The add-on `Roots` package provides some convenient functionality.

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/zeros.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/zeros.ipynb?create=1)

* [Limits](http://mth229.github.io/limits.html)

Basics of limits.

Discussion on floating point representation and potential issues (subtracting like-sized objects!)

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/limits.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/limits.ipynb?create=1)

* [Derivatives](http://mth229.github.io/derivatives.html)

Explore forward difference and central difference with a bit on error
analysis.

We end with a brief discussion on automatic differentiation, as
implemented in the `ForwardDiff` add-on package via the `Roots`
package.

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/derivatives.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/derivatives.ipynb?create=1)

* [Newton's method](http://mth229.github.io/newton.html)


Basics of Newton's method with a copy-and-paste function to do the
work after the student explores a bit.

Discusses iterative algorithms, approximation, some analysis.

The `fzero` function of the `Roots` package is discussed.

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/newton.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/newton.ipynb?create=1)


* [First and second derivatives](http://mth229.github.io/first-second-derivatives.html)

A look at the relationship between a function and its first and second
derivatives.

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/first-second-derivatives.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/first-second-derivatives.ipynb?create=1)

* [Extrema](http://mth229.github.io/extrema.html)

A project on minimization and maximization. Some standard applied problems are presented.

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/extrema.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/extrema.ipynb?create=1)

* [Integration](http://mth229.github.io/integration.html)

Basics of integration with applications including rectangle,
trapezoid, Simpson's, and the `quaggk` function. Applications to volumes
of solids of revolution.

<br/>
An assignment for this material: 
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/integration.ipynb) 
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/integration.ipynb?create=1)


### Calculus II material



* [Symbolic](http://mth229.github.io/symbolic.html)

Discusses how to do some symbolic math in `julia` through the `SymPy` package.


<br/>
An assignment for this material: 
[ipynb](http://mth229.github.io/232-projects/symbolic.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/232-projects/symbolic.ipynb?create=1)


* Applications of the integral: area between two curves, volume of solids of revolution, other volumes


<br/>
An assignment for this material: 
[ipynb](http://mth229.github.io/232-projects/integral-applications.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/232-projects/integral-applications.ipynb?create=1)


* Techniques of integration: substitution, integration by parts, partial fractions


<br/>
An assignment for this material: 
[ipynb](http://mth229.github.io/232-projects/integral-techniques.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/232-projects/integral-techniques.ipynb?create=1)


* Taylor polynomials


<br/>
An assignment for this material: 
[ipynb](http://mth229.github.io/232-projects/taylor-polynomials.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/232-projects/taylor-polynomials.ipynb?create=1)


* Parametric equations and polar coordinates


<br/>
An assignment for this material: 
[ipynb](http://mth229.github.io/232-projects/polar-coordinates.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/232-projects/polar-coordinates.ipynb?create=1)


### Calculus III material


* Vectors and vector-valued functions, $f: R -> R^n$

Read some notes on this material:
[ipynb](http://mth229.github.io/233-projects/vectors.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/233-projects/vectors.ipynb?create=1)

<br/>
An assignment for this material:
[ipynb](http://mth229.github.io/233-projects/vectors-project.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/233-projects/vectors-project.ipynb?create=1)




* Functions of several variables, $f:R^n -> R$.


Read some notes on this material:
[ipynb](http://mth229.github.io/233-projects/multivariable.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/233-projects/multivariable.ipynb?create=1)

<br/>
An assignment for this material:
[ipynb](http://mth229.github.io/233-projects/multivariable-project.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/233-projects/multivariable-project.ipynb?create=1)


* Double and triple integration.


Read some notes on this material:
[ipynb](http://mth229.github.io/233-projects/double-triple-integrals.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/233-projects/double-triple-integrals.ipynb?create=1)

<br/>
An assignment for this material:
[ipynb](http://mth229.github.io/233-projects/double-triple-integrals-project.ipynb) 
[view](http://nbviewer.ipython.org/url/mth229.github.io/233-projects/double-triple-integrals-project.ipynb?create=1)



## Basic ideas

`Julia` makes an excellent choice for this material as its syntax is
very similar to standard mathematical syntax. The ability to define
mathematical functions using the familiar `f(x) = ...` notation makes
getting started really easy. Further, the fact that functions are
*first-class objects* means that it is possible to create *higher-order* julia
functions that mirror the standard operators of calculus. The
following pattern is used throughout:

```verbatim
action(function_object, args...)
```

For example, the notes use:

* `plot(f, a, b)` to plot `f` over `[a,b]` (from `Gadfly`)
* `plot([f,g], a, b)` to plot both `f` and `g` over the interval `[a,b]`
* `roots(f)` to find the roots of a polynomial function, `f` (from `Polynomials`)
* `fzeros(f)` to find the real roots of a polynomial function `f` (from `Roots`)
* `fzero(f, a, b)` to find a root inside the bracketing interval `[a,b]` (from `Roots`)
* `limit(f, c)` to find the limit of `f` at `c` (from `SymPy`)
* `f'` or `D(f)` to return a function that computes the derivative of `f` (from the `Roots` package)
* `fzero(f, a)` or `[fzero(f, x) for x in [x1,x2, ...]]` to find root(s) of `f` starting at `a` or each of the x's
* `quadgk(f, a, b)` to find the numeric integral of `f` over `(a,b)` (from base `julia`)
* `integrate(f)` to find the symbolic integral of `f` (from the `SymPy` package)
* `integrate(f, a, b)` to find the definite integral over `[a,b]` symbolically


With just this basic set of actions, akin to buttons on the calculator, a rich variety of problems can be addressed.



## Some additional resources

`Julia` is a young language, with the bulk of its development being done since its [initial announcement](http://julialang.org/blog/2012/02/why-we-created-julia/). It has relatively few online resources. Some are compiled here. Many of these are linked to from a [julia web brain](http://webbrain.com/brainpage/brain/ACDE39E6-DF33-9199-E760-3408978F6B7C).

* The [Julia manual](http://docs.julialang.org/en/latest/manual/) provides a comprehensive overview

* MIT Professor Steven G Johnson has some notes on using `julia` [here](https://github.com/stevengj/julia-mit/) and a cheat sheet [here](http://math.mit.edu/~stevenj/Julia-cheatsheet.pdf).

* some blog posts are collected [here](http://www.reddit.com/r/Julia/).

* At forio.com a tutorial is provided [here](http://forio.com/products/julia-studio/tutorials/).

* A tutorial in `IJulia` format by Isaiah Norton is  [here](http://nbviewer.ipython.org/github/JuliaX/JuliaTutorial/blob/master/JuliaTutorial.ipynb?create=1), with the original file found [here](https://github.com/JuliaX/JuliaTutorial/blob/master/JuliaTutorial.ipynb).


Before starting out with `Julia` it must be available. 

### Downloading `julia`

In order to get started with `Julia` it needs to be installed. If this
is not done already, you have a bit of work to do to get `julia` and the notebook interface provided by `IJulia`.

First to install `julia` you can download a copy or install it from source. Likely a download is easiest. Official releases are available from [julialang.org](http://julialang.org/) but it is best to download a cutting-edge release from [status.julialang.org](http://status.julialang.org/). Installation is hopefully similar to what you do for other software on your system.


### Starting `julia`

Starting `julia` varies amongst the different operating systems. All
have a *console* where commands are typed for `julia` to interpret and
execute. This is known as the *command line* and though a long
familiar means of interacting with computers, it is generally not
familiar to the average student. We will need to learn to like the
command line. Once done, you may think it is great, but it can a bit
frustrating getting to that attitude.

Here is what the command line looks like on startup from a mac book
pro within the terminal:


```verbatim
               _
   _       _ _(_)_     |  A fresh approach to technical computing
  (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
   _ _   _| |_  __ _   |  Type "?help" for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 0.4.1 (2015-11-08 10:33 UTC)
 _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
 |__/                  |  x86_64-apple-darwin13.4.0
 
julia> 
```


The command line is the last line: a prompt beginning with
`julia>`. Here is where you type an expression and then the
<em>enter</em> key to ask `julia` to evaluate it.

A simple command is then typed into the computer followed by the *enter* key. This is then sent to `julia`'s interpreter and an answer returned:

```
2 + 2
```

If you get `4`, you are able to use `julia`.

### Installing MTH229

One command that the notes assume you have typed is the one to install the add-on `MTH229` package. If you haven't done so, try this:

```verbatim
Pkg.clone("https://github.com/mth229/MTH229.jl")
```

### IJulia <small>An enhanced interface for using julia interactively</small>

The command line is not the most comfortable learning experience for
`julia`, rather it is suggested that the `IJulia` notebook interface
be used.  In the `IJulia` notebook, the command line is replaced by a
cell where commands can be entered and executed in batches. The
editing of commands is much easier and some features for integrated
help are available.


```
ImageFile("figures/projects/ijulia.png")
```

The above graphic is from the main web page for `julia`
(julialang.com) and shows the `IJulia` notebook with some graphics
provided by the `Gadfly` package.

Using `IJulia` will require one more additional installation step:

```
Pkg.add("IJulia")
```


```
alert(""" The above commands form the basics of
`julia`'s package system. Like most computer languages, `julia` can be
extended by user-contributed packages. The complete list of available
packages is kept on the computer you are using `julia` at. This list
is updated by the command `Pkg.update()`. New packages are made
available for use by installing or `add`ing them to your system via
`Pkg.add`. Adding packages will automatically install any dependent
packages. As well, external libraries *should* also be installed for
you. This magic attempts to automatically identify what your computer
system needs and acts accordingly.

The above commands need only be done when new packages are being installed. However, each time you wish to actual **use** an external package in a session, it must be added. This is done with the `using` command, as `using Plots`
""")
```


Afterwards those commands are successful, the following command will
start the notebook interface:

```verbatim
using IJulia
notebook()
```


For now, you can use `Julia` online through [juliabox.com](juliabox).

## Extending Julia with packages

`Julia` can be extended through external packages. Although a
relatively young language, there are already over 600 add-on packages
readily available for Julia through its package manager.

For example, the `MTH229` package installs the `Plots` package for making plots, the `Roots` package for finding zeros of functions and the `SymPy` package for symbolic math within `Julia`.

### Installing an add-on pacakge

In the `julia` world, a package author may publish his or her package
so that it is easy for an end user to use and install. For the end
user there are just a handful of important commands to install a
package:

* Call `Pkg.udpate()` to update the currently installed external
  packages and to update the list of available packages to
  install. Though this command can be a bit slow, it is a good idea to
  run it periodically.

* To add a new package, call `Pkg.add("package_name")`, where you have
  to put the appropriate package name in. For example, the command
  `Pkg.add("Plots")` will install the `Plots` package. In the
  process, any external dependencies will be resolved. These include
  installing any packages that the one you want depends on and in some
  cases, additional software.

* There are other useful commands, but those two are basically it:
  `Pkg.update()` to update and `Pkg.add()` to add a new package.


### Using a package

External packages must be loaded into a session. This need only be
done once. The easiest way is to use the keyword `using`, a in `using
Plots`. This must be done *before* you try to use any functionality
related to the package. For interactive use, it is a good idea to just
pull in familiar packages at the outset.

This has some cost, as some packages are slow to load.

So, to make a plot using `Plots`, the sequence might go like:

```
using Plots
plotly()
f(x) = x^2 - 2x
plot(f, -2, 1)			
```

(The command `using MTH229` will load the `Plots` package for you.)

The [manual](http://julia.readthedocs.org/en/latest/manual/packages/) has some more information.
