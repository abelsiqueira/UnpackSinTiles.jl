
# maybe start first with a complete empty zarr store and then modify in-place instead of creating YAXArrays on the fly

function appendTile(tile, agg_μBurn, xdim, ydim, tdim, zarrPath)
    axlist = (
        Dim{:x}(xdim),
        Dim{:y}(ydim),
        Dim{:time}(tdim),
    )
    yax = YAXArray(axlist, agg_μBurn)
    ds = YAXArrays.Dataset(; (Symbol(tile) => yax,)...)
    # append to file
    savedataset(ds, path=zarrPath, driver=:zarr, append=true)
end