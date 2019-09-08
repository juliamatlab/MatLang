# To build documentation:
# cd to docs folder using OS terminal and run the following command:
# julia --color=yes make.jl
# julia path should be added to OS path


# Because MatLang package is not registered yet:
using Pkg
pkg"activate .."
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

    ],
    repo="https://github.com/juliamatlab/MatLang/blob/{commit}{path}#L{line}",
    sitename="MatLang",
    authors="Amin Yahyaabadi - JuliaMatlab",
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(;
    repo="github.com/juliamatlab/MatLang.git",
)
