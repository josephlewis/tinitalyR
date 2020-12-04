#' @title Download tinitaly DEMs using supplied tile names
#'
#' @param x character vector of DEM tiles names
#'
#' @return RasterLayer if merge is TRUE (default) else list of Rasterlayers
#'
#' @import rgdal
#' @import raster
#'
#' @export
#'
#'@examples
#'
#' tiles <- c('w42510_s10', 'w43010_s10')
#'
#' dem <- download_dem(x = tiles)
#'
#'@references
#' Tarquini S., Isola I., Favalli M., Battistini A. (2007) TINITALY, a digital elevation model of Italy with a 10 m-cell size (Version 1.0) [Data set]. Istituto Nazionale di Geofisica e Vulcanologia (INGV). \url{https://doi.org/10.13127/TINITALY/1.0}

download_dem <- function(x) {

    tile_list <- ita$TILE_NAME

    if (!all(sapply(X = x, FUN = function(i) {
        i %in% tile_list
    }))) {
        stop("One or more tile names is invalid. Use get_tiles() to retrieve vector of valid tile names")
    }

    url <- "http://tinitaly.pi.ingv.it/data/"

    ita_dem <- lapply(X = x, FUN = function(i) {
        temp <- tempfile()
        tempd <- tempdir()

        utils::download.file(url = paste0(url, i, "/", i, ".zip"), method = "auto", quiet = FALSE, destfile = temp)

        utils::unzip(temp, exdir = tempd)
        dem_raster <- raster::raster(file.path(tempd, paste0("/", i, "/", i, ".tif")))
        unlink(tempd)
        return(dem_raster)
    })

    if (length(x) == 1) {
        ita_dem <- ita_dem[[1]]
    }

    return(ita_dem)
}
