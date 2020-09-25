#' List of stocks of interest
#'
#' List of stock and stock codes, by area with information on
#' the contact person
#'
#' @name stock_info
#' @format csv file
#' @tafOriginator ICES
#' @tafYear 2020
#' @tafAccess Restricted
#' @tafSource script

taf.library(icesSharePoint)

spgetfile(
  "Documents/Preliminary documents/bootstrap_initial_data/stock_info.csv",
  "/admin/Requests",
  "https://community.ices.dk",
  destdir = "."
)
