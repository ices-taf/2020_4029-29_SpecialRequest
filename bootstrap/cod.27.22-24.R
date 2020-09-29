#' Data from cod.27.22-24
#'
#' @name cod.27.22-24
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
taf.library(icesSharePoint)

spgetfile(
  "Documents/Preliminary documents/bootstrap_initial_data/cod.27.22-24/f-at-age.csv",
  "/admin/Requests",
  "https://community.ices.dk",
  destdir = "."
)

# read lowestoft file
fdata <- read.taf("f-at-age.csv")
years <- fdata$Year
ages <- as.numeric(colnames(fdata)[-1])

data <-
  data.frame(
    year = rep(years, length(ages)),
    age = rep(ages, each = length(years)),
    harvest = unname(unlist(fdata[, -1]))
  )
data$stock_code <- "cod.27.22-24"
data$assessment_year <- 2020
write.taf(data)

# clean up
unlink("f-at-age.csv")
