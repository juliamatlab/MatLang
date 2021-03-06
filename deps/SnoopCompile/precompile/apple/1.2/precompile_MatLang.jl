function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.eyeM)),NamedTuple{(:like,),Tuple{Array{Int8,2}}},typeof(eyeM),Int64,Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.freqspaceM)),NamedTuple{(:dim,),Tuple{Int64}},typeof(freqspaceM),Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.ndgridM)),NamedTuple{(:dim,),Tuple{Int64}},typeof(ndgridM),StepRange{Int64,Int64}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.onesM)),NamedTuple{(:like,),Tuple{Array{Float64,2}}},typeof(onesM),Array{Int64,1}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.onesM)),NamedTuple{(:like,),Tuple{Array{Int32,2}}},typeof(onesM),Symbol,Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.onesM)),NamedTuple{(:like,),Tuple{Array{Int64,2}}},typeof(onesM),Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.randM)),NamedTuple{(:like,),Tuple{Array{Float64,2}}},typeof(randM),Array{Int64,1}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.randM)),NamedTuple{(:like,),Tuple{Array{Int32,2}}},typeof(randM),Symbol,Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.randM)),NamedTuple{(:like,),Tuple{Array{Int64,2}}},typeof(randM),Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.sortM)),NamedTuple{(:I,),Tuple{Bool}},typeof(sortM),Array{Int64,1}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.sortM)),NamedTuple{(:I,),Tuple{Bool}},typeof(sortM),Array{Int64,2},Int64,Symbol})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.sortperm)),NamedTuple{(:dims,),Tuple{Int64}},typeof(sortperm),Array{Int64,2}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.zerosM)),NamedTuple{(:like,),Tuple{Array{Float64,2}}},typeof(zerosM),Array{Int64,1}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.zerosM)),NamedTuple{(:like,),Tuple{Array{Int32,2}}},typeof(zerosM),Symbol,Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.zerosM)),NamedTuple{(:like,),Tuple{Array{Int64,2}}},typeof(zerosM),Int64})
    Base.precompile(Tuple{typeof(blkdiagM),Array{Float64,2},Array{Float64,2},Vararg{Array{Float64,2},N} where N})
    Base.precompile(Tuple{typeof(blkdiagM),Symbol,Array{Float64,2},Vararg{Array{Float64,2},N} where N})
    Base.precompile(Tuple{typeof(catM),Int64,Array{Float64,2},Vararg{Array{Float64,2},N} where N})
    Base.precompile(Tuple{typeof(catM),Int64,Array{Float64,3},Vararg{Array{Float64,3},N} where N})
    Base.precompile(Tuple{typeof(clcM)})
    Base.precompile(Tuple{typeof(diagM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(diagM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(doubleM),Float64})
    Base.precompile(Tuple{typeof(eyeM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(eyeM),Int64,Int64})
    Base.precompile(Tuple{typeof(eyeM),Int64})
    Base.precompile(Tuple{typeof(eyeM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(eyeM),Type,Array{Int64,1}})
    Base.precompile(Tuple{typeof(eyeM),Type,Int64,Int64})
    Base.precompile(Tuple{typeof(eyeM),Type,Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(falseM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(falseM),Int64})
    Base.precompile(Tuple{typeof(falseM),Symbol,Int64})
    Base.precompile(Tuple{typeof(falseM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(flipM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(flipM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(flipM),String})
    Base.precompile(Tuple{typeof(int16M),Int64})
    Base.precompile(Tuple{typeof(int32M),Int64})
    Base.precompile(Tuple{typeof(int64M),Int64})
    Base.precompile(Tuple{typeof(int8M),Int64})
    Base.precompile(Tuple{typeof(iscolumnM),Array{Float64,1}})
    Base.precompile(Tuple{typeof(iscolumnM),Array{Float64,2}})
    Base.precompile(Tuple{typeof(iscolumnM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(iscolumnM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(iscolumnM),Array{String,1}})
    Base.precompile(Tuple{typeof(iscolumnM),Array{String,2}})
    Base.precompile(Tuple{typeof(iscolumnM),Int64})
    Base.precompile(Tuple{typeof(iscolumnM),String})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,Array{Float64,1}})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,Array{Float64,2}})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,Array{Int64,1}})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,Array{Int64,2}})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,Array{String,1}})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,Int64})
    Base.precompile(Tuple{typeof(iscolumnM),Symbol,String})
    Base.precompile(Tuple{typeof(ismatrixM),Array{Float64,1}})
    Base.precompile(Tuple{typeof(ismatrixM),Array{Float64,2}})
    Base.precompile(Tuple{typeof(ismatrixM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(ismatrixM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(ismatrixM),Array{String,1}})
    Base.precompile(Tuple{typeof(ismatrixM),Array{String,2}})
    Base.precompile(Tuple{typeof(ismatrixM),String})
    Base.precompile(Tuple{typeof(ismatrixM),Symbol,Array{Float64,1}})
    Base.precompile(Tuple{typeof(ismatrixM),Symbol,Array{Float64,2}})
    Base.precompile(Tuple{typeof(ismatrixM),Symbol,Array{Int64,1}})
    Base.precompile(Tuple{typeof(ismatrixM),Symbol,Array{Int64,2}})
    Base.precompile(Tuple{typeof(ismatrixM),Symbol,Array{String,1}})
    Base.precompile(Tuple{typeof(ismatrixM),Symbol,String})
    Base.precompile(Tuple{typeof(isrowM),Array{Float64,1}})
    Base.precompile(Tuple{typeof(isrowM),Array{Float64,2}})
    Base.precompile(Tuple{typeof(isrowM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(isrowM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(isrowM),Array{String,1}})
    Base.precompile(Tuple{typeof(isrowM),Array{String,2}})
    Base.precompile(Tuple{typeof(isrowM),Int64})
    Base.precompile(Tuple{typeof(isrowM),String})
    Base.precompile(Tuple{typeof(isrowM),Symbol,Array{Float64,1}})
    Base.precompile(Tuple{typeof(isrowM),Symbol,Array{Float64,2}})
    Base.precompile(Tuple{typeof(isrowM),Symbol,Array{Int64,1}})
    Base.precompile(Tuple{typeof(isrowM),Symbol,Array{Int64,2}})
    Base.precompile(Tuple{typeof(isrowM),Symbol,Array{String,1}})
    Base.precompile(Tuple{typeof(isrowM),Symbol,Int64})
    Base.precompile(Tuple{typeof(isrowM),Symbol,String})
    Base.precompile(Tuple{typeof(isscalarM),Array{Float64,3}})
    Base.precompile(Tuple{typeof(isscalarM),Array{String,1}})
    Base.precompile(Tuple{typeof(isscalarM),Array{String,2}})
    Base.precompile(Tuple{typeof(isscalarM),Bool})
    Base.precompile(Tuple{typeof(isscalarM),Char})
    Base.precompile(Tuple{typeof(isscalarM),Int64})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Array{Float64,3}})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Array{Int64,1}})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Array{String,1}})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Array{String,2}})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Bool})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Char})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,Int64})
    Base.precompile(Tuple{typeof(isscalarM),Symbol,String})
    Base.precompile(Tuple{typeof(isvectorM),Array{Float64,1}})
    Base.precompile(Tuple{typeof(isvectorM),Array{Float64,2}})
    Base.precompile(Tuple{typeof(isvectorM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(isvectorM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(isvectorM),Array{String,1}})
    Base.precompile(Tuple{typeof(isvectorM),Array{String,2}})
    Base.precompile(Tuple{typeof(isvectorM),Int64})
    Base.precompile(Tuple{typeof(isvectorM),String})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,Array{Float64,1}})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,Array{Float64,2}})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,Array{Int64,1}})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,Array{Int64,2}})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,Array{String,1}})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,Int64})
    Base.precompile(Tuple{typeof(isvectorM),Symbol,String})
    Base.precompile(Tuple{typeof(lengthM),Array{Any,2}})
    Base.precompile(Tuple{typeof(lengthM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(linspaceM),Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(linspaceM),Int64,Int64})
    Base.precompile(Tuple{typeof(linspaceM),Symbol,Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(linspaceM),Symbol,Int64,Int64})
    Base.precompile(Tuple{typeof(logspaceM),Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(logspaceM),Int64,Int64,Symbol})
    Base.precompile(Tuple{typeof(logspaceM),Int64,Int64})
    Base.precompile(Tuple{typeof(meshgridM),StepRange{Int64,Int64}})
    Base.precompile(Tuple{typeof(meshgridM),UnitRange{Int64},UnitRange{Int64},UnitRange{Int64}})
    Base.precompile(Tuple{typeof(ndgridM),UnitRange{Int64},UnitRange{Int64},UnitRange{Int64}})
    Base.precompile(Tuple{typeof(onesM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(onesM),Int64})
    Base.precompile(Tuple{typeof(onesM),Symbol,Int64})
    Base.precompile(Tuple{typeof(onesM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(onesM),Type,Int64,Int64})
    Base.precompile(Tuple{typeof(onesM),Type,Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(onesM),Type{Int32},Array{Int64,1}})
    Base.precompile(Tuple{typeof(randM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(randM),Int64})
    Base.precompile(Tuple{typeof(randM),Symbol,Int64})
    Base.precompile(Tuple{typeof(randM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(randM),Type,Int64,Int64})
    Base.precompile(Tuple{typeof(randM),Type,Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(randM),Type{Int32},Array{Int64,1}})
    Base.precompile(Tuple{typeof(repelemM),Array{Int64,2},Int64})
    Base.precompile(Tuple{typeof(repmatM),Array{Int64,1},Array{Int64,1}})
    Base.precompile(Tuple{typeof(repmatM),Array{Int64,1},Int64,Int64})
    Base.precompile(Tuple{typeof(repmatM),Array{Int64,1},Int64})
    Base.precompile(Tuple{typeof(repmatM),Array{Int64,1},Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(repmatM),Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(singleM),Float64})
    Base.precompile(Tuple{typeof(sizeM),Array{Float64,3},Int64,Int64})
    Base.precompile(Tuple{typeof(sizeM),Array{Int64,2},Int64})
    Base.precompile(Tuple{typeof(sizeM),Symbol,Array{Float64,3},Int64,Int64})
    Base.precompile(Tuple{typeof(sizeM),Symbol,Array{Int64,2},Int64})
    Base.precompile(Tuple{typeof(sizeM),Symbol,Array{Int64,2}})
    Base.precompile(Tuple{typeof(sortM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(sortM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(sortM),Array{Integer,3},Int64})
    Base.precompile(Tuple{typeof(squeezeM),Array{Float64,3}})
    Base.precompile(Tuple{typeof(transposeM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(transposeM),Symbol,Array{Int64,2}})
    Base.precompile(Tuple{typeof(trueM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(trueM),Int64})
    Base.precompile(Tuple{typeof(trueM),Symbol,Int64})
    Base.precompile(Tuple{typeof(trueM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(uint16M),Int64})
    Base.precompile(Tuple{typeof(uint32M),Int64})
    Base.precompile(Tuple{typeof(uint64M),Int64})
    Base.precompile(Tuple{typeof(uint8M),Int64})
    Base.precompile(Tuple{typeof(zerosM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(zerosM),Int64})
    Base.precompile(Tuple{typeof(zerosM),Symbol,Int64})
    Base.precompile(Tuple{typeof(zerosM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(zerosM),Type,Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(zerosM),Type,Int64,Int64})
    Base.precompile(Tuple{typeof(zerosM),Type,Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(zerosM),Type{Int32},Array{Int64,1}})
    isdefined(MatLang, Symbol("##32#33")) && Base.precompile(Tuple{getfield(MatLang, Symbol("##32#33")),Array{Int64,1}})
    isdefined(MatLang, Symbol("##sortperm#31")) && Base.precompile(Tuple{getfield(MatLang, Symbol("##sortperm#31")),Int64,Bool,typeof(sortperm),Array{Int64,2}})
end
