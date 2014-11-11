srand(10)
sample(n) = ifloor(n*rand()) + 1 #  return value in 1:n
shuffle(n) = sortperm(rand(n))   # random permutation of 1,...,n

## p1
a1, c1 = ifloor(10*rand()) + 1, ifloor(10*rand()) + 1
b1 = 4 * a1 + c1 + ifloor(10*rand())
@assert b1^2 - 4*a1 * c1 >= 0 # need real roots


## p2
a2, b2, c2 = 5,4,3
@assert a2 != b2
@assert b2 != c2


using Mustache
tpl = "p1.mmd"


print(render(Mustache.template_from_file("p1.mmd")))
