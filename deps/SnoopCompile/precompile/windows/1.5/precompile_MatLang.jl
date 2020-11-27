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
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.freqspaceM)),NamedTuple{(:dim,),Tuple{Int64}},typeof(freqspaceM),Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.ndgridM)),NamedTuple{(:dim,),Tuple{Int64}},typeof(ndgridM),StepRange{Int64,Int64}})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.randM)),NamedTuple{(:like,),Tuple{Array{Int64,2}}},typeof(randM),Int64})
    Base.precompile(Tuple{Core.kwftype(typeof(MatLang.sortperm)),NamedTuple{(:dims,),Tuple{Int64}},typeof(sortperm),Array{Int64,2}})
    Base.precompile(Tuple{typeof(blkdiagM),Array{Float64,2},Array{Float64,2},Vararg{Array{Float64,2},N} where N})
    Base.precompile(Tuple{typeof(catM),Int64,Array{Float64,2},Vararg{Array{Float64,2},N} where N})
    Base.precompile(Tuple{typeof(catM),Int64,Array{Float64,3},Vararg{Array{Float64,3},N} where N})
    Base.precompile(Tuple{typeof(diagM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(eyeM),Int64})
    Base.precompile(Tuple{typeof(falseM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(flipM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(flipM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(logspaceM),Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(logspaceM),Int64,Int64,Symbol})
    Base.precompile(Tuple{typeof(logspaceM),Int64,Int64})
    Base.precompile(Tuple{typeof(meshgridM),StepRange{Int64,Int64}})
    Base.precompile(Tuple{typeof(meshgridM),UnitRange{Int64},UnitRange{Int64},UnitRange{Int64}})
    Base.precompile(Tuple{typeof(ndgridM),UnitRange{Int64},UnitRange{Int64},UnitRange{Int64}})
    Base.precompile(Tuple{typeof(randM),Symbol,Int64})
    Base.precompile(Tuple{typeof(randM),Type{T} where T,Int64,Int64})
    Base.precompile(Tuple{typeof(repelemM),Array{Int64,2},Int64})
    Base.precompile(Tuple{typeof(repmatM),Array{Int64,1},Array{Int64,1}})
    Base.precompile(Tuple{typeof(repmatM),Int64,Int64,Int64})
    Base.precompile(Tuple{typeof(sizeM),Symbol,Array{Float64,3},Int64,Int64})
    Base.precompile(Tuple{typeof(sortM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(sortM),Array{Int64,2}})
    Base.precompile(Tuple{typeof(sortM),Array{Integer,3},Int64})
    Base.precompile(Tuple{typeof(squeezeM),Array{Float64,3}})
    Base.precompile(Tuple{typeof(trueM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(zerosM),Array{Int64,1}})
    Base.precompile(Tuple{typeof(zerosM),Type{Int32},Array{Int64,1}})
    let fbody = try __lookup_kwbody__(which(sortperm, (Array{Int64,2},))) catch missing end
        if !ismissing(fbody)
            precompile(fbody, (Int64,Bool,typeof(sortperm),Array{Int64,2},))
        end
    end
end
