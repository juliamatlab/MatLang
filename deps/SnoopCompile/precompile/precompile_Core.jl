function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(Core.Compiler.eltype), Type{Array{Array{Int64, 3}, 1}}})
    precompile(Tuple{typeof(Core.Compiler.eltype), Type{Array{Array{Int64, 1}, 2}}})
    precompile(Tuple{typeof(Core.Compiler.eltype), Type{Array{Base.OneTo{Int64}, 1}}})
    precompile(Tuple{typeof(Core.Compiler.eltype), Type{Array{Base.StepRange{Int64, Int64}, 1}}})
end
