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
# These tests don't test every single method. For more examples, refer to examples folder.

@testset "MatLang.j - Entering_Commands" begin

end
@testset "MatLang.jl - Matrices_and_Arrays" begin
	@test zerosM(:mat, 2) == zeros(2, 2)

	@test zerosM(:mat, 2, like = ones(Int32, 2, 2)) == zeros(Int32, 2, 2)

	@test zerosM([2, 3]) == zerosM((2, 3))

	@test zerosM(Int8, [2, 3]) == zerosM(Int8, (2, 3))

	@test onesM(:mat, 2) == ones(2, 2)

	@test onesM([2, 3]) == onesM((2, 3))

	@test onesM(Int8, [2, 3]) == onesM(Int8, (2, 3))

	@test falseM([2, 2]) == 0*trueM(:mat,2)

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

	@test meshgridM(1:2:5, 1:2:5)==([1 3 5;1 3 5; 1 3 5],[1 1 1; 3 3 3; 5 5 5])

	@test freqspaceM(10, dim = 1) == 0:0.2:1

	@test ndgridM(1:2:5, 1:2:5)==([1 1 1; 3 3 3; 5 5 5], [1 3 5;1 3 5; 1 3 5])

	@test lengthM([2 3 4 5 6 7; 1 2 3 4 5 6]) == 6

	@test sizeM(:arr, [2 3 4 5 6 7; 1 2 3 4 5 6]) == [2; 6]

	@test sizeM(rand(3, 5, 4), 2, 3) == (5, 4)

	@test numelM([1, 2, 3, 4]) == 4

	@test [
	    isscalarM(:mat, 1)
	    isscalarM(:mat, 5 * ones(1, 1, 1))
	    isscalarM(:mat, "H")
	    isscalarM(:mat, "Hi")
	    isscalarM(:mat, ["Hi"])
	    isscalarM(:mat, ["Hi" "Bye"])
	    isscalarM(:mat, 'H')
	] == [true; true; true; false; true; false; true]

	@test [
	    isvectorM(:mat, [1; 2; 3])
	    isvectorM(:mat, [1 2 3])
	    isvectorM(:mat, ones(3, 1))
	    isvectorM(:mat, ones(1, 3))
	    isvectorM(:mat, ones(3))
	    isvectorM(:mat, 1)
	    isvectorM(:mat, "Hi")
	    isvectorM(:mat, ["Hi", "Bye"])
	] == [true; true; true; true; true; true; true; true]

	@test [
	ismatrixM(:mat, [1 2 3; 3 5 6])
	ismatrixM(:mat, [1;2;3])
	ismatrixM(:mat, ones(3, 1))
	ismatrixM(:mat, ones(1, 3))
	ismatrixM(:mat, ones(3))
	ismatrixM(:mat, "Hi")
	ismatrixM(:mat, ["Hi", "Bye"])
	] == [true; true; true; true; true; true; true]

	@test [
	isrowM([1 2 3]) # true
	isrowM(ones(3, 1)) # false
	isrowM(ones(1, 3)) # true
	isrowM(ones(3)) # false
	isrowM(1) # false
	isrowM("Hi") # false
	isrowM(["Hi", "Bye"]) # false
	isrowM(["Hi" "Bye"]) # true
	] == [true; false; true; false; false; false; false; true]

	@test [

	iscolumnM([1; 2; 3]) # false
	iscolumnM([1 2 3]) # false
	iscolumnM(ones(3, 1)) # tue
	iscolumnM(ones(1, 3)) #false
	iscolumnM(ones(3)) # false
	iscolumnM(1) # false
	iscolumnM("Hi") # false
	iscolumnM(["Hi", "Bye"]) # false
	iscolumnM(["Hi" "Bye"]) # true

	] == [false; false; true; false; false; false; false; false; false]
	@test sortM([1 5 3; 4 1 10], 2, :ascend) == [1 3 5; 1 4 10]

	B = [1 5 3; 4 1 10]
	sorted, isort = sortM(B, 2, :ascend, I = true)
	@test 	B[isort] == sorted

	@test flipM([1 2; 3 4]) == [3 4; 1 2]

	@test  rot90M([1 2; 3 4], 3) == [3 1; 4 2]

	@test transposeM([2 3 4 5 6 7; 1 2 3 4 5 6]) == transposeM(:arr, [2 3 4 5 6 7; 1 2 3 4 5 6])

	@test squeezeM(ones(2,1,2)) == [1 1; 1 1]
end

@testset "MatLang.j - Numeric_Types" begin

	@test typeof(doubleM(10.0)) == Float64

	@test typeof(singleM(10.0)) == Float32

	@test typeof(int8M(-10)) == Int8

	@test typeof(int16M(-10)) == Int16

	@test typeof(int32M(-10)) == Int32

	@test typeof(int64M(-10)) == Int64

	@test typeof(uint8M(10)) == UInt8

	@test typeof(uint16M(10)) == UInt16

	@test typeof(uint32M(10)) == UInt32

	@test typeof(uint64M(10)) == UInt64

end
