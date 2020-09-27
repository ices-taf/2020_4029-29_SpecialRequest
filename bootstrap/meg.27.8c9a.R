#' Data from meg.27.8c9a
#'
#' @name meg.27.8c9a
#' @format csv file
#' @tafOriginator ICES, WGCSE
#' @tafYear 2020
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
taf.library(icesSharePoint)

spgetfile(
  "2020 Meeting Docs/06. Data/meg.27.8c9a/outputsXSA.zip",
  "/ExpertGroups/WGBIE",
  "https://community.ices.dk",
  destdir = "."
)

unzip("outputsXSA.zip", exdir = "temp")
unlink("outputsXSA.zip")

res <- readLines("temp/meg278c9a_results2019.csv")

# read xsa output file
fline1 <- grep("Fishing mortalities", res)
nrows <- which(nchar(res[(fline1 + 2):length(res)]) == 0)[1]

fdata <-
  read.csv(
    "temp/meg278c9a_results2019.csv",
    skip = fline1, nrows = nrows - 1,
    check.names = FALSE
  )
fdata <- fdata[complete.cases(fdata), ]

ages <- fdata$Age
years <- as.numeric(colnames(fdata)[-1])

data <-
  data.frame(
    year = rep(years, length(ages)),
    age = rep(ages, each = length(years)),
    harvest = c(t(fdata[, -1]))
  )
data$stock_code <- "meg.27.8c9a"
write.taf(data)

# clean up
unlink("temp", recursive = TRUE)
