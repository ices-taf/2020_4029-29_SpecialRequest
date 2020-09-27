#' Download files provided by STECF
#'
#' @name stecf
#' @format csv files
#' @tafOriginator STECF
#' @tafYear 2020
#' @tafAccess Restricted
#' @tafSource script

library(icesTAF)
taf.library(icesSharePoint)

site <- "/admin/Requests"
site_collection <- "https://community.ices.dk"
dir <- "Documents/Preliminary documents/bootstrap_initial_data/stecf"

files <-
  spfiles(
    dir,
    site = site, site_collection = site_collection,
    full = TRUE
  )

for (file in files) {
  spgetfile(
    file = file,
    site = site,
    site_collection = site_collection,
    destdir = "."
  )
}

# read files
data <- do.call(rbind, lapply(basename(files), read.csv))
lapply(basename(files), unlink)

fdata <- data[c("Stock", "YEAR", "AGE", "HARVEST")]
names(fdata) <- tolower(names(fdata))

# stecf to ices codes
stecf_codes <-
  c(
    "hke.gsa.1_5_6_7" = "HKE1567",
    "hke.gsa.9_10_11" = "HKE91011",
    "hke.gsa.17_18" = "HKE1718SS3", # not "HKE1718a4a",
    "mur.gsa.5" = "MUR5",
    "mut.gsa.1" = "MUT1",
    "mut.gsa.6" = "MUT6",
    "mut.gsa.7" = "MUT7",
    "mut.gsa.9" = "MUT9",
    "mut.gsa.10" = "MUT10",
    "mut.gsa.17_18" = "MUT1718"
  )

data <-
  do.call(
    rbind,
    lapply(
      seq_along(stecf_codes),
      function(i) {
        cbind.data.frame(
          stock_code = names(stecf_codes)[i],
          fdata[fdata$stock == stecf_codes[i], c("year", "age", "harvest")]
        )
      }
    )
  )

write.taf(data)
