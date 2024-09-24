## Layers / Variables

- https://lpdaac.usgs.gov/documents/1409/MCD12_User_Guide_V61.pdf

    - See `LC_Type1` for vegetation types and `LC_Type5` for plant functional types. 
    - 

| SDS Name              | Description                                                                         | Units         | Data Type              | Fill Value | No Data Value | Valid Range | Scale Factor |
|-----------------------|-------------------------------------------------------------------------------------|---------------|------------------------|------------|---------------|-------------|--------------|
| LC_Type1              | Land Cover Type 1: Annual International Geosphere-Biosphere Programme (IGBP) classification | Class         | 8-bit unsigned integer | 255        | N/A           | 1 to 17     | N/A          |
| LC_Type2              | Land Cover Type 2: Annual University of Maryland (UMD) classification               | Class         | 8-bit unsigned integer | 255        | N/A           | 0 to 15     | N/A          |
| LC_Type3              | Land Cover Type 3: Annual Leaf Area Index (LAI) classification                      | Class         | 8-bit unsigned integer | 255        | N/A           | 0 to 10     | N/A          |
| LC_Type4              | Land Cover Type 4: Annual BIOME-Biogeochemical Cycles (BGC) classification          | Class         | 8-bit unsigned integer | 255        | N/A           | 0 to 8      | N/A          |
| LC_Type5              | Land Cover Type 5: Annual Plant Functional Types classification                     | Class         | 8-bit unsigned integer | 255        | N/A           | 0 to 11     | N/A          |
| LC_Prop1              | FAO-Land Cover Classification System 1 (LCCS1) land cover layer                     | Class         | 8-bit unsigned integer | 255        | N/A           | 1 to 43     | N/A          |
| LC_Prop2              | FAO-LCCS2 land use layer                                                            | Class         | 8-bit unsigned integer | 255        | N/A           | 1 to 40     | N/A          |
| LC_Prop3              | FAO-LCCS3 surface hydrology layer                                                   | Class         | 8-bit unsigned integer | 255        | N/A           | 1 to 51     | N/A          |
| LC_Prop1_Assessment   | LCCS1 land cover layer confidence                                                   | Percent       | 8-bit unsigned integer | 255        | N/A           | 0 to 100    | N/A          |
| LC_Prop2_Assessment   | LCCS2 land use layer confidence                                                     | Percent       | 8-bit unsigned integer | 255        | N/A           | 0 to 100    | N/A          |
| LC_Prop3_Assessment   | LCCS3 surface hydrology layer confidence                                            | Percent       | 8-bit unsigned integer | 255        | N/A           | 0 to 100    | N/A          |
| QC                    | Product quality flags                                                              | Quality Flag  | 8-bit unsigned integer | 255        | N/A           | 0 to 10     | N/A          |
| LW                    | Binary land (class 2) / water (class 1) mask derived from MOD44W                    | Class         | 8-bit unsigned integer | 255        | N/A           | 1 to 2      | N/A          |

### PFTs: `LC_Type5`

| Value | Plant Functional Type (PFT) Classification    |
|-------|-----------------------------------------------|
| 0     | Water                                         |
| 1     | Evergreen Needleleaf Trees                    |
| 2     | Evergreen Broadleaf Trees                     |
| 3     | Deciduous Needleleaf Trees                    |
| 4     | Deciduous Broadleaf Trees                     |
| 5     | Shrubs                                        |
| 6     | Grasslands                                    |
| 7     | Cereal Croplands                              |
| 8     | Broadleaf Croplands                           |
| 9     | Urban and Built-up Lands                      |
| 10    | Permanent Snow and Ice                        |
| 11    | Barren                                        |
| 255    | Unclassified                                 |

### IGBP Vegetation Types Classification: `LC_Type1`

> [!IMPORTANT]
> The user guide uses an scale for 0-16, zero being water. But the actual data goes from 1 to 17, where now 17 is water.
> See also https://www.ceom.ou.edu/static/docs/IGBP.pdf

| Value | Land Cover Classification            |
|-------|--------------------------------------|
| 1     | Evergreen Needleleaf Forests         |
| 2     | Evergreen Broadleaf Forests          |
| 3     | Deciduous Needleleaf Forests         |
| 4     | Deciduous Broadleaf Forests          |
| 5     | Mixed Forests                        |
| 6     | Closed Shrublands                    |
| 7     | Open Shrublands                      |
| 8     | Woody Savannas                       |
| 9     | Savannas                             |
| 10    | Grasslands                           |
| 11    | Permanent Wetlands                   |
| 12    | Croplands                            |
| 13    | Urban and Built-up Lands             |
| 14    | Cropland/Natural Vegetation Mosaics  |
| 15    | Permanent Snow and Ice               |
| 16    | Barren or Sparsely Vegetated         |
| 17    | Water                                |
| 255   | Unclassified (No Data)               |


> [!TIP]
> Non-vegetated areas: `LC_Type1`
> 17, 11, 13, 15, 16, 255