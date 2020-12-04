#' Download tinitaly DEMs using supplied tile names
#'
#' @param x character vector of DEM tiles names
#'
#' @param merge if TRUE then DEMs are merged into one RasterLayer using raster::merge. If FALSE (default) then DEMs not merged and returned as list
#'
#' @return RasterLayer if merge is TRUE (default) else list of Rasterlayers
#'
#' @import raster
#'
#' @export
#'
#'@examples
#'
#' tile <- "w50055_s10"
#'
#' dem <- download_dem(x = tile, merge = FALSE)
#'
#'@references
#' Tarquini S., Isola I., Favalli M., Battistini A. (2007) TINITALY, a digital elevation model of Italy with a 10 m-cell size (Version 1.0) [Data set]. Istituto Nazionale di Geofisica e Vulcanologia (INGV). \url{https://doi.org/10.13127/TINITALY/1.0.”}

download_dem <- function(x, merge = FALSE) {

  tile_list <- ita$TILE_NAME

  if (!x %in% tile_list) {
    stop("One or more tiles is invalid. Use get_tiles() to retrieve vector of acceptable tiles")
  }

  url <- "http://tinitaly.pi.ingv.it/data/"

  dem <- lapply(X = x, FUN = function(x) { utils::download.file(url = paste0(url, x, "/", x, ".zip"), method = "auto", quiet = FALSE, destfile = tempfile())})

  if (merge) {
    if (length(dem) > 1) {
      dem <- do.call(dem, raster::merge)
    }
    else {
      dem <- dem
    }
  }

  return(dem)
  }
