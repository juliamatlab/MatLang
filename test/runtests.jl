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

    @test eyeM(2,3)==[1 0 0; 0 1 0]
    @test diagM([2,3,4],1)==[0 2 0 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
end


@testset "# Native Julia functions that are just a copy" begin

    @test zerosM(2,2)==zeros(2,2)
    @test onesM(2,2)==ones(2,2)

end
