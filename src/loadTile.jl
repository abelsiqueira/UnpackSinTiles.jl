"""
    getTilePath(tile, in_date, root_path)

Helper function for getting the full path in a nested structure of hdf files.
"""
function getTilePath(tile, in_date, root_path)
    path_month = joinpath(root_path, in_date)
    list_files = readdir(path_month)
    # find name file for the given tile
    index = findfirst(x -> occursin(tile, x), list_files)
    if length(index)>0 # it should be only 1
        tile_full_name = list_files[index]
        full_path = joinpath(path_month, tile_full_name)
        return full_path
    else
        @info "Tile: $(tile) not found in directory."
        return nothing
    end
end

"""
    openTile(tile, in_date, root_path)
"""
function openTile(tile, in_date, root_path)
    full_path = getTilePath(tile, in_date, root_path)
    return hdf(full_path)
end

"""
    openTile(tile, in_date, root_path)
"""
function getTileKeys(o)
    pyKeys = o.datasets().keys()
    return ["$k" for k in pyKeys]
end


"""
    loadTileVariable(tile, in_date, root_path, variable; close_file = true)
"""
function loadTileVariable(tile, in_date, root_path, variable; close_file = true)
    hdf_tile = openTile(tile, in_date, root_path)
    hdf_data = hdf_tile.select(variable).get()
    if close_file
        hdf_tile.end() # close hdf tile
    end
    return hdf_data
end