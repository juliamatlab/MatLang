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


## Contribution - Coding Standard
For coding standard please refer to [Coding Standard](https://github.com/juliamatlab/Julia-Matlab-Master/blob/master/Coding-Standard.md).
Feel free to contribute to this multi-field project. We need developers from different backgrounds to provide Matlab friendly API and wrappers.

Separate repositories are created for each toolbox. To provide fast and efficient wrappers please follow: https://docs.julialang.org/en/v1/manual/performance-tips/#Write-%22type-stable%22-functions-1