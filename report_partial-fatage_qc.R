## Prepare plots and tables for report

## Before:
## After:

library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(data.table)

# ----
# partial fatage upload and download checks
# ----

# read in tables of partial F
fatage_partial.files <- dir("output", full.names = TRUE, pattern = "^fatage_partial_.*.csv$")
tables <-
  lapply(fatage_partial.files, fread)
names(tables) <- gsub("output/fatage_partial_(.*)\\.csv", "\\1", fatage_partial.files)

# join into one
pfdata <-
  do.call(
    rbind,
    tables
  )
pfdata$ftype <- rep(names(tables), sapply(tables, nrow))

stocks <- unique(pfdata$stock_code)

# prop by year, fleet and age
prop_yfa <-
  sapply(
    stocks,
    function(stock) {
      pfdata %>%
        filter(ftype == "fishing_cat" & stock_code == stock) %>%
        ggplot(aes(x = as.numeric(year), y = nprop, col = fleet_grp)) +
        geom_line() +
        geom_point() +
        facet_wrap(~ stock_code + age)
    },
    simplify = FALSE
  )


# partial by age, year and fleet
pfatage_ayf <-
  sapply(
    stocks,
    function(stock) {
      pfdata %>%
        filter(ftype == "fishing_cat" & stock_code == stock) %>%
        ggplot(aes(x = as.numeric(age), y = partial_f, col = factor(year))) +
        geom_line() +
        geom_point() +
        facet_wrap(~ ftype + fleet_grp, scales = "free")
    },
    simplify = FALSE
  )



rmarkdown::render("report_partial-fatage_qc.Rmd", output_file = "qc_partial-fatage", output_dir = "report")

# edit markdown html to remove ghost images
lines <- readLines("report/qc_partial-fatage.html")
remlines <- grep("^<p><img src=\"data:image/png;base64", lines)
cat(
  lines[-remlines],
  file = "report/qc_partial-fatage.html",
  sep = "\n"
)
