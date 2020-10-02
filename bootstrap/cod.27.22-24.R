#' Data from cod.27.22-24
#'
#' @name cod.27.22-24
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
source(taf.boot.path("..", "utilities_bootstrap.R"))

data <- get_soa_fs("WBcod_2020_split")
data$stock_code <- "cod.27.22-24"
data$assessment_year <- 2020

data <- filter(data, age %in% 1:7)

write.taf(data)
