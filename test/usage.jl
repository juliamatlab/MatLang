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

# Main Functions Usage
################################################################
clcM() # clears console
################################################################
mZeros=zerosM(2,2); # same as zeros(2,2)

mZeros2=zerosM((2,2)); # giving size as Tuple

mZeros3=zerosM([2,2]); # giving size as Array, non-efficient Matlab way
################################################################
mOnes=onesM(2,2); # same as ones(2,2)

mOnes2=onesM((2,2)); # giving size as Tuple

mOnes3=onesM([2,2]); # giving size as Array, non-efficient Matlab way
################################################################
mRand=randM(2,2); # same as rand(2,2)

mRand2=randM((2,2)); # giving size as Tuple

mRand3=randM([2,2]); # giving size as Array, non-efficient Matlab way
################################################################
mEye=eyeM(2,3); # [1 0 0; 0 1 0]

mEye2=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye3=eyeM([2,2]) # non-efficient Matlab way

s1=size(ones(2,3)) # getting size from another matrix or calculation
mEye4=eyeM(s1)  # giving size as a variable (Tuple).
################################################################
mDiag=diagM([2,3,4]) # [0 2 0 ; 0 3 0; 0 4]

mDiag2=diagM([2,3,4],1) # [0 2 3 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]

mDiag3=diagM([1 2 3; 4 5 6; 7 8 9]) # [1;5;9]

mDiag4=diagM([1 2 3; 4 5 6; 7 8 9],1) # [2;6]
################################################################





# Julia functions with M suffix
