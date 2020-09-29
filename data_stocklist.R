## Preprocess data, write TAF data tables

## Before:
## After:

library(icesTAF)
library(dplyr)

mkdir("data")

stocks <- read.taf(taf.data.path("stock_info", "stock_info.csv"))

stock_table <-
  stocks %>%
    by(
      stocks$area,
      function(x) {
        x <- unique(x$species)
        c(x, rep("", 5))[1:5]
      }
    ) %>%
    unclass() %>%
    do.call(what = 'cbind.data.frame') %>%
    select(
      "NORTH SEA",
      "NORTH WESTERN WATERS",
      "SOUTH WESTERN WATERS",
      "BALTIC SEA"
    )

stock_table

write.taf(stock_table, dir = "data")
