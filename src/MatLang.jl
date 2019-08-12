module MatLang
using Requires
using LinearAlgebra

# Main Functions
export clcM, eyeM, diagM

# Native Julia functions that are just a copy:
export zerosM, onesM, randM


# Command Window (REPL console):
################################################################
"""
    clcM

Clear Command Window for Juno or Atom IDE
"""
function clcM()
#    Juno.clearconsole(); # defined in @require instead
end
################################################################


################################################################

# Matrices and Arrays:
################################################################
const zerosM = zeros
################################################################
const onesM = ones
################################################################
const randM = rand
################################################################
"""
    eyeM(s1,s2,...)
    eyeM(sizeAsTuple)

Creates Identity matrix (can be non-square matrix).
Example
'''jl
mEye=eyeM(2,3); # [1 0 0; 0 1 0]
mEye2=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]
s1=size(ones(2,3))
mEye3=eyeM(s1)  # giving size as a variable (Tuple).
'''
"""
function eyeM(args...)
    return Matrix{Int64}(I, args...)
end
################################################################
################################################################
"""
    diagM(v)
    diagM(v,k)

Create a diagonal matrix from vector v. If k is given, the vector v will be placed on kth diagonal
Example
'''jl
mDiag=diagM([2,3,4]) # [0 2 0 ; 0 3 0; 0 4]
mDiag=diagM([2,3,4],1) # [0 2 3 0; 0 0 3 0; 0 0 0 4; 0 0 0 0]
'''

    diag(A)

Returns diagonal of A as a vector.
"""
# make diagonal matrix
diagM(v)=diagm(0=>v) #where {v<:AbstractVector}=true
diagM(v,k)=diagm(k=>v) #where {v<:AbstractVector, k<:Integer}=true
# give diagonal
################################################################

# Conditional REQUIRE - https://github.com/MikeInnes/Requires.jl
function __init__()
    @require Juno="e5e0dc1b-0480-54bc-9374-aad01c23163d" clcM() = Juno.clearconsole();
end

end # module
