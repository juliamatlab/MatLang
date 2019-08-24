developing = false; # are you developing the package or just using?
if developing
	# ] add Revise # if you don't have it
	# ] add Requires
    path = pwd()
    if path[end-6:end] != "MatLang"
        error("cd(to the MatLang path)")
    end
    push!(LOAD_PATH, ".")
    using Revise
    using MatLang
else
    using MatLang
end
################################################################
################################################################

mZeros0 = zerosM(2) # same as zeros(2,2)

mZeros1 = zerosM(2, like = zerosM(Int32, 2, 2))

mZeros2 = zerosM(2, 2) # same as zeros(2,2)

mZeros3 = zerosM(Int32, 2, 2) # same as zeros(Int32,2,2)

mZeros4 = zerosM((2, 2)) # giving size as Tuple

mZeros5 = zerosM(Int32, (2, 2)) # giving size as Tuple and also the Int32 type

mZeros6 = zerosM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mZeros7 = zerosM(Int32, [2, 2]) # giving size as Array, non-efficient Matlab way
################################################################
mOnes0 = onesM(2) # same as ones(2,2)

mOnes1 = onesM(2, like = zerosM(Int32, 2, 2))

mOnes2 = onesM(2, 2) # same as ones(2,2)

mOnes3 = onesM(Int32, 2, 2) # same as ones(Int32,2,2)

mOnes4 = onesM((2, 2)) # giving size as Tuple

mOnes5 = onesM(Int32, (2, 2)) # giving size as Tuple and also the Int32 type

mOnes6 = onesM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mOnes7 = onesM(Int32, [2, 2]) # giving size as Array, non-efficient Matlab way
################################################################
mRand0 = randM(2) # same as rand(2,2)

mRand1 = randM(2, like = zerosM(Int32, 2, 2))

mRand2 = randM(2, 2) # same as rand(2,2)

mRand3 = randM(Int32, 2, 2) # same as rand(Int32,2,2)

mRand4 = randM((2, 2)) # giving size as Tuple

mRand5 = randM(Int32, (2, 2)) # giving size as Tuple and also the Int32 type

mRand6 = randM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mRand7 = randM(Int32, [2, 2]) # giving size as Array, non-efficient Matlab way
################################################################
mEye0 = eyeM(2); # [1 0 0; 0 1 0]

mEye1 = eyeM(2, 3); # [1 0 0; 0 1 0]

mEye2 = eyeM(Int32, 2, 3); # [1 0 0; 0 1 0]

mEye3 = eyeM(2, 3, like = zerosM(Int8, 2, 2))

mEye4 = eyeM((2, 2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye5 = eyeM(Int32, (2, 2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye6 = eyeM([2, 2]) # non-efficient Matlab way

mEye7 = eyeM(Int32, [2, 2]) # non-efficient Matlab way

s1 = size(ones(2, 3)) # getting size from another matrix or calculation
mEye8 = eyeM(s1)  # giving size as a variable (Tuple).
################################################################
mDiag = diagM([2, 3, 4]) # [0 2 0 ; 0 3 0; 0 4]

mDiag2 = diagM([2, 3, 4], 1) # [0 2 3 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]

mDiag3 = diagM([1 2 3; 4 5 6; 7 8 9]) # [1;5;9]

mDiag4 = diagM([1 2 3; 4 5 6; 7 8 9], 1) # [2;6]
################################################################
A1 = 3 * ones(2, 2);
A2 = 4 * ones(2, 2);
A3 = rand(3, 3);
mBlkdiag1 = blkdiagM(A1, A2, A3)

mBlkdiag2 = blkdiagM(ones(2, 2), 2 * ones(2, 2)) # vcat(hcat(ones(2,2),zeros(2,2)),hcat(zeros(2,2),2*ones(2,2)))

A1 = ones(2, 4);
A2 = 2 * ones(3, 2);
mBlkdiag3 = blkdiagM(A1, A2) # vcat(hcat(ones(2,4),zeros(2,2)),hcat(zeros(3,4),2*ones(3,2)))
################################################################





# Julia functions with M suffix