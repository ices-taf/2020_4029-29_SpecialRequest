#' Data from cod.27.7e-k
#'
#' @name cod.27.7e-k
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
source(taf.boot.path("..", "utilities_bootstrap.R"))

data <- get_soa_fs("Cod_7ek_WGCSE2020")
data$stock_code <- "cod.27.7e-k"
data$assessment_year <- 2020
write.taf(data)
