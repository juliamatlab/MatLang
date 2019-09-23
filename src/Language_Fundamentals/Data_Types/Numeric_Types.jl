################################################################
################################################################
# Numeric_Types
################################################################
################################################################
# # Copy of Julia Functions/Types

################################################################
matlabs = [:double, :single, :int8, :int16, :int32, :int64, :uint8, :uint16, :uint32, :uint64]
julias = [:Float64, :Float32, :Int8, :Int16, :Int32, :Int64, :UInt8, :UInt16, :UInt32, :UInt64]
for n = 1:length(matlabs)
    matFun = matlabs[n]
    julFun = julias[n]
    @eval begin
        # $(Symbol(matFun, "M")) = $julFun
        export $(Symbol(matFun, "M"))
    end
end
################################################################
"""
    doubleM(x)

Converts to Float64 type.
# Examples
```julia
nFloat1 = doubleM(12.0)
t1 = typeof(nFloat1) # Float64
```
"""
function doubleM(x) return Float64(x) end
################################################################
"""
    singleM(x)

Converts to Float32 type.
# Examples
```julia
nFloat2 = singleM(12.0)
t2 = typeof(nFloat2) # Float32
```
"""
function singleM(x) return Float32(x) end
################################################################
"""
    int8M(x)

Converts to Int8 type.
# Examples
```julia
nInt1 = int8M(-10)
t3 = typeof(nInt1) # Int8
```
"""
function int8M(x) return Int8(x) end
################################################################
"""
    int16M(x)

Converts to Int16 type.
# Examples
```julia
nInt2 = int16M(-10)
t4 = typeof(nInt2) # Int16
```
"""
function int16M(x) return Int16(x) end
################################################################
"""
    int32M(x)

Converts to Int32 type.
# Examples
```julia
nInt3 = int32M(-10)
t5 = typeof(nInt3) # Int32
```
"""
function int32M(x) return Int32(x) end
################################################################
"""
    int64M(x)

Converts to Int64 type.
# Examples
```julia
nInt4 = int64M(-10)
t6 = typeof(nInt4) # Int64
```
"""
function int64M(x) return Int64(x) end
################################################################
"""
    uint8M(x)

Converts to UInt8 type.
# Examples
```julia
nUInt1 = uint8M(10)
t7 = typeof(nUInt1) # UInt8
```
"""
function uint8M(x) return UInt8(x) end
################################################################
"""
    uint16M(x)

Converts to UInt16 type.
# Examples
```julia
nUInt2 = uint16M(10)
t8 = typeof(nUInt2) # UInt16
```
"""
function uint16M(x) return UInt16(x) end
################################################################
"""
    uint32M(x)

Converts to UInt32 type.
# Examples
```julia
nUInt3 = uint32M(10)
t9 = typeof(nUInt3) # UInt32
```
"""
function uint32M(x) return UInt32(x) end
################################################################
"""
    uint64M(x)

Converts to UInt64 type.
# Examples
```julia
nUInt4 = uint64M(10)
t10 = typeof(nUInt4) # UInt64
```
"""
function uint64M(x) return UInt64(x) end
################################################################
