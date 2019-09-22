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
