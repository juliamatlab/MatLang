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
mzero0 = zerosM(:mat, 2) # same as zeros(2,2)

mzero1 = zerosM(:mat, 2, like = zerosM(Int32, 2, 2)) # like method

A=[2 1 2]
mzero2 = zerosM(2, like=A) # same as zeros(Int64,2)

mzero3 = zerosM(2) # same as zeros(2)

mzero4 = zerosM(Int32, 2, 2) # same as zeros(Int32,2,2)

# giving size as Tuple
mzero5 = zerosM((2, 2)) # = zerosM(2,2)

mzero6 = zerosM(Int32, (2, 2))

# giving size as an Array
## non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mzero7 = zerosM([2, 2])

mzero8 = zerosM(Int32, [2, 2])

mzero9 = zerosM([2, 2], like = [2.5 3.0])
################################################################
mone0 = onesM(:mat, 2) # same as ones(2,2)

mone1 = onesM(:mat, 2, like = onesM(Int32, 2, 2)) # like method

A=[2 1 2]
mone2 = onesM(2, like=A) # same as ones(Int64,2)

mone3 = onesM(2) # same as ones(2)

mone4 = onesM(Int32, 2, 2) # same as ones(Int32,2,2)

# giving size as Tuple
mone5 = onesM((2, 2)) # = onesM(2,2)

mone6 = onesM(Int32, (2, 2))

# giving size as an Array
## non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mone7 = onesM([2, 2])

mone8 = onesM(Int32, [2, 2])

mone9 = onesM([2, 2], like = [2.5 3.0])
################################################################
mrandom0 = randM(:mat, 2) # same as rand(2,2)

mrandom1 = randM(:mat, 2, like = randM(Int32, 2, 2)) # like method

A=[2 1 2]
mrandom2 = randM(2, like=A) # same as rand(Int64,2)

mrandom3 = randM(2) # same as rand(2)

mrandom4 = randM(Int32, 2, 2) # same as rand(Int32,2,2)

# giving size as Tuple
mrandom5 = randM((2, 2)) # = randM(2,2)

mrandom6 = randM(Int32, (2, 2))

# giving size as an Array
## non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mrandom7 = randM([2, 2])

mrandom8 = randM(Int32, [2, 2])

mrandom9 = randM([2, 2], like = [2.5 3.0])
################################################################
mtrue0 = trueM(:mat, 2) # same as trues(2,2)

mtrue1 = trueM(2) # same as trues(2)

# giving size as Tuple
mtrue2 = trueM((2, 2)) # = trues(2,2)

# giving size as an Array
## non-efficient Matlab way. Array should be Integer otherwise you will get errors.
mtrue3 = trueM([2, 2])
################################################################
mfalse0 = falseM(:mat, 2) # same as falses(2,2)

mfalse1 = falseM(2) # same as falses(2)

# giving size as Tuple
mfalse2 = falseM((2, 2)) # = falses(2,2)

# giving size as an Array
## non-efficient Matlab way. Array should be Integer otherwise you will get errors.
mfalse3 = falseM([2, 2])
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
m1Meshgrid0, m2Meshgrid0 = meshgridM(1:2:5) # a 2-D rectangle spanning 1:2:5 in x and y direction == [[1;1;1][3;3;3] [5;5;5]] and [1 1 1; 3 3 3; 5 5 5]

m1Meshgrid1, m2Meshgrid1 = meshgridM(1:2:5, 1:2:5) #  a 2-D rectangle spanning 1:2:5 in x and y direction == ([1 3 5;1 3 5; 1 3 5],[1 1 1; 3 3 3; 5 5 5])

m1Meshgrid2, m2Meshgrid2, m3Meshgrid2 = meshgridM(1:6, 20:25, 5:10) # a 3-D rectangle spanning 1:6 in x, 20:25 in y, and 5:10 in z
################################################################
m1Ndgrid0, m2Ndgrid0 = ndgridM(1:2:5, dim = 2) # a 2-D rectangle spanning 1:2:5 in x and y direction == [1 1 1; 3 3 3; 5 5 5] and [1 3 5;1 3 5; 1 3 5]

m1Ndgrid1, m2Ndgrid1 = ndgridM(1:2:5, 1:2:5) #  a 2-D rectangle spanning 1:2:5 in x and y direction == ([1 1 1; 3 3 3; 5 5 5], [1 3 5;1 3 5; 1 3 5])

m1Ndgrid2, m2Ndgrid2, m3Ndgrid2 = ndgridM(1:6, 20:25, 5:10) # a 3-D rectangle spanning 1:6 in x, 20:25 in y, and 5:10 in z
################################################################
mFreqspace1 = freqspaceM(10, dim = 1) # 0:0.2:1

mFreqspace2 = freqspaceM(10, :whole, dim = 1) # 0:0.2:1.8

m1Freqspace3, m2Freqspace3 = freqspaceM(10, dim = 2) # returns two -1:0.2:0.8

m1Freqspace4, m2Freqspace4 = freqspaceM(10, :meshgrid, dim = 2) # returns mesgridM(-1:0.2:0.8, -1:0.2:0.8), which is two -1:0.2:0.8
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
mSize1 = sizeM(:arr, A1); # [2; 6]
tSize1 = sizeM(A1); # (2, 6)

nA1Size2 = sizeM(A1, 2); # 6
sizeM(A1, 2) == 6 # true
sizeM(:arr, A1, 2) == 6 # false
sizeM(:arr, A1, 2) == [6] # true

nA1Size1, nA1Size2 = sizeM(A1); # 2 and 6

A2 = rand(3, 5, 4)
mSize2 = sizeM(:arr, A2, 2, 3); # [5; 4]
tSize2 = sizeM(A2, 2, 3); # (5, 4)
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

bIsMatrix9 = isvectorM(["Hi" "Bye"]) # false

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
A1 = [1 2 3; 3 5 6]
bIsMatrix1 = ismatrixM(A1) # true

A2 = [1;2;3] # or [1,2,3]
bIsMatrix2 = ismatrixM(A2) # false

bIsMatrix3 = ismatrixM(ones(3, 1)) # true

bIsMatrix4 = ismatrixM(ones(1, 3)) # true

bIsMatrix5 = ismatrixM(ones(3)) # false

bIsMatrix6 = ismatrixM("Hi") # false

bIsMatrix7 = ismatrixM(["Hi", "Bye"]) # false

bIsMatrix8 = ismatrixM(["Hi" "Bye"]) # true

# Matlab Way:

bIsMatrixMat1 = ismatrixM(:mat, A1) # true

bIsMatrixMat2 = ismatrixM(:mat, A2) # true

bIsMatrixMat3 = ismatrixM(:mat, ones(3, 1)) # true

bIsMatrixMat4 = ismatrixM(:mat, ones(1, 3)) # true

bIsMatrixMat5 = ismatrixM(:mat, ones(3)) # true

bIsMatrixMat6 = ismatrixM(:mat, "Hi") # true

bIsMatrixMat7 = ismatrixM(:mat, ["Hi", "Bye"]) # true
################################################################
A1 = [1; 2; 3] # or [1, 2, 3]
bIsrow1 = isrowM(A1) # false

A2 = [1 2 3]
bIsrow2 = isrowM(A2) # true

bIsrow3 = isrowM(ones(3, 1)) # false

bIsrow4 = isrowM(ones(1, 3)) # true

bIsrow5 = isrowM(ones(3)) # false

bIsrow6 = isrowM(1) # false

bIsrow7 = isrowM("Hi") # false

bIsrow8 = isrowM(["Hi", "Bye"]) # false

bIsrow9 = isrowM(["Hi" "Bye"]) # true

# Matlab Way:
bIsrowMat1 = isrowM(:mat, A1) # false

bIsrowMat2 = isrowM(:mat, A2) # true

bIsrowMat3 = isrowM(:mat, ones(3, 1)) # false

bIsrowMat4 = isrowM(:mat, ones(1, 3)) # true

bIsrowMat5 = isrowM(:mat, ones(3)) # false

bIsrowMat6 = isrowM(:mat, 1) # true

bIsrowMat7 = isrowM(:mat, "Hi") # true

bIsrowMat8 = isrowM(:mat, ["Hi", "Bye"]) # false
################################################################
A1 = [1; 2; 3] # or [1, 2, 3]
bIscolumn1 = iscolumnM(A1) # false

A2 = [1 2 3]
bIscolumn2 = iscolumnM(A2) # false

bIscolumn3 = iscolumnM(ones(3, 1)) # tue

bIscolumn4 = iscolumnM(ones(1, 3)) #false

bIscolumn5 = iscolumnM(ones(3)) # false

bIscolumn6 = iscolumnM(1) # false

bIscolumn7 = iscolumnM("Hi") # false

bIscolumn8 = iscolumnM(["Hi", "Bye"]) # false

bIscolumn9 = iscolumnM(["Hi" "Bye"]) # false

# Matlab Way:
bIscolumnMat1 = iscolumnM(:mat, A1) # true

bIscolumnMat2 = iscolumnM(:mat, A2) # false

bIscolumnMat3 = iscolumnM(:mat, ones(3, 1)) # true

bIscolumnMat4 = iscolumnM(:mat, ones(1, 3)) # false

bIscolumnMat5 = iscolumnM(:mat, ones(3)) # true

bIscolumnMat6 = iscolumnM(:mat, 1) # true

bIscolumnMat7 = iscolumnM(:mat, "Hi") # true

bIscolumnMat8 = iscolumnM(:mat, ["Hi", "Bye"]) # true
################################################################
mSort0 = sortM([5, 3, 19, 20, 1, 4]) # [1, 3, 4, 5, 19, 20]

A = [5, 3, 19, 20, 1, 4]
mSort1, iSort1 = sortM(A, I = true)  # returning sort index
A[iSort1] == mSort1

mSort2 = sortM([5, 3, 19, 20, 1, 4], :descend) # [20,19,5,4,3,1]

mSort3 = sortM([1 5 3; 4 1 10]) # [1 1 3; 4 5 10]

mSort4 = sortM([1 5 3; 4 1 10], 2, :ascend) # [1 3 5; 1 4 10]

B = [1 5 3; 4 1 10]
mSort5, iSort5 = sortM(B, 2, :ascend, I = true) # [1 3 5; 1 4 10]
B[iSort5] == mSort5

A = zerosM(Integer, 2, 2, 2)
A[:, :, 1] = [2 3; 1 6]
A[:, :, 2] = [-1 9; 0 12]
mSort6 = sortM(A, 3) # 3D sort
################################################################
sFlip1 = flipM("Hi") # "iH"

mFlip2 = flipM([1; 2; 3; 4]) #[4;3;2;1]

mFlip3 = flipM([1 2; 3 4]) # flips every column: # [3 4; 1 2]

mFlip4 = flipM([1 2; 3 4], 2) # flip along dims 2: #[2 1; 4 3]
################################################################
mRot1 = rot90M([1 2; 3 4]) #[2 4; 1 3]

mRot2 = rot90M([1 2; 3 4], 3) # [3 1; 4 2]
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
