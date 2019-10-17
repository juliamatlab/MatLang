# MatLang
API for Matlab's language core functions

[![Dev Doc](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliamatlab.github.io/MatLang/dev)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](https://travis-ci.com/juliamatlab/MatLang.svg?branch=master)](https://travis-ci.com/juliamatlab/MatLang)
[![Build status](https://ci.appveyor.com/api/projects/status/vempmfhwcyma2omm?svg=true)](https://ci.appveyor.com/project/aminya/matlang)

# Documentation
[![Dev Doc](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliamatlab.github.io/MatLang/dev)

# Installation
Add the package
```julia
using Pkg
Pkg.add("MatLang")
```
# Usage
Use the package:
```julia
using MatLang
```

# List of implemented Functions
#### Language_Fundamentals :
<table>
    <tr>
        <td></td>
        <td>Sub Package</td>
        <td></td>
    </tr>
    <tr>
        <td>1</td>
        <td>Entering_Commands</td>
        <td>clcM</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Matrices_and_Arrays</td>
        <td>zerosM, onesM, randM, eyeM, trueM, falseM, diagM, catM, horzcatM, vertcatM, repelemM(limited), repmatM, linspaceM, logspaceM, meshgridM, ndgridM, freqspaceM, lengthM, sizeM, numelM, isscalarM, isvectorM, ismatrixM, isrowM, iscolumnM, isemptyM, sortM, flipM, fliplrM, flipudM, flipdimM, rot90M, transposeM, squeezeM</td>
    </tr>
    <tr>
        <td>3</td>
        <td>Data Types/Numeric Types</td>
        <td>doubleM, singleM, int8M, int16M, int32M, int64M, uint8M, uint16M, uint32M, uint64M</td>
    </tr>
</table>

To see the full progress see this link: https://github.com/juliamatlab/MatLang/projects

The full list of the functions that will be implemented in the future can be found [here](https://github.com/juliamatlab/MatLang/projects) or [here](https://www.mathworks.com/help/matlab/referencelist.html;jsessionid=e221a09e47ed26d2b333ea600f68?type=function)

# Development
clone the project in your usual way, or using the following command which clones the project in `.julia\dev\MatLang`
```julia
] dev MatLang
```
cd to cloned package. if you used dev command, run the following:
```julia
cd("$(homedir())\\.julia\\dev\\MatLang")
```
Activate the package:
```julia
] activate .
```
Set `developing` variable to `true` in the files in `test` and `usage` folder.
```julia
developing = true
```
Set `developing` variable to `false` before committing (for a successful CI build).

The package uses `Revise` for quick testing without the need for restarting.
