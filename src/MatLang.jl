module MatLang
using Requires
using LinearAlgebra

# Main Functions
export clcM, zerosM, onesM, randM, eyeM, diagM

# Julia functions with M suffix
# export

################################################################
################################################################
# Command Window (REPL console):
################################################################
################################################################
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
    zerosM(sizeAsArray) # non-efficient Matlab way

# Example
mZeros=zerosM(2,2); # same as zeros(2,2)

mZeros2=zerosM(Int32,2,2); # same as zeros(Int32,2,2)

mZeros3=zerosM((2,2)); # giving size as Tuple

mZeros4=zerosM(Int32,(2,2)); # giving size as Tuple and also the Int32 type

mZeros5=zerosM([2,2]); # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mZeros6=zerosM(Int32,[2,2]); # giving size as Array, non-efficient Matlab way
"""
zerosM(args...) = zeros(args...)
zerosM(a::Array)=zeros(Tuple(a))
zerosM(T::Type,a::Array)=zeros(T::Type,Tuple(a))
################################################################
"""
    onesM(sizeAsArray) # non-efficient Matlab way

# Example
mOnes=onesM(2,2); # same as ones(2,2)

mOnes2=onesM(Int32,2,2); # same as ones(Int32,2,2)

mOnes3=onesM((2,2)); # giving size as Tuple

mOnes4=onesM(Int32,(2,2)); # giving size as Tuple and also the Int32 type

mOnes5=onesM([2,2]); # giving size as Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mOnes6=onesM(Int32,[2,2]); # giving size as Array, non-efficient Matlab way
"""
onesM(args...) = ones(args...)
onesM(a::Array)=ones(Tuple(a))
onesM(T::Type,a::Array)=onesM(T::Type,Tuple(a))
################################################################
"""
    randM(sizeAsArray) # non-efficient Matlab way

# Example
mRand=randM(2,2); # same as rand(2,2)

mRand2=randM(Int32,2,2); # same as rand(Int32,2,2)

mRand3=randM((2,2)); # giving size as Tuple

mRand4=randM(Int32,(2,2)); # giving size as Tuple and also the Int32 type

mRand5=randM([2,2]); # giving size as Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.

mRand6=randM(Int32,[2,2]); # giving size as Array, non-efficient Matlab way
"""
randM(args...) = rand(args...)
randM(a::Array)=rand(Tuple(a))
randM(T::Type,a::Array)=rand(T::Type,Tuple(a))
################################################################
"""
    eyeM(s1,s2)   # giving size as a separate input numbers
    eyeM(sizeAsTuple) # giving size as a Tuple
    eyeM(sizeAsArray) # non-efficient Matlab way

Creates 2D Identity matrix (can be non-square matrix).

Only 2 dimensions should be supplied othetwise you will receive an error.

# Example
```julia
mEye=eyeM(2,3); # [1 0 0; 0 1 0]

mEye2=eyeM(Int32,2,3); # [1 0 0; 0 1 0]

mEye3=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye4=eyeM(Int32,(2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]

mEye5=eyeM([2,2]) # non-efficient Matlab way

mEye6=eyeM(Int32,[2,2]) # non-efficient Matlab way

s1=size(ones(2,3)) # getting size from another matrix or calculation
mEye7=eyeM(s1)  # giving size as a variable (Tuple).
```
"""
eyeM(T::Type, indices::Integer...)=Matrix{T}(I, indices...)
eyeM(indices::Integer...)=eyeM(Int64, indices)

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
mDiag3=diagM([1 2 3; 4 5 6; 7 8 9]) # [1;5;9]

mDiag4=diagM([1 2 3; 4 5 6; 7 8 9],1) # [2;6]
"""
# make diagonal matrix
diagM(v::AbstractVector,k::Integer=0)=diagm(k=>v)
# give diagonal
diagM(A::AbstractMatrix,k::Integer=0)=diag(A,k)
################################################################







end # module
