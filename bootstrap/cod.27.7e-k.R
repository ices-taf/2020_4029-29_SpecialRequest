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

cat(
  "NOTE:
* Due to an ongoing benchmark for this stock, advice release was postponed for 2020. Advice is being drafted and is due to be published on the October 30th, so F-at-age is not final, and will be updated int he DB when approved.
",
  file = "README.md"
)