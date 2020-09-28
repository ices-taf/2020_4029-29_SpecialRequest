## Extract results of interest, write TAF output tables

## Before:
## After:

library(icesTAF)

mkdir("output")

# read harvest information
all_data <- read.taf("data/all_stocks.csv")
stocks <- read.taf(taf.data.path("stock_info", "stock_info.csv"))

# split off one stock

data <- all_data %>% filter(stock_code == "cod.27.47d20")

# assume age based numeric data
make_upload_json <- function(data) {

}


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
