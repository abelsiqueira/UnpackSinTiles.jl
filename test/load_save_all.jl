using UnpackSinTiles
using JLD2
using DelimitedFiles
using About
using ProgressMeter

indx = parse(Int, ARGS[1]) # it should be different and come from a job-array sbatch script.
# indx=1
root_path = "/Net/Groups/BGI/data/DataStructureMDI/DATA/Incoming/MODIS/MCD64A1.061/MCD64A1.061/"
path_to_events = "/Net/Groups/BGI/tscratch/lalonso/MODIS_FIRE_EVENTS/MODIS_MCD64A1_FIRE_EVENTS_2001_2023.jld2"

hvs = readdlm(joinpath(@__DIR__, "all_tiles.txt"))[:,1]
# `indx` should be different and come from a job-array sbatch script.
hv_tile = hvs[indx]
in_date = "2001.01.01"
new_m = getTileMetadata(hv_tile, in_date, root_path)
m_keys = ["XDim", "YDim", "UpperLeftPointMtrs", "LowerRightMtrs",
    "Projection", "ProjParams", "SphereCode", "GridOrigin"]
# selected_m = filter(pair -> first(pair) in m_keys, new_m)

fire_events = burnTimeSpan(2001, 2023, hv_tile, root_path; variable = "Burn Date"); # ? ~ 204MB
# about(fire_events)

jldopen(path_to_events, "a+") do file
    my_hv_tile = JLD2.Group(file, hv_tile)
    my_hv_tile["fire_events"] = fire_events
    for k in m_keys
        my_hv_tile[k] = new_m[k]
    end
end

# file_event = jldopen(path_to_events, "r")
# close(file_event)