################################################################
################################################################
# Matrices_and_Arrays
################################################################
################################################################
# Copy of Julia Functions/Types
natives = [:isempty] # input symbols
for n in natives
    @eval begin
        @doc @doc($n) $(Symbol(n, "M"))
        const $(Symbol(n, "M")) = $n
        export $(Symbol(n, "M"))
    end
end
################################################################
import Base: DimOrInd, OneTo
for (fname, fnative, docIn) in ((:zerosM, :zeros, "zero"), (:onesM, :ones, "one"), (:randM, :rand, "random"))
    @eval begin

        # init
        function $fname end

        # doc
        @doc """
            $($fname)

        returns an array filled with $($docIn) values.

        In addition to original Julia methods the following methods are provided:

            $($fname)(..., like = anArray) # to make an array with similar type of anArray
            $($fname)(Type, ...)           # to give type explicitly

        Above input arguments work with any other method.

            $($fname)(sizeAsArray)

        To give size as an array (non-efficient Matlab way).

            $($fname)(:mat, dim)         # square dim*dim matrix
            $($fname)(:mat, Type, dim)   # square dim*dim matrix

        `$($fname)(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.

        # Examples
        ```julia
        m$($docIn)0 = $($fname)(:mat, 2) # same as $($fnative)(2,2)

        m$($docIn)1 = $($fname)(:mat, 2, like = $($fname)(Int32, 2, 2)) # like method

        A=[2 1 2]
        m$($docIn)2 = $($fname)(2, like=A) # same as $($fnative)(Int64,2)

        m$($docIn)3 = $($fname)(2) # same as $($fnative)(2)

        m$($docIn)4 = $($fname)(Int32, 2, 2) # same as $($fnative)(Int32,2,2)

        # giving size as Tuple
        m$($docIn)5 = $($fname)((2, 2)) # = $($fname)(2,2)

        m$($docIn)6 = $($fname)(Int32, (2, 2))

        # giving size as an Array
        ## non-efficient Matlab way. Array should be Integer otherwise you will get errors.

        m$($docIn)7 = $($fname)([2, 2])

        m$($docIn)8 = $($fname)(Int32, [2, 2])

        m$($docIn)9 = $($fname)([2, 2], like = [2.5 3.0])
        ```
        """ $(fname)

        # copying methods
        # includes T::Type methods
        $fname(args...)=$fnative(args...)

        # Tuple as input methods
        $fname(dims::DimOrInd...; like::Array = Vector{Float64}()) =
        $fnative(eltype(like), dims)

        $fname(dims::NTuple{N, Union{Integer, OneTo}}; like::Array = Vector{Float64}()) where {N} =
        $fnative(eltype(like), dims)

        $fname(dims::Tuple{Vararg{DimOrInd}}; like::Array = Vector{Float64}()) =
        $fnative(eltype(like), dims)

        $fname(dims::Tuple{}; like::Array = Vector{Float64}()) =
        $fnative(eltype(like), dims)

        # another way kept as a reference
        # $fname(dims::Tuple{}}; like::Union{Array,Nothing}=nothing) =
        # like === nothing
        # ? $fnative(dims)
        # : $fnative(eltype(like), dims)

        # Array as input methods
        $fname(a::Array; like::Array = Vector{Float64}()) =
        $fnative(eltype(like), Tuple(a))

        $fname(::Type{T}, a::Array) where {T} = $fnative(T, Tuple(a))

        # square matrix with one dim input
        function $fname(matSymbol::Symbol, ::Type{T}, dim::Integer) where {T}
            if matSymbol == :mat
                return $fnative(T, dim, dim)
            end
        end

        function $fname(matSymbol::Symbol, dim::Integer; like::Array=Vector{Float64}())
            if matSymbol == :mat
                return $fnative(eltype(like), dim, dim)
            end
        end
    end
end
################################################################
for (fname, fnative, docIn) in ((:trueM, :trues, "true"), (:falseM, :falses, "false"))
    @eval begin

        # init
        function $fname end

        # doc
        @doc """
            $($fname)

        returns an array filled with $($docIn) values.

        In addition to original Julia methods the following methods are provided:

            $($fname)(sizeAsArray)

        To give size as an array (non-efficient Matlab way).

            $($fname)(:mat, dim)         # square dim*dim matrix

        `$($fname)(dim)` returns 1-dimensional array. To get a square matrix like in Matlab, pass `:mat` as the 1st argument.


        # Examples
        ```julia
        m$($docIn)0 = $($fname)(:mat, 2) # same as $($fnative)(2,2)

        m$($docIn)1 = $($fname)(2) # same as $($fnative)(2)

        # giving size as Tuple
        m$($docIn)2 = $($fname)((2, 2)) # = $($fnative)(2,2)

        # giving size as an Array
        ## non-efficient Matlab way. Array should be Integer otherwise you will get errors.
        m$($docIn)3 = $($fname)([2, 2])
        ```
        """ $(fname)

        # copying methods
        $fname(args...)=$fnative(args...)

        # Array as input methods
        $fname(a::Array) =$fnative(Tuple(a))

        # square matrix with one dim input
        function $fname(matSymbol::Symbol, dim::Integer)
            if matSymbol == :mat
                return $fnative(dim, dim)
            end
        end
    end
end
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
sizeM(A::AbstractArray, dim1::Integer, dim2::Integer, dims3::Integer...) = size(A)[[dim1, dim2, dims3...]]

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
* For others, if it is among `{Number, AbstractString, Char, Bool}`, then it is considered matrix.

# Examples
```julia
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
    ismatrixM(x)

Returns boolean true if x is a matrix.


It uses AbstractMatrix, which basically are two dimensional arrays.

To get a MATLAB way result, pass `:mat` argument. Doing this:
* For arrays (of any element type), it considers 1-dimensional arrays as matrix.
* For others, if it is among `{Number, AbstractString, Char, Bool}`, then it is considered matrix.

# Examples
```julia
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
```
"""
ismatrixM(x) = isa(x, AbstractMatrix)

function ismatrixM(matlabWaySymbol::Symbol, x::AbstractArray)
    if matlabWaySymbol == :mat
        return ndimsM(x) <= 2
    end
end

function ismatrixM(matlabWaySymbol::Symbol, x::Any)
    if matlabWaySymbol == :mat
        return isa(x, Union{Number, AbstractString, Char, Bool})
    end
end
################################################################
"""
    isrowM(x)

Returns boolean true if x is a row matrix.


Checks for being a row AbstractMatrix.

To get a MATLAB way result, pass `:mat` argument. Doing this:
* For arrays (of any element type), same as Julia answer.
* For others, if it is among `{Number, AbstractString, Char, Bool}`, then it is considered a row.

# Examples
```julia
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
```
"""
isrowM(x) = isa(x, AbstractMatrix) && sizeM(x, 1) == 1

function isrowM(matlabWaySymbol::Symbol, x::AbstractArray)
    if matlabWaySymbol == :mat
        return isa(x, AbstractMatrix) && sizeM(x, 1) == 1
    end
end

function isrowM(matlabWaySymbol::Symbol, x::Any)
    if matlabWaySymbol == :mat
        return isa(x, Union{Number, AbstractString, Char, Bool})
    end
end
################################################################
"""
    iscolumnM(x)

Returns boolean true if x is a column matrix.


Checks for being a column AbstractMatrix.

To get a MATLAB way result, pass `:mat` argument. Doing this:
* For arrays (of any element type), in addtion to column AbstractMatrices,  it also considers 1-dimensional arrays.
* For others, if it is among `{Number, AbstractString, Char, Bool}`, then it is considered a column.

# Examples
```julia
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
```
"""
iscolumnM(x) = isa(x, AbstractMatrix) && sizeM(x, 2) == 1

function iscolumnM(matlabWaySymbol::Symbol, x::AbstractArray)
    if matlabWaySymbol == :mat
        return isa(x, AbstractVecOrMat) && sizeM(x, 2) == 1
    end
end

function iscolumnM(matlabWaySymbol::Symbol, x::Any)
    if matlabWaySymbol == :mat
        return isa(x, Union{Number, AbstractString, Char, Bool})
    end
end
################################################################
"""
    sortM(A)
    sortM(A,dim)
    sortM(..., direction)
    sortM(..., I=true)

Sorts array elements

If A is an matrix and dim not specified, it sorts each column. If A is an array, it sorts along first dimension

Optionally, specify direction as `:ascend` or `:descend`. Default one is `:ascend`.

If you want to get sort index as an output, you should pass `I=true`, as a keyword argument to the function. In this case sorted array is given as the first output using A[I]. This method is supported up to 2 dimensional matrices.

See [`sort`](@ref) doc for more options.

# Examples
```julia
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
```
"""
sortM(args...) = sort(args...)

function sortM(V::AbstractVector, direction::Symbol = :ascend; I::Bool = false)

    if direction == :ascend
        if !I
            return sort(V)
        else
            idx = sortperm(V)
            return V[idx], idx
        end
    elseif direction == :descend
        if !I
            return sort(V, rev = true)
        else
            idx = sortperm(V, rev = true)
            return V[idx], idx
        end
    end
end
function sortM(A::AbstractArray, dim::Integer = 1, direction::Symbol=:ascend; I::Bool = false)
    if direction == :ascend
        if !I
            return sort(A, dims = dim)
        else
            idx = sortperm(A, dims = dim)
            return A[idx], idx
        end
    elseif direction == :descend
        if !I
            return sort(A, dims = dim, rev = true)
        else
            idx = sortperm(A, dims = dim, rev = true)
            return A[idx], idx
        end
    end
end

# multidimensional sortperm is missing: https://github.com/JuliaLang/julia/issues/16273

function Base.sortperm(A::AbstractMatrix; dims::Integer, rev::Bool = false)
    P = mapslices(x -> sortperm(x; rev = rev), A, dims = dims)
    if dims == 1
        for j = 1:size(P, 2)
            offset = (j - 1) * size(P, 1)
            for i = 1:size(P, 1)
                P[i, j] += offset
            end
        end
    else # if dims == 2
        for j = 1:size(P, 2)
            for i = 1:size(P, 1)
                P[i, j] = (P[i, j] - 1) * size(P, 1) + i
            end
        end
    end
    return P
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
