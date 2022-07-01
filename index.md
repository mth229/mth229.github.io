# MTH 229 Projects

> These project use version v1.7 of Julia.

## Introduction


MTH229 at the College of Staten Island is a course to introduce a
programming language to reinforce concepts of a first-semester
calculus course from numerical and graphical points of view.

Some sections use the [Julia](http://julialang.org) programming the
language. For `Julia`, the "projects" are on WeBWorK and there
*should* be sufficient background material therein to work through the
details. Here can be found additional detail for those seeking it. For
a more thorough introduction, visit [Calculus with
Julia](http://calculuswithjulia.github.io).

Installation details for `Julia` are at the end of this page

----

These  notes are broken into different sections, where most all sections
have some self-grading questions at the end that allow you to test
your knowledge of that material. The code should be copy-and-pasteable
into a `julia` session. The code output is similar to what would be
shown if evaluated in an `IJulia` cell, our recommended interface while
learning `julia`.

The notes mostly follow topics of a standard first-semester
calculus course after some background material is presented for
learning `julia` within a mathematical framework.

Each topic is followed by a project. At CSI, these projects are
completed during computer labs. These projects are available as
`IJulia` notebooks or `Pluto` notebooks.


## The projects for MTH 229

There are ten "projects" for this class.  See all projects at
[https://github.com/mth229/229-projects](https://github.com/mth229/229-projects).

The projects provide some background details *and* are notebooks for
you to answer the accompanying questions. The questions are asked and
answered through your `WeBWorK` login.


There are some longer notes available for each project, linked to below.


-----

* [Calculator](http://mth229.github.io/calculator.html)

Basics of  order of operations, assignment, and variables.

<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/01-calculator.ipynb)
[(Pluto html)](./229-projects/01-calculator.html)
[(With commentary)](./229-projects/01-calculator-pluto-commentary.html)

----

* [Functions](http://mth229.github.io/functions.html)

Shows how to define and call a function. Technical parts include
the ternary operator, multiple arguments, and return values (tuples).

<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/02-functions.ipynb)
[(Pluto html)](./229-projects/02-functions.html)
[(With commentary)](./229-projects/02-functions-pluto-commentary.html)

----

* [Graphing](http://mth229.github.io/graphing.html)


This demonstrates the use of the `Plots` package for plotting which
provides a very simple interface for graphing one or more
functions.


<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/03-graphics.ipynb)
[(Pluto html)](./229-projects/03-graphics.html)
[(With commentary)](./229-projects/03-graphics-pluto-commentary.html)

----

* [Zeros](http://mth229.github.io/zeros.html)


This section discusses finding zeros using the bisection method.
The add-on `Roots` package provides some convenient functionality.

<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/04-zeros.ipynb)
[(Pluto html)](./229-projects/04-zeros.html)
[(With commentary)](./229-projects/04-zeros-pluto-commentary.html)

----

* [Limits](http://mth229.github.io/limits.html)

Basics of limits presented graphically, numerically, and symbolically.


<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/05-limits.ipynb)
[(Pluto html)](./229-projects/05-limits.html)
[(With commentary)](./229-projects/05-limits-pluto-commentary.html)

----

* [Derivatives](http://mth229.github.io/derivatives.html)

Derivatives presented by the forward difference quotient, automatic differentiation, and symbolic differentiation.


<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/06-derivatives.ipynb)
[(Pluto html)](./229-projects/06-derivatives.html)
[(With commentary)](./229-projects/06-derivatives-pluto-commentary.html)


----

* [First and second derivatives](http://mth229.github.io/first-second-derivatives.html)

A look at the relationship between a function and its first and second
derivatives.

<br/>
A notebook for this material:
[ipynb](http://mth229.github.io/229-projects/07-first_second_derivatives.ipynb)
[(Pluto html)](./229-projects/07-first_second_derivatives.html)
[(With commentary)](./229-projects/07-first_second_derivatives-pluto-commentary.html)


----

* [Newton's method](http://mth229.github.io/newton.html)


Basics of Newton's method.

The `fzero` function of the `Roots` package is discussed.

<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/08-newton.ipynb)
[(Pluto html)](./229-projects/08-newton.html)
[(With commentary)](./229-projects/08-newton-pluto-commentary.html)

----

* [Extrema](http://mth229.github.io/extrema.html)

A project on minimization and maximization. Some standard applied problems are presented.

<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/09-extrema.ipynb)
[(Pluto html)](./229-projects/09-extrema.html)
[(With commentary)](./229-projects/09-extrema-pluto-commentary.html)

----

* [Integration](http://mth229.github.io/integration.html)

Basics of Riemann integration with applications including trapezoid
and Simpson's methods. The `quaggk` function. Applications to arc
length and volumes of solids of revolution.

<br/>
A notebook for this material:
[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/10-integration.ipynb)
[(Pluto html)](./229-projects/10-integration.html)
[(With commentary)](./229-projects/10-integration-pluto-commentary.html)


----

Blank notebooks for test taking, etc.:

[ipynb](https://raw.githubusercontent.com/mth229/229-projects/master/00-blank-notebook.ipynb)
[(Pluto html)](./229-projects/00-blank-notebook.html)

#### Questions and Answers

Question and answers are now presented and completed through  `WeBWorK`.
The  notebooks above only contain the background details.

There  are a few idiosyncracies to be aware of:

*  The code examples  are typset in `WeBWorK` as though they  appear in  a *terminal*. A terminal displays  the output of  each  command immediately after execution. In a notebook,  when  a cell  is executed, all the  commands are computed and *only*  the  last  value is shown. (The use of `@show` or `print(...)` can be used to display intermediate values in a  cell.)

* Copy and paste from a `WeBWorK` page into a notebook will usually be unsuccessful, as  numbers  in the  font  used to display computer markup do not copy as ASCII numbers  into a cell. The numbers can be hand edited though.

* While `Julia` is very happy to express its output using scientific notation, `WeBWorK` is not happy to receive the exact output for an answer. Either replace `e` with `E` (as in `1.23e4` would be `1.23E4`) or use decimals.

* For *most* questions with a  numeric answer  it is best to  copy all  16 digits of output. Several  digits are expected to match a  correct answer. For numeric questions where an  estimate is made, say from a graph, this is  significantly relaxed.

* If the answer  is to  be a function, the  automatic grader is  expecting just  the  rule  of the function  (an expression), as in for `f(x) = sin(x)` just enter `sin(x)`.


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

`Julia` makes an excellent choice as a computer supplement for this
material as its syntax is very similar to standard mathematical
syntax. The ability to define mathematical functions using the
familiar `f(x) = ...` notation makes getting started really
easy. Further, the fact that functions are *first-class objects* means
that it is possible to create *higher-order* julia functions that
mirror the standard operations of calculus. The following pattern is
used throughout:

```verbatim
action(function_object, args...)
```

For example, the notes use:

* `plot(f, a, b)` to plot `f` over `[a,b]`; `plot!(g)` to add a curve (using `Plots`, `SimplePlots`, or `Makie`)
* `plot([f,g], a, b)` to plot both `f` and `g` over the interval `[a,b]`
* `fzero(f, a, b)` to find a zero inside the bracketing interval `[a,b]` (from `Roots`)
* `fzeros(f, a, b)` to find all the real zeros of a function `f` in `[a,b]` (from `Roots`)
* `limit(f(x), x=>c)` to find the limit of `f` at `c` (from `SymPy`)
* `f'`  to return a function that computes the derivative of `f` (Added in the `MTH229` package based on the `derivative` function from the `ForwardDiff` package)
* `diff(f(x),x)` to find a symbolic derivative of `f` (from `SymPy`)
* `fzero(f, a)` to search for a zero of `f` starting at `a`
* `quadgk(f, a, b)` to find the numeric integral of `f` over `(a,b)`
  (from the `QuadGK` package)
* `integrate(f(x),x)` to find the symbolic integral of `f` (from the `SymPy` package)
* `integrate(f(x), (x, a, b))` to find the definite integral over `[a,b]`
  symbolically (from the `SymPy` package).


With just this basic set of actions, akin to buttons on the calculator, a rich variety of problems can be addressed.


## How to use `Julia` in MTH 229


Using `Julia` to complete the projects of MTH 229 can be done in several ways.

### Using the `juliabox` server

CSI students have access to a server that gives access to the jupyter notebooks.

### Installing `Julia` on a personal laptop or computer.

This is not terribly difficult, but does involve a few additional steps:

* Download and install `Julia` from [julialang.org/](https://julialang.org/downloads/). This will install like any other software for you system.

* Start the application

This opens a  terminal. Commands are typed after the prompt (`> julia`) and executed when the return key is pressed.

First, the `MTH229` package must be installed. This only needs to be done once. Copy  these commands to the terminal and press return to run them:

```
using Pkg
Pkg.add(["MTH229", "Plots", "IJulia", "ZipFile"])
Pkg.build("IJulia")
```

(If using version 1.7 or higher of `Julia`, you can type:

```
using MTH229, Plots, IJulia, ZipFile
```

and follow the prompts.)

* Now download the projects by copying and pasting the following commands:

```
using ZipFile
dirnm = homedir()  # This is where the project files will be installed
zf = "https://www.github.com/mth229/229-projects/archive/master.zip"
zarchive = ZipFile.Reader(download(zf))
!isdir(dirnm) && mkdir(dirnm)
cd(dirnm)

for f in zarchive.files
  nm = basename(f.name)
  occursin("ipynb", nm) || continue
  @info "installing $nm"
  open(nm, "w") do io
    write(io, read(f, String))
  end
end
```

* Then, each session where you want to use Julia, open the terminal and issue these two case-sensitive commands:

```
using IJulia
notebook()
```

Your browser should open to the Jupyter interface and the projects should among those listed.

#### Using Pluto notebooks locally

`Pluto` notebooks are easier to install. At the terminal (assuming version 1.7 or higher) run:

```
using Pluto
Pluto.run()
```

This will open a `Pluto` landing page in a browser tab.
The html notebooks linked herein offer a means to "Edit or run this notebook." Download the notebook (it will make a `.jl` file) and then open this within `Pluto`.


### Using binder to run the projects  remotely:

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/229-projects/HEAD)

The link above allows the projects for MTH229 to be run through the web.

* `binder` is a service that runs interactive notebooks through the web. Each notebook is limited in memory and has a 10 minute *inactivity* timeout. Binder notebooks are not persistent, though they do have a button to save to local storage.

Binder takes between 30 seconds and one minute to get up and running. Once a notebook is selected, it takes another 30ish seconds to get the typical packages started.



----

This table covers pros and cons for the  approaches mentioned above:

```
                         Using server    Binder       Local Installation
Setup ease                  ✓              ✓                 ×

Speed                       ✓              ×                 ✓

Persistence of work         ×              ×                 ✓

Free                        ✓              ✓                 ✓

Use at home                 ✓              ✓                 ✓
```
