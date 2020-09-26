#' Data from ple.27.7a
#'
#' @name ple.27.7a
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
taf.library(icesSharePoint)

spgetfile(
  "2020 Meeting Docs/06. Data/PLE 7A/ple7a.zip",
  "/ExpertGroups/WGCSE",
  "https://community.ices.dk",
  destdir = "."
)

unzip("ple7a.zip", exdir = "temp")
unlink("ple7a.zip")

(load("temp/sam/assessment/b9model.RData"))
unlink("temp", recursive = TRUE)

# read lowestoft file
fdata <- faytable(fit_b9)
years <- scan(fname, sep = "\t", nlines = 1, skip = 2, quiet = TRUE)
years <- years[1]:years[2]
ages <- scan(fname, sep = "\t", nlines = 1, skip = 3, quiet = TRUE)
ages <- ages[1]:ages[2]

data <-
  data.frame(
    year = rep(years, length(ages)),
    age = rep(ages, each = length(years)),
    harvest = fdata
  )

write.taf(data)

# clean up
unlink(taf.data.path("whg.27.7a", "Assessment"), recursive = TRUE)
