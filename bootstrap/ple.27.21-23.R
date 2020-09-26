#' Data from ple.27.21-23
#'
#' @name ple.27.21-23
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
source(taf.boot.path("..", "utilities_bootstrap.R"))

data <- get_soa_fs("ple.27.21-23_WGBFAS_2020_v5")

write.taf(data)
