## process ipynb files

## glob .jmd files
using Glob
using WeavePynb

mmd_files = glob("*.mmd")
md_files = map(x -> replace(x, r"mmd$", "md"), mmd_files)
ipynb_files = map(x -> replace(x, r"mmd$", "ipynb"), mmd_files)

for (j,m) in zip(jmd_files, md_files)
    println("process $j")
    cmd = "using WeavePynb; mmd_to_latexq(\"$j\");"
    run(`julia -e "$cmd"`)  
    cmd = "using WeavePynb; markdownToPynb(\"$m\");"
    run(`julia -e "$cmd"`)  
end
