should_precompile = true


# Don't edit the following! Instead change the script for `snoop_bot`.
ismultios = true
ismultiversion = true
# precompile_enclosure
@static if !should_precompile
    # nothing
elseif !ismultios && !ismultiversion
    include("../deps/SnoopCompile/precompile/precompile_MatLang.jl")
    _precompile_()
else
    @static if Sys.islinux()
        @static if v"1.0.0-DEV" <= VERSION <= v"1.0.9"
            include("../deps/SnoopCompile/precompile/linux/1.0/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.2.0-DEV" <= VERSION <= v"1.2.9"
            include("../deps/SnoopCompile/precompile/linux/1.2/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.3.0-DEV" <= VERSION <= v"1.3.9"
            include("../deps/SnoopCompile/precompile/linux/1.3/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.4.0-DEV" <= VERSION <= v"1.4.9"
            include("../deps/SnoopCompile/precompile/linux/1.4/precompile_MatLang.jl")
            _precompile_()
        else
        end

    elseif Sys.iswindows()
        @static if v"1.0.0-DEV" <= VERSION <= v"1.0.9"
            include("../deps/SnoopCompile/precompile/windows/1.0/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.2.0-DEV" <= VERSION <= v"1.2.9"
            include("../deps/SnoopCompile/precompile/windows/1.2/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.3.0-DEV" <= VERSION <= v"1.3.9"
            include("../deps/SnoopCompile/precompile/windows/1.3/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.4.0-DEV" <= VERSION <= v"1.4.9"
            include("../deps/SnoopCompile/precompile/windows/1.4/precompile_MatLang.jl")
            _precompile_()
        else
        end

    elseif Sys.isapple()
        @static if v"1.0.0-DEV" <= VERSION <= v"1.0.9"
            include("../deps/SnoopCompile/precompile/apple/1.0/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.2.0-DEV" <= VERSION <= v"1.2.9"
            include("../deps/SnoopCompile/precompile/apple/1.2/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.3.0-DEV" <= VERSION <= v"1.3.9"
            include("../deps/SnoopCompile/precompile/apple/1.3/precompile_MatLang.jl")
            _precompile_()
        elseif v"1.4.0-DEV" <= VERSION <= v"1.4.9"
            include("../deps/SnoopCompile/precompile/apple/1.4/precompile_MatLang.jl")
            _precompile_()
        else
        end

    else
    end

end # precompile_enclosure
