#' Download files provided by STECF
#'
#' @name stecf
#' @format csv files
#' @tafOriginator STECF
#' @tafYear 2020
#' @tafAccess Restricted
#' @tafSource script

library(icesTAF)
taf.library(icesSharePoint)

site <- "/admin/Requests"
site_collection <- "https://community.ices.dk"
dir <- "Documents/Preliminary documents/bootstrap_initial_data/stecf"

files <-
  spfiles(
    dir,
    site = site, site_collection = site_collection,
    full = TRUE
  )

for (file in files) {
  spgetfile(
    file = file,
    site = site,
    site_collection = site_collection,
    destdir = "."
  )
}
