# MTH 229 Projects

```
note(""" For a more thorough introduction, visit [Calculus with Julia](http://calculuswithjulia.github.io).""")
```


## Introduction

```
note(""" These use version v1.4 of Julia.
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




### How to use `Julia` in MTH 229


Using `Julia` to complete the projects of MTH 229 can be done in several ways. The following lists four possible manners in order of ease of setup:

##### Using the image in the lab:

In the computer labs in 1S, the desktop images have julia installed along with the packages. Simply click on the icon and  wait. If things work to plan, a small terminal screen will appear  with many  lines of commands.  After a few moments, a  browser  tab should open with a listing of  projects. Click on your project  and proceed. Your work will be erased  when you log off.


In the COVID world, the college is looking at a mechanism to remotely access a lab computer.

##### Using binder to run the projects  remotely:

The website  `mybinder.org` allows `julia` and the  projects to be run for  free over the internet. Clicking the binder buttons below (e.g., [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/229-projects/master) _) will redirect you. The start up  is slow so you must be patient. You can read the  projects while binder  activates. Your  work  will  be  erased when you log off.

##### Using `cocalc.com`:

The website [cocalc.com](www.cocalc.com) provides hosted access to `julia` and other programming languages. Though it can  be  used for free, this is not recommended. Rather, a modestly priced subscription is. 

##### Installing `Julia` on a personal laptop or computer.

This is not terribly difficult, but does involve a few additional steps:

a) install `Julia` from [julialang.org/](https://julialang.org/downloads/). This will install like any other software for you system

b) open `Julia`. This will open a *terminal*, we will now add packages to make interactive usage more comfortable. First, run these two commands by copying over, being mindful of capitalizations, then entering:

```verbatim
]
add IJulia
add https://github.com/mth229/MTH229.jl
add SimplePlots
[backspace key]
```


The first command (`]`) drops into "package mode". The next 3 commands add some packages that are utilized in this course. The backspace key returns one to the command line. These packages need only be added once.

The notes assume that the
[MTH229](https://github.com/mth229/MTH229.jl) add-on package is
installed. (The second package loaded). (The package `CalculusWithJulia` can mostly substitute for `MTH229` and can be installed directly from its name, as it is registered.)

c) When you wish to use `Julia`, you open the *terminal* (as above) and then issue these two commands:

```verbatim
using IJulia
notebook()
```

The first command *may* take some time the very first time it is entered, as the package is "compiled." The first command loads a package, the second command executes the `notebook` function in the package that starts the notebook interface through the browser. The `jupyterla()` function call is an alterative.



c) The projects (see below) need to be copied over. This can be done as follows. First, if the `ZipFile` package is note installed, copy and paste these commands into a cell and run them:

```verbatim
using Pkg
Pkg.add("ZipFile")
```

Next, in an `IJulia` cell, copy and paste this set of commands and run them:

```verbatim
using ZipFile
zf = "https://www.github.com/mth229/229-projects/archive/master.zip"
zarchive = ZipFile.Reader(download(zf))

dname = "./229-projects-master"
isdir(dname) || mkdir(dname)

for f in zarchive.files
    nm = f.name
    occursin("ipynb", nm) || continue
    open(nm, "w") do io
        write(io, read(f, String))
    end
end
```

This will create a directory `229-projects-master` and populate it with the projects.



----

This table covers pros and cons for the  approaches mentioned above:

```verbatim
                         Using Lab       Binder   CoCalc    Local Installation
Setup ease                  ✓              ✓        ×              ×

Speed                       ✓              ×        ✓              ✓

Persistence of work         ×              ×        ✓              ✓

Free                        ✓              ✓       $14             ✓

Use at home                 ×              ✓        ✓              ✓
```




## The projects for MTH 229

There are ten "projects" for this class.
See all projects at [https://github.com/mth229/229-projects](https://github.com/mth229/229-projects).

The projects provide some background details *and* are notebooks for you to answer the accompanying questions. The questions are asked and answered through your `WeBWorK` login.


These projects may be accessed without a login or any special privledges through  [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/mth229/229-projects/master).


There are some longer notes available for each project, linked to below. 


-----

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




#### Questions and Answers

Question and answers are now presented and completed through  `WeBWork`.
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

* `plot(f, a, b)` to plot `f` over `[a,b]`; `plot!(g)` to add a curve (using `Plots`, `SimplePlots`, or `Makie`)
* `plot([f,g], a, b)` to plot both `f` and `g` over the interval `[a,b]`
* `fzero(f, a, b)` to find a zero inside the bracketing interval `[a,b]` (from `Roots`)
* `fzeros(f, a, b)` to find all the real zeros of a function `f` in `[a,b]` (from `Roots`)
* `limit(f, c)` to find the limit of `f` at `c` (from `SymPy`)
* `f'`  to return a function that computes the derivative of `f` (Added in the `MTH229` package based on the `derivative` function from the `ForwardDiff` package)
* `diff(f)` to find a symbolic derivative of `f` (from `SymPy`)
* `fzero(f, a)` to search for a zero of `f` starting at `a`
* `quadgk(f, a, b)` to find the numeric integral of `f` over `(a,b)`
  (from the `QuadGK` package)
* `integrate(f)` to find the symbolic integral of `f` (from the `SymPy` package)
* `integrate(f, a, b)` to find the definite integral over `[a,b]`
  symbolically (from the `SymPy` package).


With just this basic set of actions, akin to buttons on the calculator, a rich variety of problems can be addressed.


