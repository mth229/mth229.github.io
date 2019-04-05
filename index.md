# MTH 229 Projects

```
note(""" For a more thorough introduction, visit [Calculus with Julia](http://calculuswithjulia.github.io).""")
```


## Introduction

```
note(""" These use version v1.0 of Julia.
See all projects at [https://github.com/mth229/229-projects](https://github.com/mth229/229-projects)""")
```

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

### The MTH229 package

The notes assume that the
[MTH229](https://github.com/mth229/MTH229.jl) add-on package is
installed. In the lab this will be the case. If not, then
it must be done (once). The process involves:

```verbatim
] add https://github.com/mth229/MTH229.jl
```

If you are *unable* to install packages, the functionality (though not the accompanying packages) can be loaded on the fly with the command ` include(download("https://raw.githubusercontent.com/mth229/MTH229.jl/master/src/229.jl"))`.




### The projects

Accompanying each set of notes is a "project" that is to be completed
in the lab time. For the lab machines these are pre-loaded.

The labs may be accessed without a login or any special privledges through  [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/229-projects/master). (Note: this may be kinda slow, but should work.)



For `juliabox.com` usage, the projects may be copied in all at once. This
is completed by:

* Clicking the "Git" menu item at the top of the juliabox page
* Copying and pasting the "Git Clone URL": "`https://github.com/mth229/229-projects.git`" into the text box
* Clicking the "+" button to the right (accepting the defaults for the
other two text boxes.)
* Waiting for it too happen

If all goes to plan, a "folder" titled "229-projects" will contain the
projects for your usage.


```
ImageFile("figures/sync-dialog.png")
```

Otherwise, each project individually comes as an "`ipynb`" file. These
can be downloaded from this page, and then "uploaded" into juliabox
using the "upload" button of the file manager.

## The projects for MTH 229

See all projects at [https://github.com/mth229/229-projects](https://github.com/mth229/229-projects).


* [Calculator](http://mth229.github.io/calculator.html)

Basics of types, order of operations, assignment and variables.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/01-calculator.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/01-calculator.ipynb?create=1)

* [Functions](http://mth229.github.io/functions.html)

Shows how to define and call a function. Technical parts include
ternary operator, multiple arguments, and return values (tuples).

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/02-functions.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/02-functions.ipynb?create=1)


* [Graphing](http://mth229.github.io/graphing.html)


This demonstrates the use of the `Plots` package for plotting. This
package provides a very simple `plot` interface for graphing one or more
functions.

As well, a discussion about arrays and mapping a function over an
array is given. This will be useful later on with limits, ...

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/03-graphics.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/03-graphics.ipynb?create=1)


* [Zeros](http://mth229.github.io/zeros.html)


Finding zeros for polynomials, graphically finding zeros, and using
the bisection method.

The add-on `Roots` package provides some convenient functionality.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/04-zeros.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/04-zeros.ipynb?create=1)

* [Limits](http://mth229.github.io/limits.html)

Basics of limits.

Discussion on floating point representation and potential issues (subtracting like-sized objects!)

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/05-limits.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/05-limits.ipynb?create=1)

* [Derivatives](http://mth229.github.io/derivatives.html)

Explore forward difference and central difference with a bit on error
analysis.

We end with a brief discussion on automatic differentiation, as
implemented in the `ForwardDiff` add-on package.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/06-derivatives.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/06-derivatives.ipynb?create=1)


* [First and second derivatives](http://mth229.github.io/first-second-derivatives.html)

A look at the relationship between a function and its first and second
derivatives.

<br/>
An assignment for this material:
[ipynb](http://mth229.github.io/229-projects/07-first_second_derivatives.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/229-projects/07-first_second_derivatives.ipynb?create=1)

* [Newton's method](http://mth229.github.io/newton.html)


Basics of Newton's method with a copy-and-paste function to do the
work after the student explores a bit.

Discusses iterative algorithms, approximation, some analysis.

The `fzero` function of the `Roots` package is discussed.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/08-newton.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/08-newton.ipynb?create=1)


* [Extrema](http://mth229.github.io/extrema.html)

A project on minimization and maximization. Some standard applied problems are presented.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/09-extrema.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/09-extrema.ipynb?create=1)

* [Integration](http://mth229.github.io/integration.html)

Basics of integration with applications including rectangle,
trapezoid, Simpson's, and the `quaggk` function. Applications to volumes
of solids of revolution.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/10-integration.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/10-integration.ipynb?create=1)


### Calculus II material

See the projects at [https://github.com/mth229/232-projects](https://github.com/mth229/232-projects).

* [Symbolic](http://mth229.github.io/symbolic.html)

Discusses how to do some symbolic math in `julia` through the `SymPy` package.


An assignment for this material:
[ipynb]((https://raw.githubusercontent.com/mth229/232-projects/symbolic.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/232-projects/symbolic.ipynb?create=1)


* Applications of the integral: area between two curves, volume of solids of revolution, other volumes


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/integral-applications.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/232-projects/integral-applications.ipynb?create=1)


* Techniques of integration: substitution, integration by parts, partial fractions


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/integral-techniques.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/232-projects/integral-techniques.ipynb?create=1)


* Taylor polynomials


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/taylor-polynomials.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/232-projects/taylor-polynomials.ipynb?create=1)


* Parametric equations and polar coordinates


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/polar-coordinates.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/232-projects/polar-coordinates.ipynb?create=1)


### Calculus III material


These are all located [here](https://github.com/mth229/233-projects) and can be run through [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/233-projects/master).

* Vectors and vector-valued functions, $f: R -> R^n$.

[Notes](http://nbviewer.ipython.org/url/mth229.github.io/mth229/233-projects/01-vectors.ipynb?create=1)

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/233-projects/02-vectors_project.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/233-projects/02-vectors_project.ipynb?create=1)




* Functions of several variables, $f:R^n -> R$.

[Notes](http://nbviewer.ipython.org/url/mth229.github.io/mth229/233-projects/03-multivariable.ipynb?create=1)

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/233-projects/04-multivariable_project.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/233-projects/04-multivariable_project.ipynb?create=1)


* Double and triple integration.

[Notes](http://nbviewer.ipython.org/url/mth229.github.io/mth229/233-projects/05-double_triple_integrals.ipynb?create=1)

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/233-projects/06-double_triple_integrals-project.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/mth229/233-projects/06-double_triple_integrals_project.ipynb?create=1)


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

* `plot(f, a, b)` to plot `f` over `[a,b]`
* `plot([f,g], a, b)` to plot both `f` and `g` over the interval `[a,b]`
* `fzeros(f)` to find the real roots of a polynomial function `f` (from `Roots`)
* `fzero(f, a, b)` to find a root inside the bracketing interval `[a,b]` (from `Roots`)
* `limit(f, c)` to find the limit of `f` at `c` (from `SymPy`)
* `f'` or `D(f)` to return a function that computes the derivative of `f` (from the `Roots` package)
* `fzero(f, a)` to search for a zero of `f` starting at `a`
* `quadgk(f, a, b)` to find the numeric integral of `f` over `(a,b)`
  (from the `QuadGK` package)
* `integrate(f)` to find the symbolic integral of `f` (from the `SymPy` package)
* `integrate(f, a, b)` to find the definite integral over `[a,b]`
  symbolically (from the `SymPy` package).


With just this basic set of actions, akin to buttons on the calculator, a rich variety of problems can be addressed.



## Some additional resources

`Julia` is a young language, with the bulk of its development being done since its [initial announcement](http://julialang.org/blog/2012/02/why-we-created-julia/). It has relatively few online resources. Some are compiled here. Many of these are linked to from a [julia web brain](http://webbrain.com/brainpage/brain/ACDE39E6-DF33-9199-E760-3408978F6B7C).

* The [Julia manual](http://docs.julialang.org/en/latest/manual/) provides a comprehensive overview

* MIT Professor Steven G Johnson has some notes on using `julia` [here](https://github.com/stevengj/julia-mit/) and a cheat sheet [here](http://math.mit.edu/~stevenj/Julia-cheatsheet.pdf).

* some blog posts are collected [here](http://www.reddit.com/r/Julia/).

* A tutorial in `IJulia` format by Isaiah Norton is  [here](http://nbviewer.ipython.org/github/JuliaX/JuliaTutorial/blob/master/JuliaTutorial.ipynb?create=1), with the original file found [here](https://github.com/JuliaX/JuliaTutorial/blob/master/JuliaTutorial.ipynb).


Before starting out with `Julia` it must be available.

We recommend taking advantage of the free web service at
[juliabox.com](juliabox.com), but `Julia` can be easily installed on a local
computer, as described in the following.


### Downloading `julia`

In order to get started with `Julia` it needs to be installed. If this
is not done already, you have a bit of work to do to get `julia` and the notebook interface provided by `IJulia`.

First to install `julia` you can download a copy or install it from
source. Likely a download is easiest. Official releases are available
from [julialang.org](http://julialang.org/). Download the latest
released version. Installation is hopefully similar to what you do for
other software on your system.


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
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.1.0 (2019-01-21)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |
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
] add https://github.com/mth229/MTH229.jl
```

This may take a while to complete.

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

The above graphic was grabbed from the main web page for `julia`
(julialang.com) and shows the `IJulia` notebook with some graphics
provided by the `Gadfly` package.

Using `IJulia` will require one more additional installation step:

```verbatim
Pkg.add("IJulia")
```


```
alert(""" The above commands form the basics of
`julia`'s package system. Like most computer languages, `julia` can be
extended by user-contributed packages. The complete list of available
packages is kept on the computer you are using `julia` at.  New packages are made
available for use by installing or `add`ing them to your system via
`Pkg.add`. Adding packages will automatically install any dependent
packages. As well, external libraries *should* also be installed for
you. This magic attempts to automatically identify what your computer
system needs and acts accordingly.

The above commands need only be done when new packages are being installed. However, each time you wish to actually **use** an external package in a session, it must be added. This is done with the `using` command, as `using Plots`
""")
```


Afterwards those commands are successful, the following command will
start the notebook interface:

```verbatim
using IJulia
notebook()
```


## Extending Julia with packages

`Julia` can be extended through external packages. Although a
relatively young language, there are already around 1000 add-on packages
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
