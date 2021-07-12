## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load-package, eval = FALSE-----------------------------------------------
#  library(neon)

## ----credentials, eval = FALSE------------------------------------------------
#  save_credentials()

## ----credentials-output, echo = FALSE, eval = FALSE---------------------------
#  neon::save_credentials()

## ----pull_example1, eval = FALSE----------------------------------------------
#  training_data <- pull_smartabase(
#    form       = "Training Log",
#    start_date = "15/04/2019",
#    end_date   = "15/04/2019"
#  )

## ----pull_example2, eval = FALSE----------------------------------------------
#  training_data <- pull_smartabase(
#    form       = "Training Log",
#    url        = "example.smartabase.com/site",
#    username   = "zac.pross",
#    password   = "examplePassword",
#    start_date = "15/04/2019",
#    end_date   = "15/04/2019"
#  )

## ----pull_success, echo = FALSE-----------------------------------------------
cat("User ID data is downloading...")
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message("Training Log download successful")

## ----fake_data, echo = FALSE, paged.print = TRUE------------------------------
training_data <- dplyr::tibble(
  date               = "15/04/2019",
  user_id            = c(37204, 37201),
  about              = c("Aiden Thomas", "Jamie Anderson"),
  distance           = c(2530, 5411),
  RPE                = c(5, 7),
  event_id           = c(2381840, 2382033),
  entered_by_user_id = c(37204, 37201)
)

training_data

## ----save_rds, eval = FALSE---------------------------------------------------
#  # Save data onto local machine using saveRDS
#  saveRDS(training_data, "training_data")
#  
#  # Load it back in again using readRDS
#  readRDS("training_data")

## ----avg_RPE, message = FALSE-------------------------------------------------
# Need to load dplyr
library(dplyr)

RPE_average <- training_data %>% 
  select(-entered_by_user_id) %>% 
  mutate(team_RPE = round(mean(RPE), 1))

RPE_average

## -----------------------------------------------------------------------------
RPE_average <- RPE_average %>%
  mutate(RPE_diff = RPE - team_RPE)

RPE_average

## ----push_RPE, eval = FALSE---------------------------------------------------
#  push_smartabase(
#    df   = RPE_average,
#    form = "Team Summary"
#  )

## ----push_RPE_success, echo = FALSE-------------------------------------------
cat("Uploading 1 rows to Team Summary...") 
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message("SUCCESSFULLY_IMPORTED: 4 out of 4 records successfully imported")

