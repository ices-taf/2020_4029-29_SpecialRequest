#' Data from whg.27.7b-ce-k
#'
#' @name whg.27.7b-ce-k
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
source(taf.boot.path("..", "utilities_bootstrap.R"))

data <- get_soa_fs("whg.7b-ce-k_FRA_Sept20")
data$stock_code <- "whg.27.7b-ce-k"
data$assessment_year <- 2020
write.taf(data)

cat(
  "NOTE:",
  "* check with Dave that the final assessment is: whg.7b-ce-k_FRA_Sept20",
  file = "README.md",
  sep = "\n"
)
