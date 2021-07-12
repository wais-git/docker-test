## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- get_group, eval = FALSE-------------------------------------------------
#  get_group()

## ----get_group_print, echo = FALSE--------------------------------------------
groups_df <- dplyr::tibble(
  Group = c("All Users", "First Team", "Reserves")
)

groups_df

## ----get_group_manual, eval = FALSE-------------------------------------------
#  get_group(
#    username = "john.smith",
#    password = "examplePassword",
#    url      = "example.smartabase.com/site"
#  )

## ----pull_group, eval = FALSE-------------------------------------------------
#  pull_smartabase(
#    form              = "Training Log",
#    filter_data_key   = "group",
#    filter_data_value = "First Team"
#  )

## ----current_group_example, eval = FALSE--------------------------------------
#  get_id(
#    filter_user_key = "current_group"
#    )

## ----current_group_data, echo = FALSE-----------------------------------------
dplyr::tibble(
  user_id  = c(37204, 37201),
  about    = c("Aiden Thomas", "Jamie Anderson"),
  email    = c("aiden.thomas@fusionsport.com", "jamie.anderson@fusionsport.com"),
  username = c("aiden.thomas", "jamie.anderson")
)

## ----group_example, eval = FALSE----------------------------------------------
#  get_id(
#    filter_user_key   = "group",
#    filter_user_value = "First Team"
#    )

## ----about_example, eval = FALSE----------------------------------------------
#  get_id(
#    filter_user_key   = "about",
#    filter_user_value = c("Aiden Thomas", "Jamie Anderson")
#    )

## ----username_example, eval = FALSE-------------------------------------------
#  get_id(
#    filter_user_key   = "username",
#    filter_user_value = c("aiden.thomas", "jamie.anderson")
#    )

## ----email_example, eval = FALSE----------------------------------------------
#  pull_smartabase(
#    form              = "Example event form",
#    filter_user_key   = "email",
#    filter_user_value = c("aiden.thomas@fusionsport.com", "jamie.anderson@fusionsport.com")
#    )

## ----get_metadata_names_example, eval = FALSE---------------------------------
#  example_df <- dplyr::tibble(
#    about = c("Jamie Anderson", "Charlie Thompson"),
#    start_date = c("14/02/2020", "14/02/2020"),
#    form = "Hydration",
#    `Body Weight pre training` = round(runif(2, 82, 92), 0),
#    `Body Weight post training` = round(runif(2, 82, 92), 0),
#    `Urine Colour` = round(runif(2, 1, 8), 0),
#    end_date = c("14/02/2020", "14/02/2020")
#  )
#  
#  example_df %>% dplyr::select(get_metadata_names(.))

## ----get_metadata_names3, echo = FALSE----------------------------------------
dplyr::tibble(about = c("Jamie Anderson", "Charlie Thompson"),
       form = c("Hydration", "Hydration"),
       start_date = c("14/02/2020", "14/02/2020"),
       end_date = c("14/02/2020", "14/02/2020"))

