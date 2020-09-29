## Extract results of interest, write TAF output tables

## Before:
## After:

library(icesTAF)

mkdir("output")

# read harvest information
all_data <- read.taf("data/all_stocks.csv")
stocks <- read.taf("data/stock_info.csv")

for (stock in stocks$stock_code) {
  # split off one stock
  # stock <- "cod.27.47d20"

  # assume user has a data.frame in wide format, ages on top
  data <-
    all_data %>%
    filter(stock_code == stock) %>%
    select(year, age, harvest) %>%
    long2taf()

  if (nrow(data) == 0) {
    msg(stock, " has no data")
    next
  }

  assessment_info <-
    list(
      unit = "F", # vocabulary
      valueType = "harvest", # vocabulary
      stockCode = stock # vocabulary
    )

  # check
  ok <- upload.fay(data, assessment_info, only.check = TRUE)
  if (!ok) {
    msg(stock, " json did not pass")
    next
  }

  #upload.fay(data, assessment_info)
}
