################################################################
################################################################
# Matrices_and_Arrays
################################################################
################################################################
# Copy of Julia Functions/Types
natives = [:true, :false] # input symbols
for n in natives
    @eval begin
        const $(Symbol(n, "M")) = $n
        export $(Symbol(n, "M"))
    end
end

"""
    zerosM(dim)         # square dim*dim matrix
    zerosM(Type,dim)    # square dim*dim matrix
    zerosM(dim, like=anArray) # to make an array with similar type of anArray
    zerosM(sizeAsArray) # non-efficient Matlab way
    zerosM(Type, sizeAsArray) # non-efficient Matlab way
    zerosM(sizeAsArray, like=anArray) # to make an array with similar type of anArray

# Examples
```julia
mZeros0=zerosM(2) # same as zeros(2,2)

mZeros1 = zerosM(2, like = zerosM(Int32,2,2) ) # like method

mZeros2=zerosM(2,2) # same as zeros(2,2)

mZeros3=zerosM(Int32,2,2) # same as zeros(Int32,2,2)

mZeros4=zerosM((2,2)) # giving size as Tuple

mZeros5=zerosM(Int32,(2,2)) # giving size as Tuple and also the Int32 type

mZeros6=zerosM([2,2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mZeros7=zerosM(Int32,[2,2]) # giving size as Array, non-efficient Matlab way
```
"""
zerosM(args...) = zeros(args...) # includes T::Type method

zerosM(T::Type, dim::Integer) = zeros(T, dim, dim)
zerosM(dim::Integer; like::AbstractArray = Vector{Float64}()) =
    zeros(eltype(like), dim, dim)
# zerosM(dim::Integer; like::Union{Array,Nothing}=nothing) = like === nothing ? zeros(dim,dim) : zeros(eltype(like), dim, dim)

zerosM(T::Type, a::Array) = zeros(T, Tuple(a))
zerosM(a::Array; like::AbstractArray = Vector{Float64}()) =
    zeros(eltype(like), Tuple(a))
################################################################
"""
    onesM(dim)         # square dim*dim matrix
    onesM(Type, dim)    # square dim*dim matrix
    onesM(dim, like = anArray) # to make an array with similar type of anArray
    onesM(sizeAsArray) # non-efficient Matlab way
    onesM(Type, sizeAsArray) # non-efficient Matlab way
    onesM(sizeAsArray, like = anArray) # to make an array with similar type of anArray

# Examples
```julia
mOnes0=onesM(2) # same as ones(2,2)

mOnes1 = onesM(2, like = zerosM(Int32,2,2) )

mOnes2=onesM(2,2) # same as ones(2,2)

mOnes3=onesM(Int32,2,2) # same as ones(Int32,2,2)

mOnes4=onesM((2,2)) # giving size as Tuple

mOnes5=onesM(Int32,(2,2)) # giving size as Tuple and also the Int32 type

mOnes6=onesM([2,2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mOnes7=onesM(Int32,[2,2]) # giving size as Array, non-efficient Matlab way
```
"""
onesM(args...) = ones(args...) # includes T::Type method

onesM(T::Type, dim::Integer) = ones(T, dim, dim)
onesM(dim::Integer; like::AbstractArray = Vector{Float64}()) =
    ones(eltype(like), dim, dim)
# onesM(dim::Integer; like::Union{Array,Nothing}=nothing) = like === nothing ? ones(dim,dim) : ones(eltype(like), dim, dim)

onesM(T::Type, a::Array) = ones(T, Tuple(a))
onesM(a::Array; like::AbstractArray = Vector{Float64}()) =
    ones(eltype(like), Tuple(a))
################################################################
"""
    randM(dim)         # square dim*dim matrix
    randM(Type, dim)    # square dim*dim matrix
    randM(dim, like = anArray) # to make an array with similar type of anArray
    randM(sizeAsArray) # non-efficient Matlab way
    randM(Type, sizeAsArray) # non-efficient Matlab way
    randM(sizeAsArray, like = anArray) # to make an array with similar type of anArray

# Examples
```julia
mRand0=randM(2) # same as rand(2,2)

mRand1 = randM(2, like = zerosM(Int32,2,2) )

mRand2=randM(2,2) # same as rand(2,2)

mRand3=randM(Int32,2,2) # same as rand(Int32,2,2)

mRand4=randM((2,2)) # giving size as Tuple

mRand5=randM(Int32,(2,2)) # giving size as Tuple and also the Int32 type

mRand6=randM([2,2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mRand7=randM(Int32,[2,2]) # giving size as Array, non-efficient Matlab way
```
"""
randM(args...) = rand(args...) # includes T::Type method

randM(T::Type, dim::Integer) = rand(T, dim, dim)
randM(dim::Integer; like::AbstractArray = Vector{Float64}()) =
    rand(eltype(like), dim, dim)
# randM(dim::Integer; like::Union{Array,Nothing}=nothing) = like === nothing ? rand(dim,dim) : rand(eltype(like), dim, dim)

randM(T::Type, a::Array) = rand(T, Tuple(a))
randM(a::Array; like::AbstractArray = Vector{Float64}()) =
    rand(eltype(like), Tuple(a))
################################################################
"""

    eyeM(dim)         # square dim*dim matrix
    eyeM(Type, dim)    # square dim*dim matrix
    eyeM(dim, like = anArray) # to make an array with similar type of anArray
    eyeM(dim1, dim2)   # giving size as a separate input numbers
    eyeM(Type, dim1, dim2)   # giving size as a separate input numbers
    eyeM(dim1, dim2, like = anArray) # to make an array with similar type of anArray
    eyeM(sizeAsTuple) # giving size as a Tuple
    eyeM(Type, sizeAsTuple) # giving size as a Tuple
    eyeM(sizeAsTuple, like = anArray) # to make an array with similar type of anArray
    eyeM(sizeAsArray) # non-efficient Matlab way
    eyeM(Type, sizeAsArray) # non-efficient Matlab way
    eyeM(sizeAsArray, like = anArray) # to make an array with similar type of anArray

Creates 2D Identity matrix (can be non-square matrix).

Only 2 dimensions should be supplied othetwise you will receive an error.

# Examples
```julia
mEye0=eyeM(2); # [1 0 0; 0 1 0]

mEye1=eyeM(2,3); # [1 0 0; 0 1 0]

mEye2=eyeM(Int32,2,3); # [1 0 0; 0 1 0]

mEye3=eyeM(2,3, like = zerosM(Int8,2,2) )

mEye4=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye5=eyeM(Int32,(2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye6=eyeM([2,2]) # non-efficient Matlab way

mEye7=eyeM(Int32,[2,2]) # non-efficient Matlab way

s1=size(ones(2,3)) # getting size from another matrix or calculation
mEye8=eyeM(s1)  # giving size as a variable (Tuple).
```
"""
eyeM(T::Type, dim1::Integer, dim2::Integer) = Matrix{T}(I, dim1, dim2)
eyeM(dim1::Integer, dim2::Integer; like::AbstractArray = Vector{Int64}()) =
    eyeM(eltype(like), dim1, dim2)

eyeM(T::Type, dim1::Integer) = Matrix{T}(I, dim1, dim1)
eyeM(dim1::Integer; like::AbstractArray = Vector{Int64}()) =
    eyeM(eltype(like), dim1, dim1)

eyeM(T::Type, t::Tuple) = Matrix{T}(I, t)
eyeM(t::Tuple; like::AbstractArray = Vector{Int64}()) = eyeM(eltype(like), t)

eyeM(T::Type, a::Array) = Matrix{T}(I, Tuple(a))
eyeM(a::Array; like::AbstractArray = Vector{Int64}()) = eyeM(eltype(like), a)

################################################################
"""
    diagM(v)
    diagM(v,k)

Create a diagonal matrix from vector v. If k is given, the vector v will be placed on kth diagonal

# Examples
```julia
mDiag=diagM([2,3,4]) # [0 2 0 ; 0 3 0; 0 4]

mDiag2=diagM([2,3,4],1) # [0 2 3 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
```
    diag(A)
    diag(A,k)

Returns diagonal of A as a vector.

# Examples
```julia
mDiag3=diagM([1 2 3; 4 5 6; 7 8 9]) # [1;5;9]

mDiag4=diagM([1 2 3; 4 5 6; 7 8 9],1) # [2;6]
```
"""
# make diagonal matrix
diagM(v::AbstractVector, k::Integer = 0) = diagm(k => v)
# give diagonal
diagM(A::AbstractMatrix, k::Integer = 0) = diag(A, k)
################################################################
import BlockDiagonals
"""

    blkdiagM(A1,A2,...)

Creates a square matrix with A1,A2,... on the diagonal and the rest of the elements being 0. Works for both square and non-square matrices.

    blkdiagM(A1,A2,..., :obj)

Returns the object itself if you want to use BlockDiagonals methods. use collect(obj) to get the array.

# Examples
```julia
1 = 3 * ones(2, 2);
A2 = 4 * ones(2, 2);
A3 = rand(3, 3);
mBlkdiag1 = blkdiagM(A1, A2, A3)

mBlkdiag2 = blkdiagM(ones(2, 2), 2 * ones(2, 2)) # [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]

A1 = ones(2, 4);
A2 = 2 * ones(3, 2);
mBlkdiag3 = blkdiagM(A1, A2) # [ones(2,4) zeros(2,2); zeros(3,4) 2*ones(3,2)]

mBlkdiag1obj = blkdiagM(:obj, A1, A2, A3)

mBlkdiag2obj = blkdiagM(:obj, ones(2, 2), 2 * ones(2, 2)) # Block Diagonal object for [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]
```
"""
blkdiagM(A...) = collect(BlockDiagonals.BlockDiagonal([A...]))

# returning BlockDiagonal object
function blkdiagM(objectSymbol::Symbol, A...)
    if objectSymbol === :obj
        BlockDiagonals.BlockDiagonal([A...])
    end
end

# manual algorithm - slower
# function blkdiagM(in...)
#
#     argNum=length(in)
#
#     inSize1=collect( size.(in,1) )
#     outSize1 = vcat( [0], cumsum(inSize1,dims=1) )
#
#     inSize2=collect( size.(in,2) )
#     outSize2 = vcat( [0], cumsum(inSize2,dims=1) )
#
#     out = zeros(last(outSize1),last(outSize2));
#     for k=1:argNum
#         out[outSize1[k]+1:outSize1[k+1],outSize2[k]+1:outSize2[k+1]] = in[k];
#     end
#
#     return out
# end

# Julia SparseArrays algorithm - only for square matrix, slower:
# import SparseArrays
# blkdiagM(A...)=Array(SparseArrays.blockdiag(SparseArrays.sparse.(A)...))
################################################################
"""
    catM(dim, A1, A2, ...)

concatenates A1, A2, … , An along dimension dim.
# Examples
```julia
mCat1 = catM(1, ones(3, 3), zeros(3, 3)) # [ones(3, 3); zeros(3, 3)]

mCat2 = catM(2, ones(3, 3), zeros(3, 3)) # [ones(3, 3) zeros(3, 3)]

mCat3 = catM(1, ones(3, 3), zeros(3, 3), 2 * ones(3, 3)) # [ones(3, 3); zeros(3, 3); 2 * ones(3, 3)]

mCat4 = catM(3, ones(2, 2, 2), zeros(2, 2, 2)) # [ones(2, 2, 2) zeros(2, 2, 2)]
```
"""
catM(dim::Integer, A...) = cat(A...; dims = dim)
################################################################
"""
    horzcatM(A1, A2, …)

Concatenate arrays horizontally
# Examples
```julia
mHCat1 = horzcatM(ones(3, 3), zeros(3, 3)) # [ones(3, 3) zeros(3, 3)]
```
"""
const horzcatM = hcat
################################################################
"""
    vertcatM(A1, A2, …)

Concatenate arrays vertically
# Examples
```julia
mVCat1 = vertcatM(ones(3, 3), zeros(3, 3)) # [ones(3, 3); zeros(3, 3)]
```
"""
const vertcatM = vcat
################################################################
"""
    repelemM(V, count)

Construct an array by repeating elements of array V by a given number of times specified by counts. if If count is a scalar, then each element of v is repeated "count" times

# Examples
```julia
V1 = [1 2 3 4];
mRepelem1 = repelemM(V1, 3) # [1 1 1 2 2 2 3 3 3 4 4 4]
```
"""
repelemM(A::AbstractArray, count::Integer) = vcat(fill.(A, count)...);

# For full support wait until this is merged: https://github.com/JuliaLang/julia/pull/29560
# doc string to be added:
# , and if count is a vector of the same size of V, it will repeat each element of V corespondigly based on counts.
# repelemM(A, counts)
#
# Construct an array by repeating elements of array A by a given number of times in each dimension, specified by counts.
################################################################
"""
    repmatM(A, n) # n*n copy
    repmatM(A, s1, s2, ...)
    repmatM(A, [s1, s2, ...])
    repmatM(A, (s1, s2, ...))

Repeat copies of array A based on the give size
# Examples
```julia
mRempat1 = repmatM(10, 3, 2) # [10 10; 10 10; 10 10]

V = [1; 2]
mRempat2 = repmatM(V, 3, 2)   # [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat3 = repmatM(V, [3, 2]) # [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat4 = repmatM(V, (3, 2)) # [[1; 2] [1; 2]; [1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat5 = repmatM(V, 2) # [[1; 2] [1; 2]; [1; 2] [1; 2]]

mRempat6 = repmatM(V, 1, 3) # [[1; 2] [1; 2] [1; 2]]
```
"""
repmatM(A::AbstractArray, count::Integer) = repeat(A, count, count)
repmatM(A::AbstractArray, counts::Integer...) = repeat(A, counts...)
repmatM(A::AbstractArray, counts::Array{<:Integer,1}) = repeat(A, counts...)
repmatM(A::AbstractArray, counts::Tuple) = repeat(A, counts...)

# For single number input instead of an array:
repmatM(n::Integer, count::Integer) = repeat(A, count, count)
repmatM(n::Integer, counts::Integer...) = repeat([n], counts...) # for single integer
repmatM(n::Integer, counts::Array{<:Integer,1}) = repeat(A, counts...)
repmatM(n::Integer, counts::Tuple) = repeat(A, counts...)

################################################################
"""
    linspaceM(start, stop)
    linspaceM(start, stop, step)
    linspaceM(:arr, start, stop)
    linspaceM(:arr, start, stop, step)

Generate linearly spaced range. You can also write this as `start:stop` or `start:step:stop`.

To get the full vector isntead of a range object pass :arr as the 1st argument.

# Examples
```julia
mLinspace1 = linspaceM(1, 10) # 1:10

mLinspace2 = linspaceM(1, 10, 2) # 1:2:10 == 1:2:9

mLinspace3 = linspaceM(:arr, 1, 10) # collect(1:10)

mLinspace4 = linspaceM(:arr, 1, 10, 2) # collect(1:2:10)
```
"""
linspaceM(xi, xf) = range(xi, stop=xf)
linspaceM(xi, xf, d) = range(xi, stop=xf, step=d)

# collect symbol - :arr
function linspaceM(collectSymbol::Symbol, xi, xf)
    if collectSymbol == :arr
        return collect(linspaceM(xi, xf))
    end
end

function linspaceM(collectSymbol::Symbol, xi, xf, d)
    if collectSymbol == :arr
        return collect(linspaceM(xi, xf, d))
    end
end
################################################################
"""
    logspaceM(start, stop) # gives 50 points
    logspaceM(start, stop, length)
    logspaceM(start, stop, :equal) # equally spaced powers of 10

Generate logarithmically spaced vector (between 10^start and 10^stop). `length` is the number of the poinst (50 by defualt if not supplied). If you instead provide ``:equal`, it makes a range from equally spaced powers of 10

For logspaceM in contrast to linspaceM, the full vector is given by default.

# Examples
```julia
mLogspace1 = logspaceM(1, 5) # 50 logarithmically spaced points between 10^1 and 10^5

mLogspace2 = logspaceM(1, 5, 10) # 10 logarithmically spaced points between 10^1 and 10^5

mLogspace3 = logspaceM(1, 5, :equal) # [10.0^1, 10.0^2, 10.0^3, 10.0^4, 10.0^5] == 10.0.^(1:5)
```
"""
logspaceM(xi, xf) = 10.0.^range(xi, stop=xf, length=50)

function logspaceM(xi, xf, equalSymbol::Symbol)
    if equalSymbol == :equal
        return  10.0.^range(xi, stop=xf)
    end
end

logspaceM(xi, xf, num) = 10.0.^range(xi, stop=xf, length=num)
################################################################
"""
    lengthM(A)

Length of the largest array dimension of A.
# Examples
```julia
A1 = [2 3 4 5 6 7;
      1 2 3 4 5 6]
nLength1 = lengthM(A1); # 6

A2 = ["Hi" 6;
      "Goodbye" 5;
      "Hello" 1]
nLength2 = lengthM(A2); # 3
```
"""
lengthM(A::AbstractArray)=maximum(size(A));
################################################################
"""
    sizeAsArray = sizeM(A)
    sizeDim = sizeM(dim)  # only returns the specified dim
    sizeDimAsArray = sizeM(A, dim1, dim2,...) # only returns the specified dims
    sz1, sz2, ... = size(A)

Returns the size of an array (as an array).

In contrast to Julia base, size is returned as an array (not a tuple).

Consider the points that are explained here when using this function: https://juliamatlab.github.io/MatLang/dev/juliavsmatlab/#Julia-Arrays:-1

# Examples
```julia
A1 = [2 3 4 5 6 7;
      1 2 3 4 5 6]
mSize1 = sizeM(A1); # [2; 6]

nA1Size2 = sizeM(A1, 2); # 6

nA1Size1, nA1Size2 = sizeM(A1); # 2 and 6

A2 = rand(3, 5, 4)
mSize2 = sizeM(A2, 2, 3); # [5; 4]
```
"""
sizeM(args...) = collect(size(args...))

sizeM(A::AbstractArray, dim1::Integer, dim2::Integer...) = collect(size(A))[[dim1, dim2...]] # = getindex(collect(size(A)), [dim1, dim2...])
################################################################
"""
    ndimsM(A)


Return the number of dimensions of A.

In contrast to Matlab equivalent, this function considers trailing singleton dimensions,

Consider the points that are explained here when using this function: https://juliamatlab.github.io/MatLang/dev/juliavsmatlab/#Julia-Arrays:-1

# Examples
```julia
A = rand(3,4,5);
nDim1 = ndims(A) # 3
```
"""
const ndimsM = ndims
################################################################
"""
    numelM(A)

Returns the number of elements of array A.

# Examples
```julia
nNumel1 = numelM(1:5) # 5

nNumel2 = numelM([1, 2, 3, 4]) # 4

nNumel3 = numelM([1 2; 3 4]) # 4
```
"""
const numelM = length
################################################################
"""
    transposeM(A)
    transposeM(:arr, A)

Returns the transpose an array.

If :arr is supplied `permutedims` method is used which returns an array rather a transpose object.

Becareful that `'` in Julia is used for adjoint and `.'` is not defined.

# Examples
```julia
A1 = [2 3 4 5 6 7;
      1 2 3 4 5 6]
mTranspose1 = transposeM(A1)

mTranspose2 = transposeM(:arr, A1)
```
"""
transposeM(args...) = transpose(args...)
function transposeM(collectSymbol::Symbol, A)
    if collectSymbol == :arr
        return permutedims(A)
    end
end
################################################################
using Base.Broadcast
"""
    isscalarM(x)
    isscalarM(:mat, x)

Returns boolean 1 if x is scalar.

It uses Broadcast.DefaultArrayStyle{0}, which basically are numbers (0-dimensional) and 1 dimensional-1 element number arrays.

To get a MATLAB way result, pass `:mat` argument. Doing this:
* For arrays (of any element type), it calculates number of elements (using numelM).
* For single strings it calculates number of characters (using numelM).
* For others, if it is among {Number,Char,Bool}, then it is considered scalar.


# Examples
```julia
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
```
"""
isscalarM(x::T) where T = isscalarM(T)
isscalarM(::Type{T}) where T = BroadcastStyle(T) isa Broadcast.DefaultArrayStyle{0}

# Matlab way:
function isscalarM(matlabWaySymbol::Symbol, x::AbstractArray)
    if matlabWaySymbol == :mat
        numelM(x) == 1
    end
end
function isscalarM(matlabWaySymbol::Symbol, x::AbstractString)
    if matlabWaySymbol == :mat
        numelM(x) == 1
    end
end
function isscalarM(matlabWaySymbol::Symbol, x::Any)
    if matlabWaySymbol == :mat
        isa(x, Union{Number,Char,Bool})
    end
end
################################################################

"""
    squeezeM(A)

Drops all of the singleton dimensions of `A` (dimensions that are 1).
If `A` contains only one element (i.e., all of its dimensions are singletons) then the output will be a zero-dimensional array.

If you know the dimension that you want to drop, use dropdims(A ; dims= dimensionsToRemove).

Only use this function if you don't know the dimensions that you want to remove, and you are sure that you are not removing important dimensions, and if you don't care about type stability.

Returns an array containing the same data as `A` but with no singleton dimensions; note that `arr` is NOT a copy of `A`, i.e., modifying the contents of `arr` will modify the contents of `A`. To get a copy use copy(arr).

# Examples
```julia
A1 = ones(2, 1, 2); # 3 dimensional
mSqueeze1 = squeezeM(A1) # [1 1; 1 1]

A2 = zeros(1, 4, 1);
A2[:, 1:4, ] = [5; 3; 6; 0]
mSqueeze2 = squeezeM(A2) # When it gets one dimensional, it is vertical.

mSqueeze2 == [5; 3; 6; 0] # true
mSqueeze2 == [5 3 6 0] # false
```
"""
squeezeM(A::AbstractArray) = dropdims(A, dims = Tuple(findall(size(A) .== 1)))
