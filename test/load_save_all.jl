using UnpackSinTiles
using JLD2
using DelimitedFiles
using About
using ProgressMeter

indx = 1 # it should be different and come from a job-array sbatch script.

root_path = "/Net/Groups/BGI/data/DataStructureMDI/DATA/Incoming/MODIS/MCD64A1.061/MCD64A1.061/"
tile = "h13v10"
in_date = "2001.01.01"
# selected_m = filter(pair -> first(pair) in m_keys, m)
m_keys = ["XDim", "YDim", "UpperLeftPointMtrs", "LowerRightMtrs",
    "Projection", "ProjParams", "SphereCode", "GridOrigin"]

path_to_events = "/Net/Groups/BGI/tscratch/lalonso/MODIS_MCD64A1_FIRE_EVENTS.jld2"
hvs = readdlm(joinpath(@__DIR__, "all_tiles.txt"))[:,1]
# `indx` should be different and come from a job-array sbatch script.
hv_tile = hvs[indx]

new_m = getTileMetadata(hv_tile, in_date, root_path)
fire_events = burnTimeSpan(2001, 2023, tile, root_path; variable = "Burn Date") # ? ~ 204MB
# about(fire_events)
jldopen(path_to_events, "a+") do file
    my_hv_tile = JLD2.Group(file, hv_tile)
    my_hv_tile["fire_events"] = fire_events
    for k in m_keys
        my_hv_tile[k] = new_m[k]
    end
end

file_event = jldopen(path_to_events, "r")
close(file_event)

# jldopen(path_events, "w") do file
#     @showprogress for hv_tile in hvs
#         new_m = getTileMetadata(hv_tile, in_date, root_path)
#         my_hv_tile = JLD2.Group(file, hv_tile)
#         # my_hv_tile["data"] = test_y
#         for k in m_keys
#             my_hv_tile[k] = new_m[k]
#         end
#     end
# end

# file_event = jldopen(path_events, "r")
# file_event
# close(file_event)