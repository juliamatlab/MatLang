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
clcM()
################################################################
mEye=eyeM(2,3); # [1 0 0; 0 1 0]
mEye2=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]
s1=size(ones(2,3))
mEye3=eyeM(s1)  # giving size as a variable (Tuple).
################################################################
mDiag=diagM([2,3,4]) # [0 2 0 ; 0 3 0; 0 4]
mDiag2=diagM([2,3,4],1) # [0 2 3 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
################################################################





# Native Julia functions that are just a copy:
################################################################
mZeros=zerosM(2,2); # same as zeros(2,2)
################################################################
mOnes=onesM(2,2); # same as ones(2,2)
################################################################
mRand=randM(2,2); # same as rand(2,2)
################################################################
