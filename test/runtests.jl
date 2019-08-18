developing=false; # are you developing the package or just using? # make it false for CI testing
if developing
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

else
	using MatLang
	using Test
end
################################################################

# tests
@testset "MatLang.jl" begin
    @test zerosM(2)==zeros(2,2)
    @test zerosM([2,3])==zerosM((2,3))
    @test zerosM(Int8,[2,3])==zerosM(Int8,(2,3))
    @test onesM(2)==ones(2,2)
    @test onesM([2,3])==onesM((2,3))
    @test onesM(Int8,[2,3])==onesM(Int8,(2,3))
    @test eyeM(2,3)==[1 0 0; 0 1 0]
    @test eyeM(Int32,2,3)==[1 0 0; 0 1 0]
    @test diagM([2,3,4],1)==[0 2 0 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
    @test diagM([1 2 3; 4 5 6; 7 8 9])==[1;5;9]
    @test blkdiagM(ones(2,2),2*ones(2,2))==vcat(hcat(ones(2,2),zeros(2,2)),hcat(zeros(2,2),2*ones(2,2)))
end


@testset "Julia functions with M suffix" begin


end
