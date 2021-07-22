# Install custom packages
# List dependencies ============================================================
neon_dependencies <- c("httr", "readr", "getPass", "dplyr", "tibble", "tidyr", 
                       "purrr", "jsonlite", "stringr", "magrittr", "lubridate", 
                       "rlang", "tidyselect", "usethis")

WAISR_dependencies <- c("remotes")

combined_dependencies <- c(neon_dependencies, WAISR_dependencies)

# Packages from above list that are not already installed on your local machine
new_packages <- combined_dependencies[!(combined_dependencies %in% installed.packages()[, "Package"])]

# Install the packages
if (length(new_packages) & !identical(new_packages, character(0))) {
  install.packages(new_packages)
}
# Neon =========================================================================
install.packages('neon/neon_0.1.20.tar.gz', repos = NULL)

# WAISR ========================================================================
remotes::install_github('wais-git/WAISR', auth_token = Sys.getenv("WAISR_auth_token"))
