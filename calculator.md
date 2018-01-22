# Julia as a calculator

## Introduction


The programming language `Julia` (www.julialang.org) is a new language
that builds on a long history of so-called dynamic scripting languages
(DSLs).  DSLs are widely used for exploratory work and are part of the
toolbox of most all data scientists, a rapidly growing area of
employment. The basic `Julia` language is reminiscent of is `MATLAB`,
though it offers many improvements over that language. For these
notes, the focus will be on its more transparent syntax, but in
general a major selling point of `Julia` is that it is much faster
that `MATLAB` at many tasks.  (Well it should be, `MATLAB` was started
back in the 70s.) Even better, `Julia` is an open-source project which
means it is free to download and install, unlike the commercial
package `MATLAB`.


These notes will use `Julia` to explore calculus concepts. Unlike some
other programs used with calculus (e.g., Mathematica, Maple, and Sage)
`Julia` is not a symbolic math language. Rather, we will use a numeric
approach. This gives a different viewpoint on the calculus material
supplementing that of the text book. Though there are a few
idiosyncrasies we will see along the way, for the most part the
`Julia` language will be both powerful and easy to learn.


In this project we start with baby steps -- how to use `Julia` to
perform operations we can do on the calculator. The use of a
calculator requires knowledge about several things we take for granted
here:

* the use of the basic math operators

* an understanding of the  order of operations, or knowing when parentheses are needed

* how to use the buttons that compute functions such as the sine function

* and how to use the memory feature to store intermediate computations.

Parallells of each of these will be discussed in the following.


## Expressions


`Julia` can replicate the basics of a calculator with the standard
notations. The familiar binary operators are `+`, `-`, `*`, `/`, and
`^`.  With a calculator you "punch" in numbers and operators and to
get an answer push the `=` key. Using `Julia` is not much different:
you type in an expression then send to `Julia` to compute. The "equals
key" on a calculator is replaced by the *enter* key on the keyboard
(or *shift-enter* if using `IJulia`). Beyond that there isn't much
difference.

For example, to add two and two we simply execute:

```
2 + 2
```


Or to convert $70$ degrees to Celsius with the standard formula $C=5/9(F-32)$:

```
(5/9)*(70 - 32)
```

Of to find a value of $32 - 16x^2$ when $x=1.5$:

```
32 - 16*(1.5)^2
```


To find the value of $\sqrt{15}$ we can use  power notation:

```
15^(1/2)
```





### Practice


#### Question

Compute $22/7$ in `Julia`.

```
val = 22/7
numericq(val, 1e-5)
```


#### Question

Compute $\sqrt{220}$ in `Julia`.

```
val = sqrt(220)
numericq(val, 1e-5)
```

#### Question

Compute $2^8$ in `Julia`.

```
val = 2^8
numericq(val, 1e-5)
```




## Precedence

One drawback about using a calculator is the expression gets evaluated
as it gets entered. For simple computations this is a convenience, but
for more complicated ones it requires some thinking about the order of
how an expression will be computed. In `Julia` you still need to be
mindful of the order that operations are carried out, but as the
entire expression is typed -- and can be edited -- before evaluation,
you can more closely control what you want.



*Order of operations* refers to conventions used to decide which
operation will happen first, when there is a choice of more than
one. A simple example, is what is the value of $3 \cdot 2 + 1$?

There are two *binary* operations in this expressions: a
multiplication and an addition. Which is done first and which second?

In some instances the order used doesn't matter. A case of this would
be $3 + 2 + 1$. This is because addition is *associative*. (Well, not
really on the computer, but that is another lesson.) In the case of $3
\cdot 2 + 1$ the order certainly matters.

For $3 \cdot 2 + 1$ if we did the addition first, the expression would be
$9 = 3\cdot 3$. If we did the multiplication first, the value would be
$7=6+1$. In this case, we all know that the correct answer is $7$, as
we perform multiplication before addition, or in more precise terms
the *precedence* of multiplication is higher than that of addition.

### Basics of PEMDAS


The standard order of the basic mathematical operations is remembered
by many students through the mnemonic PEMDAS, which can be misleading,
so we spell it out here:

* (`P`) First parentheses 
* (`E`) then exponents (or powers) 
* (`MD`) then multiplication or division
* (`AS`) then addition or subtraction.


This has the precedence of multiplication (part of `MD`) higher than that of
subtraction (part of `AS`), as just mentioned.


Applying this, if we have the mathematical expression

$$~
\frac{12 - 10}{2}
~$$

We know that the subtraction needs to be done before the division, as
this is how we interpret this form of division. How to make this
happen? The precedence of parentheses is used to force the subtraction
before the division, as in `(12-10)/2`. Without parentheses you get a
different answer:

```
(12 - 10)/2,  12 - 10/2
```

```
alert("""

Using a comma to separate expressions will cause both to print out --
not just the last one evaluated. This trick is also a useful trick
within an `IJulia` notebook.

""")
```		

> Parentheses are used to force lower precedence operations to happen
> before higher precedence ones.


### Same precedence -- what to do 


There is a little more to the story, as we need to understand what
happens when we have more then one operation with the same level. For
instance, what is $2 - 3- 4$? Is it $(2 - 3) - 4$ or $2 - (3 - 4)$. 

Unlike addition, subtraction is *not associative* so this really
matters.  The subtraction operator is [left
associative](http://en.wikipedia.org/wiki/Operator_associativity)
meaning the evaluation of $2 - 3 - 4$ is done by $(2-3) - 4$. The
operations are performed in a left-to-right manner. Most -- but not
all operations -- are left associative, some are right associative and
performed in a right-to-left manner.

```
alert("""

**right to left** It is the order of which operation is done first,
  not reading from right to left, as one might read Arabic.

""")
```


To see that `Julia` has left associative subtraction, we can just
check. 

```
2 - 3 - 4, (2 - 3) - 4, 2 - (3 - 4)
```


Not all operations are processed left-to-right. The power operation,
`^`, is *right associative*, as this matches the mathematical
usage. For example:

```
4^3^2, (4^3)^2, 4^(3^2)
```


What about the case where we have different operations with the same
precedence? What happens then? A simple example would be $2 / 3 * 4$?
Is this done in a left to right manner as in:

```
(2 / 3) * 4
```

Or a right-to-left manner, as in:

```
2 / (3 * 4)
```

And the answer is *left-to-right*:

```
2 / 3 * 4
```

### Practice

#### Question

Wich of the following is a valid `Julia` expression for 

$$~
\frac{3 - 2}{4 - 1}
~$$ 

that uses the least number of parentheses?

```
choices = ["`(3 - 2)/ 4 - 1`", "`3 - 2 / (4 - 1)`", "`(3 - 2) / (4 - 1)`"]
ans = 3
radioq(choices, ans)
```




#### Question

Wich of the following is a valid `Julia` expression for 

$$~
\frac{3\cdot2}{4}
~$$ 

that uses the least number of parentheses?

```
choices = ["`3 * 2 / 4`", "`(3 * 2) / 4`"]
ans = 1
radioq(choices, ans)
```


#### Question

Wich of the following is a valid `Julia` expression for 

$$~
2^{4 - 2}
~$$ 

that uses the least number of parentheses?

```
choices = ["`2 ^ 4 - 2`", "`(2 ^ 4) - 2`", "`2 ^ (4 - 2)`"]
ans = 3
radioq(choices, ans)
```



#### Question

One of these three expressions will produce a different answer, select
that one:

```
choices = [
"`2 - 3 - 4`",
"`(2 - 3) - 4`",
"`2 - (3 - 4)`"
];
ans = 3;
radioq(choices, ans)
```


#### Question

One of these three expressions will produce a different answer, select
that one:

```
choices = [
"`2 - 3 * 4`",
"`(2 - 3) * 4`",
"`2 - (3 * 4)`"
];
ans = 2;
radioq(choices, ans)
```




#### Question <small>Unary operator: the minus sign</small>

One of these three expressions will produce a different answer, select
that one:

```
choices = [
"`-1^2`",
"`(-1)^2`",
"`-(1^2)`"
];
ans = 2;
radioq(choices, ans)
```


#### Question

Compute the value of 

$$~
\frac{9 - 5 \cdot (3-4)}{6 - 2}.
~$$

```
val = (9-5*(3-4)) / (6-2)
numericq(val, .001)
```


#### Question

Compute the following using `Julia`:

$$~
\frac{(.25 - .2)^2}{(1/4)^2 + (1/3)^2}
~$$

```
ans = (.25 - .2)^2/((1/4)^2 + (1/3)^2);
numericq(ans)
```



#### Question

Compute the decimal representation of the following using `Julia`:

$$~
1 + \frac{1}{2} + \frac{1}{2^2} + \frac{1}{2^3} + \frac{1}{2^4}
~$$

```
ans = sum((1/2).^(0:4));
numericq(ans)
```



#### Question

Compute the following using `Julia`:

$$~
\frac{3 - 2^2}{4 - 2\cdot3}
~$$

```
ans = (3 - 2^2)/(4 - 2*3);
numericq(ans)
```



#### Question

Compute the following using `Julia`:

$$~
(1/2) \cdot 32 \cdot 3^2 + 100 \cdot 3 - 20
~$$

```
ans = (1/2)*32*3^2 + 100*3 - 20;
numericq(ans)
```


## Using functions

Most all calculators used are not limited to these basic arithmetic
operations. So-called scientific calculators provide buttons for many
of the common mathematical functions, such as exponential, logs, and
trigonometric functions. `Julia` provides these too, of course. 

There are special functions to perform common powers. For example, the
square-root function is used as:

```
sqrt(15)
```



This shows how to evaluate a function -- using its name and
parentheses, as in `function_name(arguments)`. Parentheses are also
used to group expressions, as would be done to do this using the power
notation:

```
15^(1/2)
```


Additionally, parentheses are also used to make "tuples", a concept we
don't pursue here but that is important for programming with
`Julia`. The point here is the context of how parentheses are used is
important, though for the most part the usage is the same as their
dual use in your calculus text.


Like `sqrt`, there is also a cube-root function:

```
cbrt(27)
```

The `cbrt` and `sqrt` functions are not exactly the same as using `^`, as they
differ when the inputs are not in their domain:
For cube roots, we can see that there is a difference with negative bases:

```
cbrt(-8)			## correct
```

```
(-8)^(1/3)		        ## need first parentheses, why?
```

(The latter is an error as the power function has an output type that
depends on the power being real, not a specific value of a real. For
1/2 the above would clearly be an error, so then for 1/3 `Julia` makes
this an error.)


### trigonometric functions



The basic trigonometric functions in `Julia` work with radians:

```
sin(pi/4)
cos(pi/3)
```

But students think in degrees. What to do? Well, you can always
convert via the ratio $\pi/180$:

```
sin(45 * pi/180)
cos(60 * pi/180)
```

However, `Julia` provides the student-friendly functions `sind`,
`cosd`, and `tand` to work directly with degrees:

```
sind(45)
cosd(45)
```

Be careful, an expression like $\cos^2(\pi/4)$ is a shorthand for
squaring the output of the cosine of $\pi/4$, hence is expressed with

```
cos(pi/4)^2			# not cos^2(pi/4) !!!
```


### Inverse trigonometric function

The math notation $\sin^{-1}(x)$ is also a source of confusion. This
is **not** a power, rather it indicates an *inverse* function, in this
case the arcsine. The arcsine function is written `asin` in `Julia`.

For certain values, the arcsine and sine function are inverses:

```
asin(sin(0.1))		
```

However, this isn't true for all values of $x$, as $\sin(x)$ is not
monotonic everywhere. In particular, the above won't work for $x$
values outside $(-\pi/2, \pi/2)$:

```
asin(sin(100))
```

Other inverse trigonometric functions are `acos`, `atan` and for
completeness `asec`, `acsc`, and `acot` are available for use.


### Exponential and logs

The values $e^x$ can be computed with the built-in constant `e`:

```
e^2
```

Or through the function `exp(x)`:

```
exp(2)
```

As, `e` can be redefined, it is best to use the latter style, though
it takes a bit more typing.

The logarithm function, `log` does log base $e$:

```
log(exp(2))
```

To do base 10, there is a `log10` function:

```
log10(e^2)
```

There is also a `log2` function for base 2. However, there are many more possible choices for a base. Rather than create functions for each possible one of interest the `log` function has an alternative form taking *two argument*. The first is interpreted as the base, the second the $x$ value. So the above, is also done through:


```
log(10, exp(2))
```


### Some useful functions

There are some other useful functions For example, `abs` for the
absolute value, `round` for rounding, `floor` for rounding down and
`ceil` for rounding up. Here are some examples


```
round(3.14)
```

```
floor(3.14)
```

```
ceil(3.14)
```

The observant eye will notice the answers above are not integers. (We
discuss how to tell later.)  What to do if you want an integer? These
functions take a "type" argument, as in `rount(Int, 3.14)`. 


### Practice

#### Question

What is the value of $\sin(\pi/10)$?

```
numericq(sin(pi/10))
```


#### Question

What is the value of $\sin(52^\circ)$?

```
numericq(sind(52))
```


#### Question

Is $\sin^{-1}(\sin(3\pi/2))$ equal to $3\pi/2$?

```
booleanq(false, labels=["yes", "no"])
```

#### Question

What is the value of `round(3.5000)`

```
numericq(round(3.5))
```




#### Question

What is the value of `sqrt(32 - 12)`

```
numericq(sqrt(32-12))
```


#### Question

Which is greater $e^\pi$ or $\pi^e$?


```
choices = [
"`e^pi`",
"`pi^e`"
];
ans = e^pi - pi^e > 0 ? 1 : 2;
radioq(choices, ans)
```


#### Question

What is the value of $\pi - (x - \sin(x)/\cos(x))$ when $x=3$?



```
x = 3;
ans = x - sin(x)/cos(x);
numericq(pi - ans)
```






## Variables

With a calculator, one can store values into a *memory* for later
usage. This useful feature with calculators is greatly enhanced with
computer languages, where one can bind, or assign, a variable to a
value. For example the command `x=2` will bind `x` to  the value $2$:

```
x = 2
```

So, when we evaluate

```
x^2
```

The value assigned to `x` is looked up and used to return $4$.

The word "dynamic" to describe the `Julia` language refers to the fact
that variables can be reassigned and retyped. For example:

```
x = sqrt(2) ## a Float64 now
```


 
In `Julia` one can have single letter names, or much longer ones, such as

```
some_ridiculously_long_name = 3
```

```
some_ridiculously_long_name^2
```

The basic tradeoff being: longer names are usually more expressive and
easier to remember, whereas short names are simpler to type. To get a
list of the currently bound names, the `whos` function may be
called. Not all names are syntactically valid, for example names can't
begin with a number or include spaces.


```

alert(""" 

In fact, only *most* objects bound to a name can be arbitrarily
redefined. When we discuss functions, we will see that redefining
functions can be an issue and new names will need to be used. As such,
it often works to stick to come convention for naming: numbers use
values like `i`, `j`, `x`, `y`; functions like `f`, `g`, `h`, etc.

""")
```


To work with computer languages, it is important to appreciate that
the equals sign in the variable assignment is unlike that of
mathematics, where often it is used to indicate an equation which may
be solved for a value. With the following computer command the right
hand expression is evaluated and that value is assigned to the
variable. So,

```
x = 2 + 3
```

does not assign the expression `2 + 3` to `x`, but rather the
evaluation of that expression, which yields 5. (This also shows that
the precedence of the assignment operator is *lower* than addition, as
addition is performed first in the absence of parentheses.)



### Multiple assignments


At the prompt, a simple expression is entered and, when the *return*
key is pressed, evaluated.  At times we may want to work with multiple
subexpressions. A particular case might be setting different
parameters:

```
a=0
b=1
```

Multiple expressions can be more tersely written by separating each expression using a semicolon:

```
a=0; b=1;
```


Note that `Julia` makes this task even easier, as one can do
multiple assignments via "tuple destructuring:"

```
a, b  = 0, 1		## printed output is a "tuple"
a + b
```



### Practice

#### Question

Let $a=10$, $b=2.3$, and $c=8$. Find the value of $(a-b)/(a-c)$.

```
a,b,c = 10, 2.3, 8;
numericq((a-b)/(a-c))
```


#### Question

What is the answer to this computation?

```verbatim
a = 3.2; b=2.3
a^b - b^a
```


```
a = 3.2; b=2.3;
val = a^b - b^a;
numericq(val)
```



#### Question

For longer computations, it can be convenient to do them in parts, as
this makes it easier to check for mistakes. (You likely do this with
your calculator.)

For example, to compute

$$~
\frac{p - q}{\sqrt{p(1-p)}}
~$$

for $p=0.25$ and $q=0.2$ we might do:



```verbatim
p, q = 0.25, 0.2
top = p - q
bottom = sqrt(p*(1-p))
ans = top/bottom
```

What is the result of the above?

```
p, q = 0.25, 0.2;
top = p - q;
bottom = sqrt(p*(1-p));
ans = top/bottom;
numericq(ans)
```





## Numbers

In mathematics, there a many different types of numbers. Familiar ones
are integers, rational numbers, and the real numbers. In addition,
complex numbers are needed to fully discuss polynomial functions. This
is not the case with calculators.

Most calculators treat all numbers as floating point numbers -- an
approximation to the real numbers.  Not so with `Julia`.  `Julia` has
types for many different numbers: `Integer`, `Real`, `Rational`,
`Complex`, and specializations depending on the number of bits that
are used, e.g., `Int64` and `Float64`. For the most part there is no
need to think about the details, as values are promoted to a common
type when used together. However, there are times where one needs to
be aware of the distinctions.

### Integers and floating point numbers


In the real number system of mathematics, there are the familiar real
numbers and integers. The integers are viewed as a subset of the real
numbers.

Julia provides types `Integer` and `Real` to represent these
values. (Actually, the `Integer` type represents more than one actual
storage type, either `Int32` or `Int64`.) These are separate
types. The type of an object is returned by `typeof()`.

For example, the integer $1$ is simply created by the value `1`:

```
1
```

The floating point value $1$ is specified by using a decimal point:

```
1.0
```

The two values are printed differently -- integers never have a
decimal point, floating point values always have a decimal point.
This emphasizes the fact that the two values `1` and `1.0` are not the
same -- they are stored differently, they print differently, and can
give different answers. In most cases -- but not all -- uses they can
be used interchangeably.

For example, we can add the two:

```
1 + 1.0
```

This gives back the floating point value `2.0`. First the integer and floating point value are promoted to a common type (floating point in this case) and then added. 

Powers are different. This value will be an error `10^(-2)`, but `10.0^(-2)` will not. 

> In base `Julia`, if possible,  functions are [type stable](http://docs.julialang.org/en/latest/manual/faq/#why-does-julia-give-a-domainerror-for-perfectly-sensible-operations). This means, the type of the output depends 
> on the type of the input -- not the value. In this case, integer powers and bases
> are expected to return integer answers, which $10^{-2}$ is not.




When a computer is used to represent numeric values there are
limitations: a computer only assigns a finite number of bits for a
value. This works great in most cases, but since there are infinitely
many numbers, not all possible numbers can be represented on the
computer.

> The first limitation is numbers can not be arbitrarily large. 



Take for instance a 64-bit integer.  A bit is just a place in computer
memory to hold a $0$ or a $1$. Basically one bit is used to record the
sign of the number and the remaining 63 to represent the numbers. This
leaves the following range for such integers $-2^{63}$ to $2^{63} -
1$.


`Julia` is said to not provide training wheels. This means it doesn't
put in checks for integer overflow, as these can slow things down. To
see what happens, let just peek:

```
2^62				## about 4.6 * 10^18
2^63				## negative!!!
```

So if working with really large values, one must be mindful of the difference -- or your bike might crash!



<span class="label label-info">Gotchas</span>

Look at the output of 

```
2^3^4
```

Why is it 0? The value of $3^4=81$ is bigger than 63, so $2^{81}$ will overflow.

The following works though:

```
2.0 ^ 3 ^ 4
```

This is because the value `2.0` will use floating point arithmetic
which has a much wider range of values. (The `Julia` documentation
sends you to this interesting blog post
[johndcook](http://www.johndcook.com/blog/2009/04/06/anatomy-of-a-floating-point-number/),
which indicates the largest floating point value is $2^{1023}(2 -
2^{-52})$ which is roughly `1.8e308`.


> Scientific notation is used to represent many numbers


A number in `Julia` may be represented in scientific notation. The
basic canonical form is $a\cdot 10^b$, with $1 \leq |a| < 10$
and $b$ is an
integer. This is written in `Julia` as `aeb` where `e` is used to
separate the value from the exponent. The value `1.8e308` means $1.8
\cdot 10^{308}$. Scientific notation makes it very easy to focus on
the gross size of a number, as the exponent is set off.



> The second limitation is numbers are often only an approximation.


This means expressions which are mathematically true, need not be true
once approximated on the computer. For example,  $\sqrt{2}$
is an irrational number, that is, its decimal representation does not
repeat the way a rational number does. Hence it is impossible to store
on the computer an exact representation, at some level there is a
truncation or round off. This will show up when you try something
like:

```
2 - sqrt(2) * sqrt(2)
```

That difference of basically $10^{-16}$ is roughly the machine
tolerance when representing a number. (One way to imagine this is
mathematically, we have two ways to write the number $1$:

$$~
0.\bar{9} = 0.9999... = 1
~$$

but on the computer, you can't have the "..." in a decimal expansion
-- it must truncate -- so instead values round to something like
$0.9999999999999999$ or $1$, with nothing in between.




<span class="label label-info">Comparing values</span>
 

A typical expression in computer languages is to use `==` to compare
the values on the left- and right-hand sides. This is not assignment,
rather a question. For example:

```
2 == 2
2 == 3
sqrt(2) * sqrt(2) == 2		## surprising?
```

The last one would be surprising were you not paying attention to the
last paragraph. Comparisons with `==` work well for integers and
strings, but not with floating point numbers. (For these the `isapprox`
function can be used.)


Comparisons do a promotion prior to comparing, so even though these
numbers are of different types, the `==` operation treats them as
equal:

```
1 == 1.0
```

The `===` operator has an even more precise notion of equality:

```
1 === 1.0
```



### Scientific notation

As mentioned, one can write `3e8` for  $3 \cdot 10^8$, but in fact
to `Julia` the two values `3e8` and `3*10^8` are not
quite the same, as one is stored in floating point, and one as an
integer. One can use `3.0 * 10.0^8` to get a floating point equivalent to `3e8`.



> Floating point includes the special values: `NaN`, `Inf`. (Not so with integers.)


Floating point contains two special values: `NaN` and `Inf` to
represent "not a number" and "infinity." These arise in some natural
cases:

```
1/0				## infinity. Also -1/0.
```

```
0/0				## indeterminate
```

These values can come up in unexpected circumstances. For example division by $0$ can occur due to round off errors:

```
x = 1e-17
x^2/(1-cos(x))			## should be about 2
```



### Rational numbers


In addition to special classes for integer and floating point values,
`Julia` has a special class for rational numbers, or ratios of
integers. To distinguish between regular division and rational
numbers, `Julia` has the `//` symbol to define rational numbers:

```
1//2
```

```
typeof(1//2)
```


As you know, a rational number $m/n$ can be reduced to lowest terms by
factoring out common factors. `Julia` does this to store its rational
numbers:

```
2//4
```

Rational numbers are used typically to avoid round off error when
using floating point values. This is easy to do, as `Julia` will
convert them when needed:


```
1//2 - 5//2                         ## still a rational
1//2 - sqrt(5)/2                    ## now a floating point
```



However, we can't do the following, as the numerator would be
non-integer when trying to make the rational number:

```
(1 - sqrt(5)) // 2
```

### Complex numbers

Complex numbers are an extension of the real numbers when the values
$i = \sqrt{-1}$ is added. Complex numbers have two terms: a real and
imaginary part. They are typically written as $a + bi$, though the
polar form $r\cdot e^{i\theta}$ is also used. The complex numbers have
the usual arithmetic operations defined for them.  

In `Julia` a complex number may be constructed by the `Complex` function:

```
z = Complex(1,2)
```

We see that `Julia` uses `im` (and not `i`) for the $i$. It can be
more direct to just use this value in constructing complex numbers:

```
z = 1 + 2im
```

Here we see that the usual operations can be done:

```
z^2, 1/z, conj(z)
```

The value of $i$ comes from taking the square root of $-1$. This is
almost true in `Julia`, but not quite. As the `sqrt` function will
return a real value for any real input, directly trying `sqrt(-1.0)`
will give a `DomainError`, as in $-1.0$ is not in the domain of the
function. However, the `sqrt` function will return complex numbers for
complex inputs. So we have:

```
sqrt(-1.0 + 0im)
```

Complex numbers have a big role to play in higher level
mathematics. In calculus, they primarily occur as roots of polynomial
equation.

### Practice

#### question

Compute the value of $2^{1023}(2 -2^{-52})$ using `2.0` -- not the integer `2`:

```
ans = 2.0^1022 * 2 *(2.0 - 2.0^(-52));
choices = [
"`-Inf`",
"Domain Error",
"`1.7976931348623157e308`"
];
ans = 3;
radioq(choices, ans, hint="You must use 2.0 -- not 2 to do this.")
```

#### question

The result of `sqrt(16)` is

```
choices = [
	"An integer",
	"A floating point number",
	"A rational number (fraction)"
	];
ans = 2;
radioq(choices, ans)
```


#### question

The result of 16^2` is

```
choices = [
	"An integer",
	"A floating point number",
	"A rational number (fraction)"
	];
ans = 1;
radioq(choices, ans)
```


#### question

The result of `1/2` is

```
choices = [
	"An integer",
	"A floating point number",
	"A rational number (fraction)"
	];
ans = 2;
radioq(choices, ans)
```



#### question

The result of `2/1` is

```
choices = [
	"An integer",
	"A floating point number",
	"A rational number (fraction)"
	];
ans = 2;
radioq(choices, ans)
```


#### question

Which number is `1.23e4`?

```
choices = [
	"1234",
	"12340",
	"12300"
	];
ans = 3;
radioq(choices, ans)
```


#### question

Which number is `-43e-2`?

```
choices = [
	"-0.43",
	"-4.30",
	"-43.0"
	];
ans = 1;
radioq(choices, ans)
```


#### question

What is the answer to the following:

```verbatim
val = round(3.4999999999999999);
```


```
numericq(val; hint="This value is indistinguishable from 3.5")
```

#### question

If you need more bits, `Julia` provides the `BigInt` and `BigFloat`
classes which give $256$ bits of precision. Using this allows one to compute $2^3^4$ precisely as an integer:

```verbatim
x = BigInt(2)
ans = x^3^4
```

What is the answer?

```
choices = [
"`2417851639229258349412352`",
"`2.4178516392292583e24`",
"`0`"
];
ans = 1;
radioq(choices, ans)
```



