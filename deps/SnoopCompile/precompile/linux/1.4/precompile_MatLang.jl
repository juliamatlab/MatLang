const __bodyfunction__ = Dict{Method,Any}()

# Find keyword "body functions" (the function that contains the body
# as written by the developer, called after all missing keyword-arguments
# have been assigned values), in a manner that doesn't depend on
# gensymmed names.
# `mnokw` is the method that gets called when you invoke it without
# supplying any keywords.
function __lookup_kwbody__(mnokw::Method)
    function getsym(arg)
        isa(arg, Symbol) && return arg
        @assert isa(arg, GlobalRef)
        return arg.name
    end

    f = get(__bodyfunction__, mnokw, nothing)
    if f === nothing
        fmod = mnokw.module
        # The lowered code for `mnokw` should look like
        #   %1 = mkw(kwvalues..., #self#, args...)
        #        return %1
        # where `mkw` is the name of the "active" keyword body-function.
        ast = Base.uncompressed_ast(mnokw)
        if isa(ast, Core.CodeInfo) && length(ast.code) >= 2
            callexpr = ast.code[end-1]
            if isa(callexpr, Expr) && callexpr.head == :call
                fsym = callexpr.args[1]
                if isa(fsym, Symbol)
                    f = getfield(fmod, fsym)
                elseif isa(fsym, GlobalRef)
                    if fsym.mod === Core && fsym.name === :_apply
                        f = getfield(mnokw.module, getsym(callexpr.args[2]))
                    elseif fsym.mod === Core && fsym.name === :_apply_iterate
                        f = getfield(mnokw.module, getsym(callexpr.args[3]))
                    else
                        f = getfield(fsym.mod, fsym.name)
                    end
                else
                    f = missing
                end
            else
                f = missing
            end
        else
            f = missing
        end
        __bodyfunction__[mnokw] = f
    end
    return f
end

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
    Base.precompile(Tuple{typeof(eyeM),Type{T} where T,Array{Int64,1}})
    Base.precompile(Tuple{typeof(eyeM),Type{T} where T,Int64,Int64})
    Base.precompile(Tuple{typeof(eyeM),Type{T} where T,Tuple{Int64,Int64}})
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
    Base.precompile(Tuple{typeof(onesM),Type{Int32},Array{Int64,1}})
    Base.precompile(Tuple{typeof(onesM),Type{T} where T,Int64,Int64})
    Base.precompile(Tuple{typeof(onesM),Type{T} where T,Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(randM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(randM),Int64})
    Base.precompile(Tuple{typeof(randM),Symbol,Int64})
    Base.precompile(Tuple{typeof(randM),Tuple{Int64,Int64}})
    Base.precompile(Tuple{typeof(randM),Type{Int32},Array{Int64,1}})
    Base.precompile(Tuple{typeof(randM),Type{T} where T,Int64,Int64})
    Base.precompile(Tuple{typeof(randM),Type{T} where T,Tuple{Int64,Int64}})
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
    Base.precompile(Tuple{typeof(zerosM),Type{Int32},Array{Int64,1}})
    Base.precompile(Tuple{typeof(zerosM),Type{T} where T,Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(zerosM),Type{T} where T,Int64,Int64})
    Base.precompile(Tuple{typeof(zerosM),Type{T} where T,Tuple{Int64,Int64}})
    isdefined(MatLang, Symbol("#32#33")) && Base.precompile(Tuple{getfield(MatLang, Symbol("#32#33")),Array{Int64,1}})
    let fbody = try __lookup_kwbody__(which(sortperm, (Array{Int64,2},))) catch missing end
        if !ismissing(fbody)
            precompile(fbody, (Int64,Bool,typeof(sortperm),Array{Int64,2},))
        end
    end
end