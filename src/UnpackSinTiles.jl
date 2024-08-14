module UnpackSinTiles
    using PythonCall
    using YAXArrays
    using Zarr
    using Statistics
    using PythonCall

    hdf(f) = @pyconst(pyimport("pyhdf.SD").SD)(f)
    export hdf

    include("loadTile.jl")

    export openTile, loadTileVariable
    export getTileKeys, getTilePath
end

