# Run the examples
using MatLang
examplePath = joinpath( dirname(dirname(@__DIR__)), "examples")
include(joinpath(examplePath, "Language_Fundamentals", "usage_Entering_Commands.jl"))
include(joinpath(examplePath, "Language_Fundamentals", "usage_Matrices_and_Arrays.jl"))
include(joinpath(examplePath, "Language_Fundamentals", "Data_Types", "usage_Numeric_Types.jl"))
