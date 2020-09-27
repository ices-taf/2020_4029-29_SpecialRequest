#' Gather ICES stock data
#'
#' @name ices_stocks
#' @format csv files
#' @tafOriginator various
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
taf.library(icesSharePoint)

# taf urls
taf_urls <-
  c(
    "cod.27.7a" = "2020_cod.27.7a_assessment",
    "cod.27.47d20" = "2020_cod.27.47d20_assessment",
    "had.27.46a20" = "2020_had.27.46a20_assessment",
    "pok.27.3a46" = "2020_pok.27.3a46_assessment",
    "ple.27.420" = "2020_ple.27.420_assessment",
    "ple.27.7e", "2020_ple.27.7e_assessment",
    "hke.27.3a46-8abd" = "2020_hke.27.3a46-8abd_assessment"
  )

# sao runs
sao_run <-
  c(
    "whg.27.47d" = "NSwhiting_2020_new_method_new1"
  )

# other stocks
noncat1 <-
  c(
    "cod.27.6b" = "6",
    "cod.27.7a" = "3.1",
    "pok.27.7-10" = "no assessment",
    "whg.27.6b" = "no assessment",
    "ple.27.7bc" = "6",
    "ple.27.7h-k" = "no assessment",
    "ple.27.7fg" = "biomass",
    "whg.27.89a" = "no assessment",
    "ldb.27.7b-k8abd" = "5"
  )

# stecf to ices codes
stecf_codes <-
  c(
    "hke.gsa.1_5_6_7" = "HKE1567",
    "hke.gsa.9_10_11" = "HKE91011",
    "hke.gsa.17_18" = "HKE1718SS3", # not "HKE1718a4a",
    "mur.gsa.5" = "MUR5",
    "mut.gsa.1" = "MUT1",
    "mut.gsa.6" = "MUT6",
    "mut.gsa.7" = "MUT7",
    "mut.gsa.9" = "MUT8",
    "mut.gsa.10" = "MUT10",
    "mut.gsa.17_18" = "MUT1718"
  )
