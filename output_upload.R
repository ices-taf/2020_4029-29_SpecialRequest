## Extract results of interest, write TAF output tables

## Before:
## After:

library(icesTAF)

mkdir("output")

# read harvest information
all_data <- read.taf("data/all_stocks.csv")
stocks <- read.taf(taf.data.path("stock_info", "stock_info.csv"))

# split off one stock
stk <- "cod.27.47d20"

# assume user has a data.frame in wide format, ages on top
data <-
  all_data %>%
  filter(stock_code == stk) %>%
  select(year, age, harvest) %>%
  long2taf()

assessment_info <-
  list(
    unit = "F", # vocabulary
    valueType = "harvest", # vocabulary
    stockCode = stk # vocabulary
  )

devtools::load_all("D:\\projects\\git\\ices-tools-prod\\icesTAF")

# check
upload.fay(data, assessment_info, only.check = TRUE, quiet = FALSE)

upload.fay(data, assessment_info)

# check upload
(tags <- get.stockassessments())
get.stockassessment.results("2020_cod.27.47d20_assessment@v0.1")
