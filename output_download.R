## Extract results of interest, write TAF output tables

## Before:
## After:

library(icesTAF)
library(dplyr)

mkdir("output")

devtools::load_all("D:\\projects\\git\\ices-tools-prod\\icesTAF")

# download stock info from TAF DB

# choose which dataset we want
(tags <- get.stockassessments())

tag <-
  tags %>%
  filter(stockCode == "cod.27.47d20", activeYear == 2020) %>%
  select(name) %>%
  unlist()

# download it as csv (taf format)
fdata <- get.stockassessment.results(tag)

# download as FLQuant?
fdata.flq <- get.stockassessment.results(tag, asFLQuant = TRUE)
