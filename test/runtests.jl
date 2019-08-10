# ] add Revise # if you don't have it

path=pwd()
if path[end-6:end] != "MatLang"
    error("cd(to the MatLang path)")
else
    push!(LOAD_PATH, ".")
    using Revise
    using MatLang
    using Test
end

# usage
clcM()

# tests
@testset "MatLang.jl" begin
    1==1
end
