# MatLang
API for Matlab's language core functions

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](https://travis-ci.com/juliamatlab/MatLang.svg?branch=master)](https://travis-ci.com/juliamatlab/MatLang)
[![Build status](https://ci.appveyor.com/api/projects/status/vempmfhwcyma2omm?svg=true)](https://ci.appveyor.com/project/aminya/matlang)
[![codecov](https://codecov.io/gh/juliamatlab/MatLang/branch/master/graph/badge.svg)](https://codecov.io/gh/juliamatlab/MatLang)


# Installation
Add the package
```julia
]add https://github.com/juliamatlab/MatLang
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
        <td>zerosM</td>
        <td>onesM</td>
        <td>randM</td>
        <td>eyeM</td>
        <td>diagM</td>
        <td>blkdiagM</td>
    </tr>
</table>

The full list of the functions that will be implemented in the future can be found [here](https://www.mathworks.com/help/matlab/referencelist.html;jsessionid=e221a09e47ed26d2b333ea600f68?type=function)

# Development
clone the project in your usual way, or using the following command which clones the project in `.julia\dev\MatLang`
```julia
] dev https://github.com/juliamatlab/MatLang
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