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
with the `Julia` programming language, as is done with MTH 229 at the College of Staten Island.


These  notes are broken into different sections, where most all sections
have some self-grading questions at the end that allow you to test
your knowledge of that material. The code should be copy-and-pasteable
into a `julia` session. The code output is similar to what would be
shown if evaluated in an `IJulia` cell, our recommended interface while
learning `julia`.

The notes mostly follow topics of a standard first-semester
calculus course after some background material is presented for
learning `julia` within a mathematical framework.

Each topic is followed by a project. At CSI, these projects are completed during computer labs.


### The MTH229 package

The notes assume that the
[MTH229](https://github.com/mth229/MTH229.jl) add-on package is
installed. At CSI, this is the case in the labs. If Julia is not being used on the lab computers, then
this package must be installed (once). The process involves issuing this command:

```verbatim
] add https://github.com/mth229/MTH229.jl
```

If you are *unable* to install packages, the functionality (though not the accompanying packages) can be loaded on the fly with the command ` include(download("https://raw.githubusercontent.com/mth229/MTH229.jl/master/src/229.jl"))`.

(The package `CalculusWithJulia` can mostly substitute for `MTH229` and can be installed directly, as it is registered.)


### How to use `Julia` in MTH 229


Using `Julia` to complete the projects of MTH 229 can be done in several ways. The following lists four possible maners in order of ease of setup:

##### Using the image in the lab:

In the computer labs in 1S, the desktop images have julia installed along with the packages. Simply click on the icon and  wait. If things work to plan, a small terminal screen will appear  with many  lines of commands.  After a few moments, a  browser  tab should open with a listing of  projects. Click on your project  and proceed. Your work will be erased  when you log off.

##### Using binder to run the projects  remotely:

The website  `mybinder.org` allows `julia` and the  projects to be run for  free over the internet. Clicking the binder buttons below (e.g., [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/229-projects/master) _) will redirect you. The start up  is slow so you must be patient. You can read the  projects while binder  activates. Your  work  will  be  erased when you log off.

##### Using `cocalc.com`:

The website [cocalc.com](www.cocalc.com) provides hosted access to `julia` and other programming languages. Though it can  be  used for free, this is not recommended. Rather, a 14 dollar/4 month subscription is. To  proceed, you  should  email Professor Verzani,   who  will add you to  a   "class." This will allow   you to   enroll at the  reduced rate,  and copy the   project  files over  for  use. Using   `cocalc` will require you to install  a  `Julia` package.  Directions are in the file `00-getting-started.ipynb`.

##### Installing `Julia` on a personal laptop or computer.

This is not terribly difficult, but does involve a few additional steps:

a) install `Julia` from [julialang.org/](https://julialang.org/downloads/). This will install like any other software for you system

b) open `Julia`. This will open a *terminal*, we will now add packages to make interactive usage more comfortable. First, run these two commands by copying over, being mindful of capitalizations, then entering:

```verbatim
using Pkg
Pkg.add("IJulia")
```

Then run this command:

```verbatim
Pkg.add(PackageSpec(url="https://github.com/mth229/MTH229.jl.git"))
```

Then run these two commands:

```verbatim
using IJulia
notebook()
```

These last two commands should cause a browser tab to open to a list of files. When doing this again, only the last two commands are needed (the packages do not need to be added more than once).

c) The projects need to be copied over. Go to [github.com/mth229/229-projects](https://github.com/mth229/229-projects). Select the "Clone or download" button and then use the "Download ZIP" option. Unzip these files in the directory that is listed in the browser tab above.



----

This table covers pros and cons for the four approaches above:

```verbatim
                         Using Lab       Binder   CoCalc    Local Installation
Setup ease                  ✓              ✓        ×              ×

Speed                       ✓              ×        ✓              ✓

Persistence of work         ×              ×        ✓              ✓

Free                        ✓              ✓       $14             ✓

Use at home                 ×              ✓        ✓              ✓
```







### The projects

Accompanying each set of notes is a "project" that is to be completed
in the lab time. At CSI, on the lab machines these are pre-loaded.

Otherwise, each project individually comes as an "`ipynb`" file.

## The projects for MTH 229

See all projects at [https://github.com/mth229/229-projects](https://github.com/mth229/229-projects).


The labs may be accessed without a login or any special privledges through  [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/229-projects/master). (Note: this may be kinda slow, but should work.)



* [Calculator](http://mth229.github.io/calculator.html)

Basics of types, order of operations, assignment and variables.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/01-calculator.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/01-calculator.ipynb?create=1)

----

* [Functions](http://mth229.github.io/functions.html)

Shows how to define and call a function. Technical parts include
ternary operator, multiple arguments, and return values (tuples).

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/02-functions.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/02-functions.ipynb?create=1)

----

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

----

* [Zeros](http://mth229.github.io/zeros.html)


Finding zeros for polynomials, graphically finding zeros, and using
the bisection method.

The add-on `Roots` package provides some convenient functionality.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/04-zeros.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/04-zeros.ipynb?create=1)

----

* [Limits](http://mth229.github.io/limits.html)

Basics of limits.

Discussion on floating point representation and potential issues (subtracting like-sized objects!)

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/05-limits.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/05-limits.ipynb?create=1)

----

* [Derivatives](http://mth229.github.io/derivatives.html)

Explore forward difference and central difference with a bit on error
analysis.

We end with a brief discussion on automatic differentiation, as
implemented in the `ForwardDiff` add-on package.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/06-derivatives.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/06-derivatives.ipynb?create=1)

----

* [First and second derivatives](http://mth229.github.io/first-second-derivatives.html)

A look at the relationship between a function and its first and second
derivatives.

<br/>
An assignment for this material:
[ipynb](http://mth229.github.io/229-projects/07-first_second_derivatives.ipynb)
[view](http://nbviewer.ipython.org/url/mth229.github.io/229-projects/07-first_second_derivatives.ipynb?create=1)

----

* [Newton's method](http://mth229.github.io/newton.html)


Basics of Newton's method with a copy-and-paste function to do the
work after the student explores a bit.

Discusses iterative algorithms, approximation, some analysis.

The `fzero` function of the `Roots` package is discussed.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/08-newton.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/08-newton.ipynb?create=1)

----

* [Extrema](http://mth229.github.io/extrema.html)

A project on minimization and maximization. Some standard applied problems are presented.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/09-extrema.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/09-extrema.ipynb?create=1)

----

* [Integration](http://mth229.github.io/integration.html)

Basics of integration with applications including rectangle,
trapezoid, Simpson's, and the `quaggk` function. Applications to volumes
of solids of revolution.

<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/10-integration.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/229-projects/blob/master/10-integration.ipynb?create=1)


### Calculus II material

See the projects at [https://github.com/mth229/232-projects](https://github.com/mth229/232-projects). They can be used through Launch [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/232-projects/master)

* [Symbolic](http://mth229.github.io/symbolic.html)

Discusses how to do some symbolic math in `julia` through the `SymPy` package.


An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/master/01-symbolic.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/232-projects/blob/master/01-symbolic.ipynb?create=1)

----

* Applications of the integral: area between two curves, volume of solids of revolution, other volumes


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/master/02-integral-applications.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/232-projects/blob/master/02-integral-applications.ipynb?create=1)

----

* Techniques of integration: substitution, integration by parts, partial fractions


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/master/03-integral-techniques.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/232-projects/blob/master/03-integral-techniques.ipynb?create=1)

----

* Taylor polynomials


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/master/04-taylor-polynomials.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/232-projects/blob/master/04-taylor-polynomials.ipynb?create=1)

----

* Parametric equations and polar coordinates


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/232-projects/master/05-polar-coordinates.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/232-projects/blob/master/05-polar-coordinates.ipynb?create=1)


### Calculus III material


These are all located [here](https://github.com/mth229/233-projects) and can be run through [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/233-projects/master).

* Vectors and vector-valued functions, $f: R -> R^n$.

[Notes](http://nbviewer.ipython.org/github/mth229/233-projects/blob/master/01-vectors.ipynb?create=1)


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/233-projects/master/02-vectors_project.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/233-projects/blob/master/02-vectors_project.ipynb?create=1)

----


* Functions of several variables, $f:R^n -> R$.
[Notes](http://nbviewer.ipython.org/github/mth229/233-projects/blob/master/03-multivariable.ipynb?create=1)


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/233-projects/master/04-multivariable_project.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/233-projects/blob/master/04-multivariable_project.ipynb?create=1)

----

* Double and triple integration.

[Notes](http://nbviewer.ipython.org/github/mth229/233-projects/blob/master/05-double_triple_integrals.ipynb?create=1)


<br/>
An assignment for this material:
[ipynb](https://raw.githubusercontent.com/mth229/233-projects/master/06-double_triple_integrals_project.ipynb)
[view](http://nbviewer.ipython.org/github/mth229/233-projects/blob/master/06-double_triple_integrals_project.ipynb?create=1)


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

* `plot(f, a, b)` to plot `f` over `[a,b]`; `plot!(g)` to add a curve (using `Plots`)
* `plot([f,g], a, b)` to plot both `f` and `g` over the interval `[a,b]`
* `fzero(f, a, b)` to find a zero inside the bracketing interval `[a,b]` (from `Roots`)
* `fzeros(f, a, b)` to find all the real zeros of a function `f` in `[a,b]` (from `Roots`)
* `limit(f, c)` to find the limit of `f` at `c` (from `SymPy`)
* `f'`  to return a function that computes the derivative of `f` (from the `ForwardDiff` package)
* `diff(f)` to find a symbolic derivative of `f` (from `SymPy`)
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
using Pkg
Pkg.add("https://github.com/mth229/MTH229.jl")
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
  run it periodically. You must first load the `Pkg` module with the command `using Pkg`.

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
