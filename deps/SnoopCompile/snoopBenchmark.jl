# dev your package

# comment the precompile part of your package ("include() and _precompile_()")
# run this benchmark
# restart Julia

# uncomment the precompile part of your package ("include() and _precompile_()")
# run this benchmark
# restart Julia

# now compare the result
################################################################
using SnoopCompile

println("Package load time:")
loadSnoop = @snoopi using MatLang

println(timesum(loadSnoop))

################################################################
println("Running Examples/Tests:")
runSnoop = @snoopi begin

using MatLang

include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Matrices_and_Arrays.jl"))
# include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "usage_Entering_Commands.jl"))
include(joinpath(dirname(dirname(pathof(MatLang))), "examples","Language_Fundamentals", "Data_Types", "usage_Numeric_Types.jl"))

end

println(timesum(runSnoop))
