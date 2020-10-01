## Prepare plots and tables for report

## Before:
## After:

library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)

# ----
# partial fatage upload and download checks
# ----


rmarkdown::render("report_partial-fatage_qc.Rmd", output_file = "qc_partial-fatage", output_dir = "report")
