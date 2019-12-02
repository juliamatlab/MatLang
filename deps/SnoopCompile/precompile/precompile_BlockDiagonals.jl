function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(BlockDiagonals._block_indices), BlockDiagonals.BlockDiagonal{Float64, Array{Float64, 2}}, Int64, Int64})
end
