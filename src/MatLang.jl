module MatLang

using LinearAlgebra

# Main Functions
export clcM, zerosM, onesM, randM, eyeM, diagM, blkdiagM

# Julia functions with M suffix
# export

################################################################
################################################################
# Command Window (REPL console):
################################################################
################################################################
using Requires # for clcM

"""
    clcM

Clear Command Window for Juno or Atom IDE
"""
function clcM()
#    Juno.clearconsole(); # defined in @require instead
end
# Conditional REQUIRE - https://github.com/MikeInnes/Requires.jl
function __init__()
    @require Juno="e5e0dc1b-0480-54bc-9374-aad01c23163d" clcM() = Juno.clearconsole();
end
################################################################


################################################################
################################################################
# Matrices and Arrays:
################################################################
################################################################
"""
    zerosM(idx)         # square idx*idx matrix
    zerosM(Type,idx)    # square idx*idx matrix
    zerosM(sizeAsArray) # non-efficient Matlab way
    zerosM(Type, sizeAsArray) # non-efficient Matlab way

# Example
```julia
mZeros0=zerosM(2); # same as zeros(2,2)

mZeros1=zerosM(2,2); # same as zeros(2,2)

mZeros2=zerosM(Int32,2,2); # same as zeros(Int32,2,2)

mZeros3=zerosM((2,2)); # giving size as Tuple

mZeros4=zerosM(Int32,(2,2)); # giving size as Tuple and also the Int32 type

mZeros5=zerosM([2,2]); # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mZeros6=zerosM(Int32,[2,2]); # giving size as Array, non-efficient Matlab way
```julia
"""
zerosM(dim::Integer)=zeros(dim,dim)
zerosM(a::Array)=zeros(Tuple(a))
zerosM(T::Type,a::Array)=zeros(T::Type,Tuple(a))
zerosM(args...) = zeros(args...)
################################################################
"""
    onesM(idx)         # square idx*idx matrix
    onesM(Type,idx)    # square idx*idx matrix
    onesM(sizeAsArray) # non-efficient Matlab way
    onesM(Type, sizeAsArray) # non-efficient Matlab way

# Example
```julia
mOnes0=onesM(2); # same as ones(2,2)

mOnes1=onesM(2,2); # same as ones(2,2)

mOnes2=onesM(Int32,2,2); # same as ones(Int32,2,2)

mOnes3=onesM((2,2)); # giving size as Tuple

mOnes4=onesM(Int32,(2,2)); # giving size as Tuple and also the Int32 type

mOnes5=onesM([2,2]); # giving size as Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mOnes6=onesM(Int32,[2,2]); # giving size as Array, non-efficient Matlab way
```julia
"""
onesM(dim::Integer)=ones(dim,dim)
onesM(a::Array)=ones(Tuple(a))
onesM(T::Type,a::Array)=ones(T::Type,Tuple(a))
onesM(args...) = ones(args...)
################################################################
"""
    randM(idx)         # square idx*idx matrix
    randM(Type,idx)    # square idx*idx matrix
    randM(sizeAsArray) # non-efficient Matlab way
    randM(Type,sizeAsArray) # non-efficient Matlab way


# Example
```julia
mRand0=randM(2); # same as rand(2,2)

mRand1=randM(2,2); # same as rand(2,2)

mRand2=randM(Int32,2,2); # same as rand(Int32,2,2)

mRand3=randM((2,2)); # giving size as Tuple

mRand4=randM(Int32,(2,2)); # giving size as Tuple and also the Int32 type

mRand5=randM([2,2]); # giving size as Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mRand6=randM(Int32,[2,2]); # giving size as Array, non-efficient Matlab way
```julia
"""
randM(dim::Integer)=rand(dim,dim)
randM(a::Array)=rand(Tuple(a))
randM(T::Type,a::Array)=rand(T::Type,Tuple(a))
randM(args...) = rand(args...)
################################################################
"""
    eyeM(idx)         # square idx*idx matrix
    eyeM(Type,idx)    # square idx*idx matrix
    eyeM(idx1,idx2)   # giving size as a separate input numbers
    eyeM(Type,idx1,idx2)   # giving size as a separate input numbers
    eyeM(sizeAsTuple) # giving size as a Tuple
    eyeM(Type,sizeAsTuple) # giving size as a Tuple
    eyeM(sizeAsArray) # non-efficient Matlab way
    eyeM(Type,sizeAsArray) # non-efficient Matlab way

Creates 2D Identity matrix (can be non-square matrix).

Only 2 dimensions should be supplied othetwise you will receive an error.

# Example
```julia
mEye0=eyeM(2); # [1 0 0; 0 1 0]

mEye1=eyeM(2,3); # [1 0 0; 0 1 0]

mEye2=eyeM(Int32,2,3); # [1 0 0; 0 1 0]

mEye3=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye4=eyeM(Int32,(2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye5=eyeM([2,2]) # non-efficient Matlab way

mEye6=eyeM(Int32,[2,2]) # non-efficient Matlab way

s1=size(ones(2,3)) # getting size from another matrix or calculation
mEye7=eyeM(s1)  # giving size as a variable (Tuple).
```
"""
eyeM(T::Type, idx1::Integer, idx2::Integer)=Matrix{T}(I, idx1, idx2)
eyeM(idx1::Integer, idx2::Integer)=eyeM(Int64, idx1, idx2)

eyeM(T::Type, idx1::Integer)=Matrix{T}(I, idx1, idx1)
eyeM(idx1::Integer)=eyeM(Int64, idx1, idx1)

eyeM(T::Type, t::Tuple)=Matrix{T}(I, t)
eyeM(t::Tuple)=eyeM(Int64, t)

eyeM(T::Type,a::Array)=Matrix{T}(I, Tuple(a))
eyeM(a::Array)=eyeM(Int64,a)
################################################################
"""
    diagM(v)
    diagM(v,k)

Create a diagonal matrix from vector v. If k is given, the vector v will be placed on kth diagonal

# Example
```julia
mDiag=diagM([2,3,4]) # [0 2 0 ; 0 3 0; 0 4]

mDiag2=diagM([2,3,4],1) # [0 2 3 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
```

    diag(A)
    diag(A,k)

Returns diagonal of A as a vector.

# Example
```julia
mDiag3=diagM([1 2 3; 4 5 6; 7 8 9]) # [1;5;9]

mDiag4=diagM([1 2 3; 4 5 6; 7 8 9],1) # [2;6]
```
"""
# make diagonal matrix
diagM(v::AbstractVector,k::Integer=0)=diagm(k=>v)
# give diagonal
diagM(A::AbstractMatrix,k::Integer=0)=diag(A,k)
################################################################
"""
    blkdiagM(A1,A2,...)

Creates a square matrix with A1,A2,... on the diagonal and the rest of the elements being 0. Only works for A1,A2,... being square.

# Example
```julia
A1 = 3*ones(2,2);
A2 = 4*ones(2,2);
A3 = rand(3,3);
mBlkdiag1=blkdiagM(A1,A2,A3)

mBlkdiag2=blkdiagM(ones(2,2),2*ones(2,2)) # vcat(hcat(ones(2,2),zeros(2,2)),hcat(zeros(2,2),2*ones(2,2)))

mBlkdiag3=blkdiagM(ones(3,2),2*ones(1,4))
```
"""
function blkdiagM(in...)

    argNum=length(in)

    inSize1=collect( size.(in,1) )
    outSize1 = vcat( [0], cumsum(inSize1,dims=1) )

    inSize2=collect( size.(in,2) )
    outSize2 = vcat( [0], cumsum(inSize2,dims=1) )

    out = zeros(last(outSize1),last(outSize2));
    for k=1:argNum
        out[outSize1[k]+1:outSize1[k+1],outSize2[k]+1:outSize2[k+1]] = in[k];
    end

    return out
end
# only for square matrix:
# import BlockDiagonals # for blkdiagM
# blkdiagM(A...)=Array(BlockDiagonals.BlockDiagonal([A...]))

# only for square matrix, this method is slower:
# import SparseArrays
# blkdiagM(A...)=Array(SparseArrays.blockdiag(SparseArrays.sparse.(A)...))
################################################################

end # module
