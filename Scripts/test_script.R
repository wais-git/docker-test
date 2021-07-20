# Test script to see how automation goes
# Want to do all the processes would normally need to be able to do

# System dependicies
# Install package environments with renv
# Connect and read/write from database
# Install packages from github
# Read from sharepoint (need to work through how to do this without syncing it)
# AMS (dont think will be an issue)
# install git, git desktop, odbc drivers (relative)
# renv::clean()
#renv::snapshot()
#renv::install("odbc")
#renv:::renv_paths_cache()

library("ggplot2")
library("odbc")
library("magrittr")
library("dplyr")
library("keyring")
library("neon")


# Connect and write to database ================================================

# wais_db_con <- odbc::dbConnect(odbc::odbc(), "WAIS_DataWarehouse")

wais_db_con <- odbc::dbConnect(odbc::odbc(),
                Driver = "ODBC Driver 17 for SQL Server",
                Server = "tcp:waissql01.database.windows.net",
                Database = "WAIS_DataWarehouse",
                Uid = Sys.getenv("db_username"),
                Pwd = Sys.getenv("db_pwd"),
                Port = 1433,
                Encrypt="yes",
                TrustServerCertificate="no",
                timeout = 30,
                Authentication="ActiveDirectoryPassword")

print(wais_db_con)

mtcars %<>%
  mutate(last_update = as.character(Sys.time()))

dbWriteTable(wais_db_con, "mtcars_docker_test", mtcars, overwrite = TRUE)

# WAISR ========================================================================

library("WAISR")
library("keyring")

# ams_pwd <- key_get("AMS DS", "wais.datascience")

pv_comp_report_pull <-
  pull_ams_wais(server = "ams",
                site = "wais",
                form = "WAIS PV Biomech Training and Competition Report Data Collection",
                start_date = format(Sys.Date() - 100, "%d%m%Y"),
                finish_date = format(Sys.Date(),"%d%m%Y"),
                username = Sys.getenv("ams_username"),
                password = Sys.getenv("ams_pwd"),
                read_type = "read_csv",
                return_type = "all")

print(pv_comp_report_pull)

# Neon =========================================================================

pv_comp_report_pull <-
  neon::pull_smartabase(url = "https://ams.ausport.gov.au/wais",
                        form = "WAIS PV Biomech Training and Competition Report Data Collection",
                        start_date = "01/01/1900",
                        end_date = format(Sys.Date(),"%d/%m/%Y"),
                        username = Sys.getenv("ams_username"),
                        password = Sys.getenv("ams_pwd")
  )

# Write back to environment ===================================================

write.csv(mtcars, "./Data/mtcars.csv")
