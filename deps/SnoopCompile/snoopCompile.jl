const package = :MatLang
################################################################
const packageName = string(package)
const filePath = joinpath(pwd(),"src","$packageName.jl")

function precompileDeactivator(packageName, filePath)

    file = open(filePath,"r")
    packageText = read(file, String)
    close(file)

    available = occursin("include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")", packageText)  && occursin("_precompile_()", packageText)

    if available
        packageEdited = foldl(replace,
                     (
                      "include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")" => "#include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")",
                      "_precompile_()" => "#_precompile_()",
                     ),
                     init = packageText)
    else
        error(""" add the following codes into your package:
         include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")
         _precompile_()
         """)
    end

     file = open(filePath,"w")
     write(file, packageEdited)
     close(file)
end

function precompileActivator(packageName, filePath)

    file = open(filePath,"r")
    packageText = read(file, String)
    close(file)

    available = occursin("#include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")", packageText)  && occursin("#_precompile_()", packageText)
    if available
        packageEdited = foldl(replace,
                     (
                      "#include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")" => "include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")",
                      "#_precompile_()" => "_precompile_()",
                     ),
                     init = packageText)
    else
        error(""" add the following codes into your package:
         include(\"../deps/SnoopCompile/precompile/precompile_$packageName.jl\")
         _precompile_()
         """)
    end

     file = open(filePath,"w")
     write(file, packageEdited)
     close(file)
end

################################################################
const rootPath = pwd()
precompileDeactivator(packageName, filePath);
cd(@__DIR__)
################################################################
using SnoopCompile

### Log the compiles
data = @snoopi tmin=0.001 begin

    using MatLang, Pkg

    # Use runtests.jl
    include(joinpath(dirname(dirname(pathof(MatLang))), "test","runtests.jl"))

    # Ues examples
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Matrices_and_Arrays.jl"))
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Entering_Commands.jl"))
    include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "Data_Types", "usage_Numeric_Types.jl"))
end
################################################################
### Parse the compiles and generate precompilation scripts
pc = SnoopCompile.parcel(data)
onlypackage = Dict(package => pc[package])
SnoopCompile.write("$(pwd())/precompile",onlypackage)
################################################################
cd(rootPath)
precompileActivator(packageName, filePath)
