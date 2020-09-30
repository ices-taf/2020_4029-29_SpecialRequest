## Extract results of interest, write TAF output tables

## Before:
## After:

library(icesTAF)
library(dplyr)

mkdir("output")

stocks <- read.taf("output/stock_upload_summary.csv")

# do not inclide the three WGCSE ones for now
stocks <-
  stocks %>%
    filter(
      !stock_code %in% c("cod.27.7e-k", "had.27.7b-k", "whg.27.7b-ce-k")
    )

# choose which dataset we want
(tags <- get.stockassessments())

flqs <- list()

for (stock in stocks$stock_code) {
  # stock <- stocks$stock_code[1]
  tag <- tags %>% filter(stockCode == stock)
  if (nrow(tag) == 0) next

  # download it as csv (taf format)
  fdata <- get.stockassessment.results(tag$name)
  write.taf(fdata, file = paste0(stock, "_fatage.csv"), dir = "output")

  # download as FLQuant?
  flqs[[stock]] <- get.stockassessment.results(tag$name, asFLQuant = TRUE)
}

flquants <- FLCore::FLQuants(flqs)

save(flquants, file = "output/FLQuants_fatage.RData")
