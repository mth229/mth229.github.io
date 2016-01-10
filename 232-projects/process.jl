## process ipynb files


mds = filter(x->ismatch(r"\.md$", x), readdir())
fs = map(x -> x[1:end-3], mds)
for f in fs
    println("Process $f")
	markdownToLaTeXQ("$f.md");
	markdownToPynb("$f.md")
end

