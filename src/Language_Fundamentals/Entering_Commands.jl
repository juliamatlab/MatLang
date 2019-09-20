
################################################################
################################################################
# Entering_Commands
################################################################
################################################################
# # Copy of Julia Functions/Types
natives = [] # input symbols
for n in natives
    @eval begin
        const $(Symbol(n, "M")) = $n
        export $(Symbol(n, "M"))
    end
end

# ansM can't be defined. use ans instead.

"""
    clcM()

Clear Command Window for Juno or Atom IDE
"""
function clcM()

    if !isdefined(Main, :Juno)
        println("\33[2J")
    end

end
