developing = false; # are you developing the package or just using?
if developing
	# ] add Revise # if you don't have it
    path = pwd()
    if path[end-6:end] != "MatLang"
        error("cd(to the MatLang path)")
    end
    push!(LOAD_PATH, ".")
    using Revise
    using MatLang
else
    using MatLang
end
################################################################
################################################################

################################################################
clcM() # clears console
################################################################
