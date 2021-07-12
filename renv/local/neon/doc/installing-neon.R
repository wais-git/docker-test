## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----dependencies, eval = FALSE-----------------------------------------------
#  # List of packages that need to be installed for neon to work
#  neon_dependencies <- c("httr", "readr", "getPass", "dplyr", "tibble", "tidyr",
#                      "purrr", "jsonlite", "stringr", "magrittr", "lubridate",
#                      "rlang", "tidyselect", "usethis")
#  
#  # Packages from above list that are not already installed on your local machine
#  new_packages <- neon_dependencies[!(neon_dependencies %in% installed.packages()[, "Package"])]
#  
#  # Install the packages
#  if (length(new.packages) & !identical(new_packages, character(0))) {
#    install.packages(new_packages)
#  }

## ----install_gif, echo = FALSE, out.extra = 'style="border:0;"', out.width = "700px"----
knitr::include_graphics("../man/figures/installing_gif.gif")

## ----install_path1, eval = FALSE----------------------------------------------
#  install.packages("neon.zip", repos = NULL, type = "binary")

