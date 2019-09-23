using Documenter, MatLang

makedocs(;
    modules=[MatLang],
	format = Documenter.HTML(
        prettyurls = prettyurls = get(ENV, "CI", nothing) == "true",
    ),
    pages=[
        "Home" => "index.md",
		"Functions" =>
			["Functions List" => "functions.md",
			"Functions Explanations and Examples" =>
				["Entering Commands" => "functions/Entering_Commands.md",
				"Matrices and Arrays" => "functions/Matrices_and_Arrays.md",
				"Numeric Types" => "functions/Numeric_Types.md"],],
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
deploydocs(;
    repo="github.com/juliamatlab/MatLang.git",
)
