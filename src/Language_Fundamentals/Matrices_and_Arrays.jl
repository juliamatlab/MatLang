################################################################
################################################################
# Matrices_and_Arrays
################################################################
################################################################
# Copy of Julia Functions/Types
natives = [] # input symbols
for n in natives
    @eval begin
        const $(Symbol(n, "M")) = $n
        export $(Symbol(n, "M"))
    end
end
################################################################
"""
    zerosM(:mat, dim)         # square dim*dim matrix
    zerosM(:mat, Type,dim)    # square dim*dim matrix
    zerosM(:mat, dim, like=anArray) # to make an array with similar type of anArray
    zerosM(sizeAsArray) # non-efficient Matlab way
    zerosM(Type, sizeAsArray) # non-efficient Matlab way
    zerosM(sizeAsArray, like=anArray) # to make an array with similar type of anArray

returns an array filled with zero values.

`zerosM(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.

# Examples
```julia
mZeros0 = zerosM(:mat, 2) # same as zeros(2,2)

mZeros1 = zerosM(:mat, 2, like = zerosM(Int32, 2, 2)) # like method

mZeros2 = zerosM(2) # same as zeros(2)

mZeros3 = zerosM(Int32, 2, 2) # same as zeros(Int32,2,2)

mZeros4 = zerosM((2, 2)) # = zerosM(2,2) # giving size as Tuple

mZeros5 = zerosM(Int32, (2, 2)) # giving size as Tuple and also the Int32 type

mZeros6 = zerosM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mZeros7 = zerosM(Int32, [2, 2]) # giving size as Array, non-efficient Matlab way
```
"""
zerosM(args...) = zeros(args...) # includes T::Type method

function zerosM(matSymbol::Symbol, T::Type, dim::Integer)
    if matSymbol == :mat
        return zeros(T, dim, dim)
    end
end

function zerosM(matSymbol::Symbol, dim::Integer; like::AbstractArray = Vector{Float64}())
    if matSymbol == :mat
        return zeros(eltype(like), dim, dim)
    end
end

# zerosM(dim::Integer; like::Union{Array,Nothing}=nothing) = like === nothing ? zeros(dim,dim) : zeros(eltype(like), dim, dim)

zerosM(T::Type, a::Array) = zeros(T, Tuple(a))
zerosM(a::Array; like::AbstractArray = Vector{Float64}()) =
    zeros(eltype(like), Tuple(a))
################################################################
"""
    onesM(:mat, dim)         # square dim*dim matrix
    onesM(:mat, Type,dim)    # square dim*dim matrix
    onesM(:mat, dim, like=anArray) # to make an array with similar type of anArray
    onesM(sizeAsArray) # non-efficient Matlab way
    onesM(Type, sizeAsArray) # non-efficient Matlab way
    onesM(sizeAsArray, like=anArray) # to make an array with similar type of anArray

returns an array filled with one values.

`onesM(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.

# Examples
```julia
mOnes0 = onesM(:mat, 2) # same as ones(2,2)

mOnes1 = onesM(:mat, 2, like = zerosM(Int32, 2, 2)) # like method

mOnes2 = onesM(2) # same as ones(2)

mOnes3 = onesM(Int32, 2, 2) # same as ones(Int32,2,2)

mOnes4 = onesM((2, 2)) # = onesM(2,2) # giving size as Tuple

mOnes5 = onesM(Int32, (2, 2)) # giving size as Tuple and also the Int32 type

mOnes6 = onesM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mOnes7 = onesM(Int32, [2, 2]) # giving size as Array, non-efficient Matlab way
```
"""
onesM(args...) = ones(args...) # includes T::Type method

function onesM(matSymbol::Symbol, T::Type, dim::Integer)
    if matSymbol == :mat
        return ones(T, dim, dim)
    end
end

function onesM(matSymbol::Symbol, dim::Integer; like::AbstractArray = Vector{Float64}())
    if matSymbol == :mat
        return ones(eltype(like), dim, dim)
    end
end

# onesM(dim::Integer; like::Union{Array,Nothing}=nothing) = like === nothing ? ones(dim,dim) : ones(eltype(like), dim, dim)

onesM(T::Type, a::Array) = ones(T, Tuple(a))
onesM(a::Array; like::AbstractArray = Vector{Float64}()) =
    ones(eltype(like), Tuple(a))
################################################################
"""
    randM(:mat, dim)          # square dim*dim matrix
    randM(:mat, Type, dim)    # square dim*dim matrix
    randM(:mat, dim, like = anArray) # to make an array with similar type of anArray
    randM(sizeAsArray) # non-efficient Matlab way
    randM(Type, sizeAsArray) # non-efficient Matlab way
    randM(sizeAsArray, like = anArray) # to make an array with similar type of anArray

returns an array filled with random values.

`randM(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.

# Examples
```julia
mRand0 = randM(:mat, 2) # same as rand(2,2)

mRand1 = randM(:mat, 2, like = zerosM(Int32, 2, 2)) # like method

mRand2 = randM(2) # same as rand(2)

mRand3 = randM(Int32, 2, 2) # same as rand(Int32,2,2)

mRand4 = randM((2, 2)) # = randM(2,2) # giving size as Tuple

mRand5 = randM(Int32, (2, 2)) # giving size as Tuple and also the Int32 type

mRand6 = randM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mRand7 = randM(Int32, [2, 2]) # giving size as Array, non-efficient Matlab way
```
"""
randM(args...) = rand(args...) # includes T::Type method

function randM(matSymbol::Symbol, T::Type, dim::Integer)
    if matSymbol == :mat
        return rand(T, dim, dim)
    end
end

function randM(matSymbol::Symbol, dim::Integer; like::AbstractArray = Vector{Float64}())
    if matSymbol == :mat
        return rand(eltype(like), dim, dim)
    end
end

# randM(dim::Integer; like::Union{Array,Nothing}=nothing) = like === nothing ? rand(dim,dim) : rand(eltype(like), dim, dim)

randM(T::Type, a::Array) = rand(T, Tuple(a))
randM(a::Array; like::AbstractArray = Vector{Float64}()) =
    rand(eltype(like), Tuple(a))

################################################################
"""
    trueM(:mat, dim)          # square dim*dim matrix
    trueM(sizeAsArray) # non-efficient Matlab way

returns an array filled with true values.

`trueM(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.

# Examples
```julia
mTrue0 = trueM(:mat, 2) # same as trues(2,2)

mTrue1 = trueM(2) # same as trues(2)

mTrue2 = trueM((2, 2)) # = trues(2,2) # giving size as Tuple

mTrue3 = trueM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.
```
"""
trueM(args...) = trues(args...) # includes T::Type method

function trueM(matSymbol::Symbol, dim::Integer)
    if matSymbol == :mat
        return trues(dim, dim)
    end
end
trueM(a::Array) = trues(Tuple(a))
################################################################
"""
    falseM(:mat, dim)          # square dim*dim matrix
    falseM(sizeAsArray) # non-efficient Matlab way

returns an array filled with false values.

`falseM(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.

# Examples
```julia
mFalse0 = falseM(:mat, 2) # same as falses(2,2)

mFalse1 = falseM(2) # same as falses(2)

mFalse2 = falseM((2, 2)) # = falseM(2,2) # giving size as Tuple

mFalse3 = falseM([2, 2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.
```
"""
falseM(args...) = falses(args...) # includes T::Type method

function falseM(matSymbol::Symbol, dim::Integer)
    if matSymbol == :mat
        return falses(dim, dim)
    end
end
falseM(a::Array) = falses(Tuple(a))
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

eyeM is 2-dimensional by the definition, so you don't need to pass `:mat` argument for getting a 2-dimensional matrix from `eyeM(dim)`

# Examples
```julia
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

Create a diagonal matrix from vector `v`. If k is given, the vector v will be placed on kth diagonal

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

Returns the object itself if you want to use BlockDiagonals methods. use `collect(obj)` to get the array.

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

Construct an array by repeating elements of array `V` by a given number of times specified by counts. if If count is a scalar, then each element of V is repeated `count` times

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

Repeat copies of array `A` based on the give size
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

To get the full vector isntead of a range object pass `:arr` as the 1st argument.

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
function linspaceM(collectSymbol::Symbol, args...)
    if collectSymbol == :arr
        return collect(linspaceM(args...))
    end
end
################################################################
"""
    logspaceM(start, stop) # gives 50 points
    logspaceM(start, stop, length)
    logspaceM(start, stop, :equal) # equally spaced powers of 10

Generate logarithmically spaced vector (between `10^start` and `10^stop`). `length` is the number of the poinst (50 by defualt if not supplied). If you instead provide `:equal`, it makes a range from equally spaced powers of 10

For `logspaceM` in contrast to `linspaceM`, the full vector is given by default.

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
    meshgridM(vx)
    meshgridM(vx,vy)
    meshgridM(vx,vy,vz)

Creates a 2-dimensional or 3-dimensional rectangular grid, that spans the space made by it.

`meshgridM(vx)` computes a 2-D (x,y)-grid from the vectors (vx,vx).

`meshgridM(vx,vy)` computes a 2-D (x,y)-grid from the vectors (vx,vy).

`meshgridM(vx,vy,vz)` computes a 3-D (x,y,z)-grid from the vectors (vx,vy,vz).

meshgridM's 1st output is the transpose of ngridsM's 1st output. It is the same for the 2nd output.

Modified from https://github.com/ChrisRackauckas/VectorizedRoutines.jl/blob/master/src/matlab.jl

# Examples
```julia
m1Meshgrid0, m2Meshgrid0 = meshgridM(1:2:5) # a 2-D rectangle spanning 1:2:5 in x and y direction == [[1;1;1][3;3;3] [5;5;5]] and [1 1 1; 3 3 3; 5 5 5]

m1Meshgrid1, m2Meshgrid1 = meshgridM(1:2:5, 1:2:5) #  a 2-D rectangle spanning 1:2:5 in x and y direction == ([1 3 5;1 3 5; 1 3 5],[1 1 1; 3 3 3; 5 5 5])

m1Meshgrid2, m2Meshgrid2, m3Meshgrid2 = meshgridM(1:6, 20:25, 5:10) # a 3-D rectangle spanning 1:6 in x, 20:25 in y, and 5:10 in z
```
 """
 meshgridM(v::AbstractVector) = meshgridM(v, v)

 function meshgridM(vx::AbstractVector{T}, vy::AbstractVector{T}) where {T}
     m, n = length(vy), length(vx)
     vx = reshape(vx, 1, n)
     vy = reshape(vy, m, 1)
     (repeat(vx, m, 1), repeat(vy, 1, n))
 end

 function meshgridM(vx::AbstractVector{T}, vy::AbstractVector{T},
                      vz::AbstractVector{T}) where {T}
     m, n, o = length(vy), length(vx), length(vz)
     vx = reshape(vx, 1, n, 1)
     vy = reshape(vy, m, 1, 1)
     vz = reshape(vz, 1, 1, o)
     om = ones(Int, m)
     on = ones(Int, n)
     oo = ones(Int, o)
     (vx[om, :, oo], vy[:, on, oo], vz[om, on, :])
 end
################################################################
"""
    ngridM(x1, x2,...)
    ngridM(x, dim = dimAsInteger)

Creates a N-dimensional rectangular grid, that spans the space made by it.

In `ngridM(x1, x2,...)`, depending on the number of inputs, the dimension of output grid is specified.

In `ngridM(x, dim = dimAsInteger)`, user should explicitly pass the dimension as an integer to the function.

ngridsM's 1st output is the transpose of meshgridM()'s 1st output. It is the same for the 2nd output.

Modified from https://github.com/ChrisRackauckas/VectorizedRoutines.jl/blob/master/src/matlab.jl

# Examples
```julia
m1Ndgrid0, m2Ndgrid0 = ndgridM(1:2:5, dim = 2) # a 2-D rectangle spanning 1:2:5 in x and y direction == [1 1 1; 3 3 3; 5 5 5] and [1 3 5;1 3 5; 1 3 5]

m1Ndgrid1, m2Ndgrid1 = ndgridM(1:2:5, 1:2:5) #  a 2-D rectangle spanning 1:2:5 in x and y direction == ([1 1 1; 3 3 3; 5 5 5], [1 3 5;1 3 5; 1 3 5])

m1Ndgrid2, m2Ndgrid2, m3Ndgrid2 = ndgridM(1:6, 20:25, 5:10) # a 3-D rectangle spanning 1:6 in x, 20:25 in y, and 5:10 in z
```
"""
ndgridM(v::AbstractVector; dim::Integer) = ndgridM(ntuple(x -> v, dim)...)

function ndgridM(v1::AbstractVector{T}, v2::AbstractVector{T}) where {T}
    m, n = length(v1), length(v2)
    v1 = reshape(v1, m, 1)
    v2 = reshape(v2, 1, n)
    return (repeat(v1, 1, n), repeat(v2, m, 1))
end

function ndgrid_fill(a, v, s, snext)
    for j = 1:length(a)
        a[j] = v[div(rem(j - 1, snext), s)+1]
    end
    return a
end

function ndgridM(vs::AbstractVector{T}...) where {T}
    n = length(vs)
    if n == 1
        error("You should explicitly pass number of dimensions as a keywork argument like `ngridM(x, dim = 2)`")
    end
    sz = map(length, vs)
    out = ntuple(i -> Array{T}(undef, sz), n)
    s = 1
    for i = 1:n
        a = out[i]::Array
        v = vs[i]
        snext = s * size(a, i)
        ndgrid_fill(a, v, s, snext)
        s = snext
    end
    return out
end
################################################################
"""
    freqspaceM(n, opt, dim = dimAsInteger)

Returns the implied frequency range for equally spaced frequency responses.

Pass `:whole` when dim=1, to get m evenly spaced points around the whole unit circle.

Pass `:meshgridM` when dim=2, to get meshgrid of the frequency range.

# Examples
```julia
mFreqspace1 = freqspaceM(10, dim = 1) # 0:0.2:1

mFreqspace2 = freqspaceM(10, :whole, dim = 1) # 0:0.2:1.8

m1Freqspace3, m2Freqspace3 = freqspaceM(10, dim = 2) # returns two -1:0.2:0.8

m1Freqspace4, m2Freqspace4 = freqspaceM(10, :meshgrid, dim = 2) # returns mesgridM(-1:0.2:0.8, -1:0.2:0.8), which is two -1:0.2:0.8
```
"""
function freqspaceM(n::Integer, opt::Symbol = :nothing ; dim::Integer)

    if dim == 1
        if opt != :whole
            if n != 0
                f = 0:2/n:1
            else
                f = zeros(eltype(n), 1, 0)
            end
            return f
        else
            f = 0:2/n:2*(n-1)/n
            return f
        end
    elseif dim == 2

        if iseven(n)
            f = [-n:2:n-2] / n
        else
            f = [-n+1:2:n-1] / n
        end

        if opt != :meshgrid
            return f, f
        else
            return meshgridM(f, f)
        end
    else
        error("dim should be 1 or 2")
    end
end
################################################################
"""
    lengthM(A)

Length of the largest array dimension of `A`.
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
    sizeAsTuple = sizeM(A)
    sizeDim = sizeM(dim)  # only returns the specified dim
    sizeDimAsTuple = sizeM(A, dim1, dim2,...) # only returns the specified dims
    sizeAsArray = sizeM(:arr, A)
    sizeDimAsArray = sizeM(:arr, A, dim1, dim2,...) # only returns the specified dims
    sz1, sz2, ... = size(A)

Returns the size of an array as a Tuple.

Pass `:arr` to get size as an Array (not a Tuple).

Consider the points that are explained here when using this function: [Julia Arrays](https://juliamatlab.github.io/MatLang/dev/juliavsmatlab/#Julia-Arrays:-1)

# Examples
```julia
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

```
"""
sizeM(args...) = size(args...)
sizeM(A::AbstractArray, dim1::Integer, dim2::Integer...) = size(A)[[dim1, dim2...]]

# collect symbol - :arr
function sizeM(collectSymbol::Symbol, A::AbstractArray, dim1::Integer, dim2::Integer...)
    if collectSymbol == :arr
        return collect(size(A))[[dim1, dim2...]] # = getindex(collect(size(A)), [dim1, dim2...])
    end
end

function sizeM(collectSymbol::Symbol, args...)
    if collectSymbol == :arr
        return collect(sizeM(args...))
    end
end
################################################################
"""
    ndimsM(A)


Return the number of dimensions of `A`.

In contrast to Matlab equivalent, this function considers trailing singleton dimensions,

Consider the points that are explained here when using this function: [Julia Arrays](https://juliamatlab.github.io/MatLang/dev/juliavsmatlab/#Julia-Arrays:-1)

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

Returns the number of elements of array `A`.

# Examples
```julia
nNumel1 = numelM(1:5) # 5

nNumel2 = numelM([1, 2, 3, 4]) # 4

nNumel3 = numelM([1 2; 3 4]) # 4
```
"""
const numelM = length
################################################################
using Base.Broadcast
"""
    isscalarM(x)
    isscalarM(:mat, x)

Returns boolean true if x is scalar.

It uses `Broadcast.DefaultArrayStyle{0}`, which basically are numbers (0-dimensional) and 1 dimensional-1 element number arrays.

To get a MATLAB way result, pass `:mat` argument. Doing this:
* For arrays (of any element type), it calculates number of elements (using `numelM`).
* For single strings it calculates number of characters (using `numelM`).
* For others, if it is among `{Number,Char,Bool}`, then it is considered scalar.


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
    isvectorM(x)

Returns boolean true if x is a vector.


It uses AbstractVector, which basically are 1 dimensional arrays.

To get a MATLAB way result, pass `:mat` argument. Doing this:
* For arrays (of any element type), it considers 1-dimensional arrays and also 2-dimensional arrays that one of their dimensions are singletone.
* For others, if it is among `{Number, AbstractString, Char, Bool}`, then it is considered vectir.

# Examples
```julia
A1 = [1; 2; 3] # or [1, 2, 3]
bIsvector1 = isvectorM(A1) # true

A2 = [1 2 3]
bIsvector2 = isvectorM(A2) # false

bIsvector3 = isvectorM(ones(3, 1)) # false

bIsvector4 = isvectorM(ones(1, 3)) # false

bIsvector5 = isvectorM(ones(3)) # true

bIsvector6 = isvectorM("Hi") # false

# Matlab Way:
bIsvector7 = isvectorM(["Hi", "Bye"]) # true

bIsvectorMat1 = isvectorM(:mat, A1) # true

bIsvectorMat2 = isvectorM(:mat, A2) # true

bIsvectorMat3 = isvectorM(:mat, ones(3, 1)) # true

bIsvectorMat4 = isvectorM(:mat, ones(1, 3)) # true

bIsvectorMat5 = isvectorM(:mat, ones(3)) # true

bIsvectorMat6 = isvectorM(:mat, "Hi") # true

bIsvectorMat7 = isvectorM(:mat, ["Hi", "Bye"]) # true
```
"""
isvectorM(x) = isa(x, AbstractVector)

function isvectorM(matlabWaySymbol::Symbol, x::AbstractArray)
    if matlabWaySymbol == :mat
        return ndimsM(x) == 1 || (ndimsM(x) == 2 && (size(x, 1) == 1 || size(x,2) == 1))
    end
end

function isvectorM(matlabWaySymbol::Symbol, x::Any)
    if matlabWaySymbol == :mat
        return isa(x, Union{Number, AbstractString, Char, Bool})
    end
end
################################################################
"""
    sortM(A)
    sortM(A,dim)
    sortM(..., direction)

Sorts array elements

If A is an matrix and dim not specified, it sorts each column. If A is an array, it sorts along first dimension

Optionally, specify direction as `:ascend` or `:descend`. Default one is `:ascend`.

See [`sort`](@ref) doc for more options.

To do: implement NaN, undef, missing placement options. Implement comparison method for complex numbers. Implement ignoring of first dimensions which are 1 in multidimensional arrays.

# Examples
```julia
mSort1 = sortM([5, 3, 19, 20, 1, 4]) # [1, 3, 4, 5, 19, 20]

mSort2 = sortM([5, 3, 19, 20, 1, 4], :descend) # [20,19,5,4,3,1]

mSort3 = sortM([1 5 3; 4 1 10]) # [1 1 3; 4 5 10]

mSort4 = sortM([1 5 3; 4 1 10], 2, :ascend) # [1 3 5; 1 4 10]

A = zerosM(Integer, 2, 2, 2)
A[:, :, 1] = [2 3; 1 6]
A[:, :, 2] = [-1 9; 0 12]
mSort5 = sortM(A, 3) # 3D sort
```
"""
sortM(args...) = sort(args...)

function sortM(V::AbstractVector, direction::Symbol=:ascend)
    if direction == :ascend
        return sort(V)
    elseif direction == :descend
        return sort(V, rev=true)
    end
end
function sortM(A::AbstractArray, dim::Integer = 1, direction::Symbol=:ascend)
    if direction == :ascend
        return sort(A,dims=dim)
    elseif direction == :descend
        return sort(A,dims=dim, rev=true)
    end
end
################################################################
"""
    flipM(A)

Flip elements of a vector
Flip elements of an array along columns
Flip a string

    flipM(A, dim)

Flip elements of an array along specifed dim

# Examples
```julia
sFlip1 = flipM("Hi") # "iH"

mFlip2 = flipM([1; 2; 3; 4]) #[4;3;2;1]

mFlip3 = flipM([1 2; 3 4]) # flips every column: # [3 4; 1 2]

mFlip4 = flipM([1 2; 3 4], 2) # flip along dims 2: #[2 1; 4 3]
```
"""
flipM(V::Any) = reverse(V::Any)
flipM(A::AbstractArray, n::Integer = 1) = reverse(A, dims = n)
################################################################
"""
    fliplrM(A)

Flip input left to right
See [`flipM`](@ref) doc
"""
fliplrM(V::Any) = reverse(V::Any)
fliplrM(A::AbstractArray) = reverse(A, dims = 2)
################################################################
"""
    flipudM(A)

Flip input up to down
See [`flipM`](@ref) doc
"""
flipudM(V::Any) = reverse(V::Any)
flipudM(A::AbstractArray) = reverse(A, dims = 1)
################################################################
"""
    flipdimM(A, dim)

See [`flipM`](@ref) doc
"""
flipdimM(A::AbstractArray, n::Integer) = reverse(A, dims = n)
################################################################
"""
    rot90M(A)
    rot90M(A, k)

Rotate 90 or 90*k degress counter clock wise.

# Examples
```julia
mRot1 = rot90M([1 2; 3 4]) #[2 4; 1 3]

mRot2 = rot90M([1 2; 3 4], 3) # [3 1; 4 2]
```
"""
const rot90M = rotl90
################################################################
"""
    transposeM(A)
    transposeM(:arr, A)

Returns the transpose an array.

If `:arr` is supplied `permutedims` method is used which returns an array rather a transpose object.

You can use `'` for transposing an Array (e.g `A'`), the result is an adjoint object. If you want, you can get the array using `collect()`. Be careful that in Julia `.'` is not used for transposing.

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

"""
    squeezeM(A)

Drops all of the singleton dimensions of `A` (dimensions that are 1).
If `A` contains only one element (i.e., all of its dimensions are singletons) then the output will be a zero-dimensional array.

If you know the dimension that you want to drop, use dropdims(A ; dims= dimensionsToRemove).

Only use this function if you don't know the dimensions that you want to remove, and you are sure that you are not removing important dimensions, and if you don't care about type stability.

Returns an array containing the same data as `A` but with no singleton dimensions; note that the output is NOT a copy of `A`, i.e., modifying the contents of output will modify the contents of `A`. To get a copy use copy(output).

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
