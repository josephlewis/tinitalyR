tinitalyR - version 0.1.0
=============================

The R library <b>tinitalyR</b> provides the functionality to retrieve and download the Italy 10m Digital Elevation Model data from \url{https://doi.org/10.13127/TINITALY/1.0.?\200\235}. 

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

    library(leastcostpath)
    
    sp <- sp::SpatialPoints(cbind(1038553, 4302213))
    
    tile_names <- get_tiles(x = sp)
    
#### Download DEM tiles using tile names

    dem <- download_dem(x = tile_names)
    

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

    Lewis, J. (2020) leastcostpath: Modelling Pathways and Movement Potential Within a Landscape (version 1.7.8). 
    Available at: https://cran.r-project.org/web/packages/leastcostpath/index.html
