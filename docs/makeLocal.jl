# make file only for local make of the document.
# this result in errors in Travis

# To build documentation locally:
# cd to docs folder using OS terminal and run the following command (julia path should be added to OS path):
# julia --color=yes makeLocal.jl

using Pkg
Pkg.activate();
push!(LOAD_PATH,"../src/")

#

using Documenter, MatLang

makedocs(;
    modules=[MatLang],
	format = Documenter.HTML(
        prettyurls = prettyurls = get(ENV, "CI", nothing) == "true",
    ),
    pages=[
        "Home" => "index.md",
        "Functions" => "functions.md",
        "Development - Contribution" => "development.md",
        "Native Julia noteworthy differences from MATLAB" => "juliavsmatlab.md"
    ],
    repo="https://github.com/juliamatlab/MatLang/blob/{commit}{path}#L{line}",
    sitename="MatLang",
    authors="Amin Yahyaabadi - JuliaMatlab",
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
# deploydocs(;
#     repo="github.com/juliamatlab/MatLang.git",
# )
