## process ipynb files

## glob .jmd files
using Glob
using WeavePynb

jmd_files = glob("*.jmd")
ipynb_files = map(x -> replace(x, r"jmd$", "ipynb"), jmd_files)

for (j,h) in zip(jmd_files, ipynb_files)
    if mtime(h) == 0.0 || (mtime(j) > mtime(h))	
      println("process $j")
      cmd = "using WeavePynb; markdownToPynb(\"$j\");"
      run(`julia -e "$cmd"`)  
    end    		       
end
