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

using Weave

jmd_files = filter(x-> occursin(r"\.jmd$", x), readdir())
for f ∈ jmd_files
    weave(f, css="admonition.css", cache=:off, fig_path=tempdir())
end

#html_files = map(x -> replace(x, r"md$" => "html"), md_files)

# using WeavePynb
# for (m,h) in zip(md_files, html_files)
#     occursin("index", m) && continue
#     if mtime(h) == 0.0 || (mtime(m) > mtime(h))
#         println("process $m")
#         markdownToHTML(m)
#     end
# end
