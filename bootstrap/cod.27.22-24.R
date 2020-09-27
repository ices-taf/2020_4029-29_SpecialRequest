#' Data from cod.27.22-24
#'
#' @name cod.27.22-24
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
library(glue)
source(taf.boot.path("..", "utilities_bootstrap.R"))

run <- "WBcod_2020_split"
run <- "WBcod_2020_split_an006"

# fit <- fitfromweb(run)
# stockassessment::ssbplot(fit)

data <- get_soa_fs(run)

data

write.taf(data)

cat(
  "NOTE:",
  glue("* check with Marie that the final assessment is: {run}"),
  "* it was not clear if the SOA fit matched with the report.",
  file = "README.md",
  sep = "\n"
)
