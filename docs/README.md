# MatLang Documentation
To access documentation go to this link:
https://juliamatlab.github.io/MatLang/dev

## docs folder
These are the source files that are used for building the documentation.

## To build the documentation locally

### Running inside Julia REPL:
cd to docs folder `cd("path to docs\\MatLang\\docs")` and run the following command:
```
include("makeLocal.jl") 
```

### Running inside OS Terminal:
cd to docs folder using OS terminal and run the following command (julia path should be added to OS path):
```
julia --color=yes makeLocal.jl
```

Alternatively you can use make.jl but using the following method:
cd to package folder using OS terminal and run the following commands:
```
julia -e 'using Pkg; Pkg.activate(); push!(LOAD_PATH, pwd());'
julia --project=docs/ -e 'using Pkg; Pkg.activate();  push!(LOAD_PATH,pwd());'

julia --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate();'
julia --project=docs/ --color=yes docs/make.jl
```
Julia path should be added to OS path


## To build the documentation online using Travis
This Travis script is used:
```
- julia --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd()));
                                               Pkg.instantiate()'
- julia --project=docs/ docs/make.jl
```