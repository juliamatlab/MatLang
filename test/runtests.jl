# path=pwd()
# if path[end-6:end] != "MatLang"
# 	error("cd(to the MatLang path)")
# end

push!(LOAD_PATH, ".")
using Revise
using MatLang
using Test

# tests
@testset "MatLang.jl" begin

    @test zerosM([2,3])==zerosM((2,3))
    @test onesM([2,3])==onesM((2,3))
    @test eyeM(2,3)==[1 0 0; 0 1 0]
    @test diagM([2,3,4],1)==[0 2 0 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
    @test diagM([1 2 3; 4 5 6; 7 8 9])==[1;5;9]

end


@testset "Julia functions with M suffix" begin


end
