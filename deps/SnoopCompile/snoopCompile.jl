# Input:
const package = :MatLang

################################################################
const packageName = string(package)
const packagePath = joinpath(pwd(),"src","$packageName.jl")
################################################################
using SnoopCompile
################################################################
const rootPath = pwd()
precompileDeactivator(packagePath, precompilePath(packageName));
cd(@__DIR__)
################################################################

### Log the compiles
data = @snoopi begin

    using MatLang, Pkg

    # Use runtests.jl
    # include(joinpath(dirname(dirname(pathof(MatLang))), "test","runtests.jl"))

    # Ues examples
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Matrices_and_Arrays.jl"))
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Entering_Commands.jl"))
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "Data_Types", "usage_Numeric_Types.jl"))
end

################################################################
### Parse the compiles and generate precompilation scripts
pc = SnoopCompile.parcel(data)
onlypackage = Dict(package => sort(pc[package]))
SnoopCompile.write("$(pwd())/precompile",onlypackage)
################################################################
cd(rootPath)
precompileActivator(packagePath, precompilePath(packageName))
