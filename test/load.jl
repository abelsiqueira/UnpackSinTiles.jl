using UnpackSinTiles
# testing funcitons!
tile = "h13v10"
in_date = "2001.01.01"
root_path = "/Net/Groups/BGI/data/DataStructureMDI/DATA/Incoming/MODIS/MCD64A1.061/MCD64A1.061/"
# tile path
tile_path = getTilePath(tile, in_date, root_path)

o = openTile(tile, in_date, root_path)
k_vars = getTileKeys(o)
o.end()