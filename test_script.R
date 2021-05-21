# Test script to see how automation goes
# Want to do all the processes would normally need to be able to do

# System dependicies
# Install package environments with renv
# Connect and read/write from database
# Install packages from github
# Read from sharepoint (need to work through how to do this without syncing it)
# AMS (dont think will be an issue)
# install git, git desktop, odbc drivers (relative)

#renv::snapshot()
#renv::install("odbc")
#renv:::renv_paths_cache()

library("ggplot2")
library("odbc")
# Connect and write to database ================================================

# wais_db_con <- odbc::dbConnect(odbc::odbc(), "WAIS_DataWarehouse")
# 
# mtcars$last_update <- as.character(Sys.time())
# 
# dbWriteTable(wais_db_con, "mtcars", mtcars, overwrite = TRUE)

# Write back to environment ===================================================

write.csv(mtcars, "mtcars.csv")
