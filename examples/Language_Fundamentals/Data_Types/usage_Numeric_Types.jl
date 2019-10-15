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
nFloat64 = doubleM(12.0)
t1 = typeof(nFloat64) # Float64

nFloat32 = singleM(12.0)
t2 = typeof(nFloat32) # Float32

nInt8 = int8M(-10)
t3 = typeof(nInt8) # Int8

nInt16 = int16M(-10)
t4 = typeof(nInt16) # Int16

nInt32 = int32M(-10)
t5 = typeof(nInt32) # Int32

nInt64 = int64M(-10)
t6 = typeof(nInt64) # Int64

nUInt8 = uint8M(10)
t7 = typeof(nUInt8) # UInt8

nUInt16 = uint16M(10)
t8 = typeof(nUInt16) # UInt16

nUInt32 = uint32M(10)
t9 = typeof(nUInt32) # UInt32

nUInt64 = uint64M(10)
t10 = typeof(nUInt64) # UInt64
################################################################
