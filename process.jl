## ## process html files

## ## glob .jmd files
## using Glob
## jmd_files = glob("*.jmd")
## html_files = map(x -> replace(x, r"jmd$", "html"), jmd_files)

## for (j,h) in zip(jmd_files, html_files)
##     if mtime(h) == 0.0 || (mtime(j) > mtime(h))	
##       println("process $j")
##       cmd = "using Weave; markdownToHtml(\"$j\", out=\"$h\");"
##       run(`julia -e "$cmd"`)  
##     end    		       
## end

using WeavePynb

md_files = filter(x-> occursin(r"\.md$", x), readdir())
html_files = map(x -> replace(x, r"md$" => "html"), md_files)

for (m,h) in zip(md_files, html_files)
    if mtime(h) == 0.0 || (mtime(m) > mtime(h))	
        println("process $m")
        markdownToHTML(m)
    end    		       
end
