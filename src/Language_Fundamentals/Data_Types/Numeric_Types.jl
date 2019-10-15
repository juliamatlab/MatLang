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
    jul = julias[n]
    exportFun=Symbol(matFun, "M")

    if occursin("Float",String(jul))
        exampleInput = 12.0
    elseif occursin("UInt",String(jul))
        exampleInput = 10
    elseif occursin("Int",String(jul))
        exampleInput = -10
    end

    @eval begin

        # init
        function $(exportFun) end

        # doc
        @doc """

            $($exportFun)(x)

        Converts to $($jul) type.
        # Examples
        ```julia
        n$($jul) = $($exportFun)($($exampleInput))
        t$($n) = typeof(n$($jul)) # $($jul)
        ```
        """ $(exportFun)

        $(exportFun)(args...) = $(jul)(args...) # real definition

        # exporting
        export $(exportFun)
    end
end
################################################################
