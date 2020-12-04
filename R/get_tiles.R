#' @title Retrieve tinitaly DEM tile names that intersect with sp object
#'
#' @param x sp object as defined in package sp
#'
#' @return character vector of tinitaly tile names that intersect with supplied sp object
#'
#' @importFrom rgeos gIntersects
#'
#' @export
#'
#'@examples
#'
#' sp <- sp::SpatialPoints(cbind(1038553, 4302213))
#'
#' tiles <- get_tiles(x = sp)
#'
#' @references
#' Tarquini S., Isola I., Favalli M., Battistini A. (2007) TINITALY, a digital elevation model of Italy with a 10 m-cell size (Version 1.0) [Data set]. Istituto Nazionale di Geofisica e Vulcanologia (INGV). \url{https://doi.org/10.13127/TINITALY/1.0.?\200\235}
#'

get_tiles <- function(x) {
    
    ita_tiles <- ita
    
    tiles_subset <- rgeos::gIntersects(spgeom1 = ita_tiles, spgeom2 = x, byid = TRUE)
    
    tiles <- ita_tiles[as.vector(tiles_subset), ]
    
    tiles_names <- tiles$TILE_NAME
    
    return(tiles_names)
    
}
