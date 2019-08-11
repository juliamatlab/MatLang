module MatLang
using Requires

export clcM
################################################################
"""
    clcM

Clear Command Window for Juno or Atom IDE
"""
function clcM()
#    Juno.clearconsole();
end
################################################################


################################################################
# Conditional REQUIRE - https://github.com/MikeInnes/Requires.jl
function __init__()
    @require Juno="e5e0dc1b-0480-54bc-9374-aad01c23163d" clcM() = Juno.clearconsole();
end

end # module
