# ] add Revise # if you don't have it
# ] add Requires

path=pwd()
if path[end-6:end] != "MatLang"
	error("cd(to the MatLang path)")
end

push!(LOAD_PATH, ".")
using Revise
using MatLang
using Test

# usage
clcM()
