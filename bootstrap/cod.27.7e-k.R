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

data <- get_soa_fs("Cod7ek_Finale")
data$stock_code <- "cod.27.7e-k"
write.taf(data)

cat(
  "NOTE:",
  "* check with Marianne that the final assessment is: Cod7ek_Finale",
  file = "README.md",
  sep = "\n"
)
