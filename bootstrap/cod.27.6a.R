#' Data from cod.27.6a
#'
#' @name cod.27.6a
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
source(taf.boot.path("..", "utilities_bootstrap.R"))

data <- get_soa_fs("cod6a_WGCSE2020_final")

write.taf(data)