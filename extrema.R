## R code for extrema figure

plot.new()
plot.window(xlim=c(0,8), ylim=c(0,8))
draw_box = function(x, lty=x) {
 y = 10 - x
 col = topo.colors(10)[x]
 points(x,y, cex=2, pch=16, col=col)
 text(x,y, sprintf("A=%s", x*y), pos=4)
 polygon(c(0, x, x, 0), c(0,0,y,y), border=col, lwd=lty/4)
}
invisible(sapply(c(2,3,5,7), draw_box))
