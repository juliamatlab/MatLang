# MatLang
API for Matlab's language fundamental functions

[![Build Status](https://travis-ci.com/juliamatlab/MatLang.svg?branch=master)](https://travis-ci.com/juliamatlab/MatLang)
[![Build status](https://ci.appveyor.com/api/projects/status/vempmfhwcyma2omm?svg=true)](https://ci.appveyor.com/project/aminya/matlang)
[![codecov](https://codecov.io/gh/juliamatlab/MatLang/branch/master/graph/badge.svg)](https://codecov.io/gh/juliamatlab/MatLang)

# For Usage
Add the package
```jl
]add https://github.com/juliamatlab/MatLang
```
Use the package:
```jl
using MatLang
```
# For developement
clone the project in your usual way, or using the following command which clones the project in .julia\dev\MatLang
```jl
] dev https://github.com/juliamatlab/MatLang
```
cd to cloned package. if you used dev command, run the following:
```jl
cd("$(homedir())\\.julia\\dev\\MatLang")
```
Activate the package:
```jl
] activate .
```
Then use test.jl file in test folder. It uses Revise.jl for quick testing without the need for restarting
