#' Data from had.27.7b-k
#'
#' @name had.27.7b-k
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
source(taf.boot.path("..", "utilities_bootstrap.R"))

data <- get_soa_fs("HAD7bk_2020_Assessment")
data$stock_code <- "had.27.7b-k"
data$assessment_year <- 2020
write.taf(data)
