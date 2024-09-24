using YAXArrays
using UnpackSinTiles

root_path = "/Net/Groups/BGI/data/DataStructureMDI/DATA/Incoming/MODIS/MCD12Q1.061/orgdata/"
lc_type_years = readdir(root_path)

hv_tile = "h18v03"
# hv_tile = "h31v10"
# hv_tile = "h21v09"

in_date = "2001.01.01"

new_m = getTileMetadata(hv_tile, in_date, root_path)
o_tile = openTile(hv_tile, in_date, root_path)

o_t_keys = getTileKeys(o_tile)

lc_type1 = loadTileVariable(hv_tile, in_date, root_path, "LC_Type5")

Int.(lc_type1)

let 
    using CairoMakie
    #fig = hist(vec(Int.(lc_type1)), bins=255)
    fig = Figure(figure_padding=(0); size = (2500, 2500))
    ax = Axis(fig[1,1])
    hidedecorations!(ax)
    hidespines!(ax)
    heatmap!(ax, Int.(lc_type1)'[:, end:-1:1];
        colormap=Categorical(cgrad(:ground_cover, 12, categorical=true)[2:end]), # tol_land_cover
        colorrange = (1,11), highclip=:black,
        lowclip= :grey13
        # lowclip= (:steelblue, 1)
        )
    save("lc.png", fig)
end
