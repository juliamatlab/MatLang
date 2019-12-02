function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(LinearAlgebra._diagm), Nothing, Base.Pair{Int64, Array{Int64, 1}}})
    precompile(Tuple{typeof(LinearAlgebra.diag), Array{Int64, 2}, Int64})
end
