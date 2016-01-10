## process ipynb files

## glob .jmd files

using WeavePynb

mmd_files = filter(x->ismatch(r"mmd",x), readdir())
md_files = map(x -> replace(x, r"mmd$", "md"), mmd_files)
ipynb_files = map(x -> replace(x, r"mmd$", "ipynb"), mmd_files)

for (j,m) in zip(mmd_files, md_files)
    println("process $j")
    cmd = "using WeavePynb; mmd_to_latexq(\"$j\");"
    run(`julia -e "$cmd"`)  
    cmd = "using WeavePynb; markdownToPynb(\"$m\");"
    run(`julia -e "$cmd"`)  
end
