
<script>
\\ ```{r echo=FALSE}
\\ f <- function(x) log(x) - .5
\\ plot.new()
\\ xlim=c(.75, exp(.75))
\\ plot.window(xlim=xlim, ylim=f(xlim))
\\ x <- seq(xlim[1], xlim[2], length=1000)
\\ lines(x, f(x))
\\ abline(h=0, col="gray")

\\ x0 = exp(.5) - .45
\\ g = function(x) 1/x
\\ tangent = function(x) f(x0) + g(x0)*(x-x0)
\\ curve(tangent, add=TRUE, col="gray70")

\\ x1 = x0 - f(x0)/g(x0)
\\ text(x1, 0, expression(x[n+1]), pos=3)
\\ text(x0, 0, expression(x[n]), pos=3)
\\ text(exp(.5), 0, "zero", pos=1, offset=1)

\\ text(xlim[1], f(x0), expression(f(x[n])))

\\ lines(c(x0, x0), c(0, f(x0)), lty=2, col="gray70")
\\ lines(c(xlim[1] + .075, x0), c(f(x0), f(x0)), lty=2, col="gray70")
\\ ```
</script>


<script>
\\ ```{r echo=FALSE}
\\ ## helper function for plotting
\\ plot_nm <- function(f, fp, x0, from, to, diff_tol=NA, max_ctr=25) {

\\   tol = 1/1000

\\   xs <- c(x0); ys <- c(0)
\\   ctr <- 0
\\   x = x0
  
\\   while(ctr < max_ctr && abs(f(x)) > tol) {
\\     xs <- c(xs, x); ys <- c(ys, f(x))

\\     x = x - f(x)/fp(x)

\\     xs <- c(xs, x); ys <- c(ys, 0)

\\     ctr = ctr + 1
\\   }

\\   curve(f, from, to, bty="L")
\\   lines(xs, ys, lty=2, col="gray")
\\   abline(h=0)

\\   points(xs[1], 0, pch=17, cex=1.4)
\\   points(x, 0, pch=16, cex=1.4)
  
\\   if(!is.na(diff_tol)) {
\\     xs = xs[which(ys == 0)]
\\     ind = c(1, 1 + which(abs(diff(xs)) > diff_tol))
    
\\     for(i in ind)
\\       text(xs[i], 0, sprintf("x[%s]", i-1), pos=1)
\\   }
  
\\ }
\\ f <- function(x) sin(x) - x/4
\\ fp <- function(x) cos(x) - 1/4
\\ plot_nm(f, fp, 2*pi, -15, 20)
\\ ```
</script>




<script>
\\ ```{r echo=FALSE}
\\ cbrt = function(x) sign(x)*abs(x)^(1/3)
\\ f = function(x) cbrt(x)
\\ fp = function(x) (1/3)* 1/cbrt(x)^2

\\ plot_nm(f, fp, 1, -16, 16, diff_tol=1, max_ctr=4)
\\ ```
</script>
