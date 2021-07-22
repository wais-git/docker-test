# Install and set up neon

neon_dependencies <- c("httr", "readr", "getPass", "dplyr", "tibble", "tidyr", 
                       "purrr", "jsonlite", "stringr", "magrittr", "lubridate", 
                       "rlang", "tidyselect", "usethis")

# Packages from above list that are not already installed on your local machine
new_packages <- neon_dependencies[!(neon_dependencies %in% installed.packages()[, "Package"])]

# Install the packages
if (length(new_packages) & !identical(new_packages, character(0))) {
  install.packages(new_packages)
}

install.packages('neon/neon_0.1.20.tar.gz', repos = NULL)
