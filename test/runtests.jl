developing = false; # make it false for CI testing
if developing
	# ] add Revise # if you don't have it
	path = pwd()
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


@testset "MatLang.j - Entering_Commands" begin

end
@testset "MatLang.jl - Matrices_and_Arrays" begin
	@test trueM == true
	@test zerosM(2) == zeros(2, 2)
	@test zerosM(2, like = ones(Int32, 2, 2)) == zeros(Int32, 2, 2)
	@test zerosM([2, 3]) == zerosM((2, 3))
	@test zerosM(Int8, [2, 3]) == zerosM(Int8, (2, 3))
	@test onesM(2) == ones(2, 2)
	@test onesM([2, 3]) == onesM((2, 3))
	@test onesM(Int8, [2, 3]) == onesM(Int8, (2, 3))
	@test eyeM(2, 3) == [1 0 0; 0 1 0]
	@test eyeM(Int32, 2, 3) == [1 0 0; 0 1 0]
	@test eyeM(2, 3, like = ones(Int32, 2, 2)) == [1 0 0; 0 1 0]
	@test diagM([2, 3, 4], 1) == [0 2 0 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
	@test diagM([1 2 3; 4 5 6; 7 8 9]) == [1; 5; 9]
	@test blkdiagM(ones(2, 2), 2 * ones(2, 2)) == [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]
	@test blkdiagM(ones(2, 4), 2 * ones(3, 2)) == [ones(2, 4) zeros(2, 2); zeros(3, 4)  2 * ones(3, 2)]
	@test catM(1, ones(3, 3), zeros(3, 3), 2 * ones(3, 3)) == [ones(3, 3); zeros(3, 3); 2 * ones(3, 3)]
	@test horzcatM(ones(3, 3), zeros(3, 3)) == [ones(3, 3) zeros(3, 3)]
	@test repelemM([1 2 3 4], 3) == [1; 1; 1; 2; 2; 2; 3; 3; 3; 4; 4; 4]
	@test repmatM([1; 2], 3, 2) == [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]
	@test linspaceM(1, 10, 2) == 1:2:10
	@test logspaceM(1, 5, :equal) == 10.0.^(1:5)
	@test lengthM([2 3 4 5 6 7; 1 2 3 4 5 6]) == 6
	@test squeezeM(ones(2,1,2)) == [1 1; 1 1]
end
