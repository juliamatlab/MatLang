developing = false; # are you developing the package or just using?
if developing
	# ] add Revise # if you don't have it
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

mBlkdiag2 = blkdiagM(ones(2, 2), 2 * ones(2, 2)) # [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]

A1 = ones(2, 4);
A2 = 2 * ones(3, 2);
mBlkdiag3 = blkdiagM(A1, A2) # [ones(2,4) zeros(2,2); zeros(3,4) 2*ones(3,2)]

mBlkdiag1obj = blkdiagM(:obj, A1, A2, A3) # returning BlockDiagonal object

mBlkdiag2obj = blkdiagM(:obj, ones(2, 2), 2 * ones(2, 2)) # returning BlockDiagonal object for [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]
################################################################
mCat1 = catM(1, ones(3, 3), zeros(3, 3)) # [ones(3, 3); zeros(3, 3)]

mCat2 = catM(2, ones(3, 3), zeros(3, 3)) # [ones(3, 3) zeros(3, 3)]

mCat3 = catM(1, ones(3, 3), zeros(3, 3), 2 * ones(3, 3)) # [ones(3, 3); zeros(3, 3); 2 * ones(3, 3)]

mCat4 = catM(3, ones(2, 2, 2), zeros(2, 2, 2)) # [ones(2, 2, 2) zeros(2, 2, 2)]
################################################################
mHCat1 = horzcatM(ones(3, 3), zeros(3, 3)) # [ones(3, 3) zeros(3, 3)]
################################################################
mVCat1 = vertcatM(ones(3, 3), zeros(3, 3)) # [ones(3, 3); zeros(3, 3)]
################################################################
V1 = [1 2 3 4];
mRepelem1 = repelemM(V1, 3) # [1 1 1 2 2 2 3 3 3 4 4 4]

# mRepelem2 = repelemM(V1, (3,2,1,1)) # [1 1 1 2 2 3 4]

# mRepelem3 = repelemM(V1, vec([3 2 1 1])) # [1 1 1 2 2 3 4]
################################################################
mRempat1 = repmatM(10, 3, 2) # [10 10; 10 10; 10 10]

V = [1; 2]
mRempat2 = repmatM(V, 3, 2)   # [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat3 = repmatM(V, [3, 2]) # [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat4 = repmatM(V, (3, 2)) # [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat5 = repmatM(V, 2) # [[1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat6 = repmatM(V, 1, 3) # [[1; 2] [1; 2] [1; 2]]
################################################################
mLinspace1 = linspaceM(1, 10) # 1:10

mLinspace2 = linspaceM(1, 10, 2) # 1:2:10 == 1:2:9

mLinspace3 = linspaceM(:arr, 1, 10) # collect(1:10)

mLinspace4 = linspaceM(:arr, 1, 10, 2) # collect(1:2:10)
################################################################
mLogspace1 = logspaceM(1, 5) # 50 logarithmically spaced points between 10^1 and 10^5

mLogspace2 = logspaceM(1, 5, 10) # 10 logarithmically spaced points between 10^1 and 10^5

mLogspace3 = logspaceM(1, 5, :equal) # [10.0^1, 10.0^2, 10.0^3, 10.0^4, 10.0^5] == 10.0.^(1:5)
################################################################
A1 = [2 3 4 5 6 7;
      1 2 3 4 5 6]
nLength1 = lengthM(A1); # 6

A2 = ["Hi" 6;
      "Goodbye" 5;
      "Hello" 1]
nLength2 = lengthM(A2); # 3
################################################################
A1 = [2 3 4 5 6 7;
      1 2 3 4 5 6]
mSize1 = sizeM(A1); # [2; 6]

nA1Size2 = sizeM(A1, 2); # 6

nA1Size1, nA1Size2 = sizeM(A1); # 2 and 6

A2 = rand(3, 5, 4)
mSize2 = sizeM(A2, 2, 3); # [5; 4]
################################################################
A = rand(3,4,5);
nDim1 = ndims(A) # 3
################################################################
nNumel1 = numelM(1:5) # 5

nNumel2 = numelM([1, 2, 3, 4]) # 4

nNumel3 = numelM([1 2; 3 4]) # 4
################################################################
bIsscalar1 = isscalarM(1) # true

bIsscalar2 = isscalarM(5 * ones(1, 1, 1)) # false

# bIsscalar3 = isscalarM("H") # gives error
#
# bIsscalar4 = isscalarM("Hi") # gives error

bIsscalar5 = isscalarM(["Hi"]) # false

bIsscalar6 = isscalarM(["Hi" "Bye"]) # false

bIsscalar7 = isscalarM('H') # true # becareful that in Julia, chars are always singular.

bIsscalar8 = isscalarM(true) # true

# Matlab way:
bIsscalarMat1 = isscalarM(:mat, 1) # true

bIsscalarMat2 = isscalarM(:mat, [1]) # true

bIsscalarMat3 = isscalarM(:mat, 5 * ones(1, 1, 1)) # true

bIsscalarMat4 = isscalarM(:mat, "H") # true

bIsscalarMat5 = isscalarM(:mat, "Hi") # false

bIsscalarMat6 = isscalarM(:mat, ["Hi"]) # true

bIsscalarMat7 = isscalarM(:mat, ["Hi" "Bye"]) # false

bIsscalarMat8 = isscalarM(:mat, 'H') # true # becareful that in Julia, chars are always singular.

bIsscalarMat9 = isscalarM(:mat, true) # true
################################################################
A1 = [1; 2; 3] # or [1, 2, 3]
bIsvector1 = isvectorM(A1) # true

A2 = [1 2 3]
bIsvector2 = isvectorM(A2) # false

bIsvector3 = isvectorM(ones(3, 1)) # false

bIsvector4 = isvectorM(ones(1, 3)) # false

bIsvector5 = isvectorM(ones(3)) # true

bIsvector6 = isvectorM(1) # false

bIsvector7 = isvectorM("Hi") # false

bIsvector8 = isvectorM(["Hi", "Bye"]) # true

# Matlab Way:
bIsvectorMat1 = isvectorM(:mat, A1) # true

bIsvectorMat2 = isvectorM(:mat, A2) # true

bIsvectorMat3 = isvectorM(:mat, ones(3, 1)) # true

bIsvectorMat4 = isvectorM(:mat, ones(1, 3)) # true

bIsvectorMat5 = isvectorM(:mat, ones(3)) # true

bIsvectorMat6 = isvectorM(:mat, 1) # true

bIsvectorMat7 = isvectorM(:mat, "Hi") # true

bIsvectorMat8 = isvectorM(:mat, ["Hi", "Bye"]) # true
################################################################
A1 = [2 3 4 5 6 7;
      1 2 3 4 5 6]
mTranspose1 = transposeM(A1)

mTranspose2 = transposeM(:arr, A1)
################################################################
A1 = ones(2, 1, 2); # 3 dimensional
mSqueeze1 = squeezeM(A1) # [1 1; 1 1]

A2 = zeros(1, 4, 1);
A2[:, 1:4, ] = [5; 3; 6; 0]
mSqueeze2 = squeezeM(A2) # When it gets one dimensional, it is vertical.

mSqueeze2 == [5; 3; 6; 0] # true
mSqueeze2 == [5 3 6 0] # false
################################################################
