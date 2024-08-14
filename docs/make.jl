using UnpackSinTiles
using Documenter

DocMeta.setdocmeta!(UnpackSinTiles, :DocTestSetup, :(using UnpackSinTiles); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers

makedocs(;
  modules = [UnpackSinTiles],
  authors = "Lazaro Alonso <lazarus.alon@gmail.com> and contributors",
  repo = "https://github.com/lazarusA/UnpackSinTiles.jl/blob/{commit}{path}#{line}",
  sitename = "UnpackSinTiles.jl",
  format = Documenter.HTML(; canonical = "https://lazarusA.github.io/UnpackSinTiles.jl"),
  pages = [
    "index.md"
    [
      file for
      file in readdir(joinpath(@__DIR__, "src")) if file != "index.md" && splitext(file)[2] == ".md"
    ]
  ],
)

deploydocs(; repo = "github.com/lazarusA/UnpackSinTiles.jl")
