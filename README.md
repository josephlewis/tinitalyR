tinitalyR - version 0.1.0
=============================

The R library <b>tinitalyR</b> provides the functionality to retrieve and download the Italian 10m Digital Elevation Model from https://doi.org/10.13127/TINITALY/1.0

CRS argument: +proj=utm +zone=32 +datum=WGS84 +units=m +no_defs

Getting Started
---------------

Installation
--------

    #install.packages("devtools")
    library(devtools)
    install_github("josephlewis/tinitalyR")
    library(tinitalyR)

Usage
--------

#### Retrieving DEM tile names

    library(tinitalyR)
    
    # sp object coordinate system expected to be "+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs"
    
    sp <- sp::SpatialPoints(cbind(1038553, 4302213))
    
    tile_names <- get_tiles(x = sp)
    
#### Download DEM tiles using tile names

    dem <- download_dem(x = tile_names)
    
#### Italian DEM tile map

    ita_tile_map <- ita
    
    CRS arguments: +proj=utm +zone=32 +datum=WGS84 +units=m +no_defs

Versioning
----------

-   version 0.1.0
      * First release to Github
      * Added get_tiles to retrieve tile name(s) based on supplied sp object
      * Added download_tiles to download DEM tiles based on supplied tile names

Authors
-------

-   Joseph Lewis - *author / creator* - [Website](https://josephlewis.github.io)

Citation
--------

Please cite as:

    Lewis, J. (2020) tinitalyR: Download 10m Digital Elevation Model data for Italy (tinitaly). R package version 0.1.0
