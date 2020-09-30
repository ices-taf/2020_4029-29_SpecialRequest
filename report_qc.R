## Prepare plots and tables for report

## Before:
## After:

library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)

fatage.csv <-
  dir("output", pattern = "*._fatage.csv", full = TRUE) %>%
  lapply(
    function(x) {
      read.taf(x) %>%
        mutate(stock = gsub("_fatage.csv", "", basename(x))) %>%
        pivot_longer(num_range("", 0:100), "age")
    }
  ) %>%
  do.call(rbind, .) %>%
  mutate(age = as.numeric(age))

#
p1 <-
  ggplot(data = fatage.csv) +
    geom_line(aes(x = age, y = value, col = factor(Year))) +
    facet_wrap( ~ stock)

#
p2 <-
  ggplot(data = fatage.csv) +
  geom_line(aes(x = Year, y = value, col = factor(age))) +
  facet_wrap(~stock)

#
p3 <-
  ggplot(data = fatage.csv) +
  geom_line(aes(x = Year, y = value, col = factor(stock))) +
  facet_wrap(~age)

rmarkdown::render("report_qc.Rmd", output_file = "qc_report", output_dir = "report")
