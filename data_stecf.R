## Preprocess data, write TAF data tables

## Before:
## After:

library(icesTAF)
library(dplyr)
library(httr)

hke <-
  read.taf(
    taf.data.path(
      "stecf",
      "FatAGE_HKE_MUT_MUR.csv"
    )
  )

head(hke)

# split off one stock

HKE1567 <- hke %>% filter(Stock == "HKE1567")

# assume age based numeric data

info <-
  list(
    unit = "F", # vocabulary
    valueType = "harvest", # vocabulary
    stockCode = "hke.gsa.1_5_6_7", # vocabulary
    activeYear = 2020,
#    species = "hake", from stock code
#    area = "gsa.1_5_6_7", from stock code
    repoTag = "2020_hke.gsa.1_5_6_7_assessment@v1.0.0"
  )

values <-
  data.frame(
    value = HKE1567$HARVEST,
    year = HKE1567$YEAR,
    age = HKE1567$AGE
  )

body <- list(info = info, values = values)

url <- "https://localhost:5001/api/upload"

POST(url, body = body, encode = "json", verbose())


DELETE(url)
