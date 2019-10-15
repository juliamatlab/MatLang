module MatLang

export clcM
include("Language_Fundamentals/Entering_Commands.jl")

using LinearAlgebra

export zerosM, onesM, randM, trueM, falseM, eyeM, diagM, blkdiagM, catM, horzcatM, vertcatM, repelemM, repmatM, linspaceM, logspaceM, meshgridM, ndgridM, freqspaceM, lengthM, sizeM, ndimsM, numelM, isscalarM, isvectorM, ismatrixM, isrowM, iscolumnM, sortM, flipM, fliplrM, flipudM, flipdimM, rot90M, transposeM, squeezeM
include("Language_Fundamentals/Matrices_and_Arrays.jl")

include("Language_Fundamentals/Data_Types/Numeric_Types.jl")
################################################################
# Conditional REQUIRE - https://github.com/MikeInnes/Requires.jl
using Requires
function __init__()
    # clcM() in Juno
    @require Juno = "e5e0dc1b-0480-54bc-9374-aad01c23163d" begin
        function clcM()
            println("\33[2J")
            Juno.clearconsole()
        end
    end
end
################################################################

end # module
