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
nFloat1 = doubleM(12.0)
t1 = typeof(nFloat1) # Float64

nFloat2 = singleM(12.0)
t2 = typeof(nFloat2) # Float32

nInt1 = int8M(-10)
t3 = typeof(nInt1) # Int8

nInt2 = int16M(-10)
t4 = typeof(nInt2) # Int16

nInt3 = int32M(-10)
t5 = typeof(nInt3) # Int32

nInt4 = int64M(-10)
t6 = typeof(nInt4) # Int64

nUInt1 = uint8M(10)
t7 = typeof(nUInt1) # UInt8

nUInt2 = uint16M(10)
t8 = typeof(nUInt2) # UInt16

nUInt3 = uint32M(10)
t9 = typeof(nUInt3) # UInt32

nUInt4 = uint64M(10)
t10 = typeof(nUInt4) # UInt64
################################################################
