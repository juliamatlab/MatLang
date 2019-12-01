using SnoopCompile

cd(@__DIR__)
################################################################

### Log the compiles
# This only needs to be run once (to generate log file)

SnoopCompile.@snoopc "$(pwd())/Snoop.log" begin

    # Use runtests.jl or your exmaples that uses package:

    using MatLang, Pkg

    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Matrices_and_Arrays.jl"))
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Entering_Commands.jl"))
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "Data_Types", "usage_Numeric_Types.jl"))
end

################################################################

### Parse the compiles and generate precompilation scripts
# This can be run repeatedly to tweak the scripts

data = SnoopCompile.read("$(pwd())/Snoop.log")

pc = SnoopCompile.parcel(reverse!(data[2]))
SnoopCompile.write("$(pwd())/precompile", pc)
