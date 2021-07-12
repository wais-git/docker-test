## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----pull_event_id, eval = FALSE----------------------------------------------
#  training_data <- pull_smartabase(
#    form       = "Training Log",
#    start_date = "15/04/2019",
#    end_date   = "15/04/2019"
#  )

## ----pull_id, echo = FALSE----------------------------------------------------
training_data <- dplyr::tibble(
  start_date               = "15/04/2019",
  user_id            = c(37204, 37201),
  event_id           = c(2381840, 2382033),
  about              = c("Aiden Thomas", "Jamie Anderson"),
  distance           = c(2530, 5411),
  RPE                = c(5, 7),
  `Average Distance` = c(NA, NA)
)

training_data

## ----team_avg_calc, message = FALSE-------------------------------------------
# Need to load dplyr
library(dplyr)

avg_dist_data <- training_data %>% 
  mutate_at("Average Distance", ~ round(mean(distance), 1))

avg_dist_data

## ----team_avg_push, eval = FALSE----------------------------------------------
#  push_smartabase(
#    df         = avg_dist_data,
#    form       = "Training Log",
#    edit_event = TRUE
#  )

## ----pop_up_cat, echo = FALSE-------------------------------------------------
message("Please respond to pop-up prompt")

## ----screenshot_popup, echo = FALSE, out.width = "500px", fig.cap = "edit_event confirmation"----
knitr::include_graphics("../man/figures/edit_event_popup.PNG")

## ----push_dist_avg_success, echo = FALSE--------------------------------------
cat("Uploading 2 existing records in Training Log...") 
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message("SUCCESSFULLY_IMPORTED: 2 out of 2 records successfully imported by user 12345")

## ----get_id_data, echo = FALSE------------------------------------------------
training_data <- dplyr::tibble(
  start_date     = "15/04/2019",
  about    = c("Aiden Thomas", "Jamie Anderson"),
  distance = c(2530, 5411),
  RPE      = c(5, 7)
)

training_data

## ----get_id_example, eval = FALSE---------------------------------------------
#  push_smartabase(
#    df                 = training_data,
#    form               = "Training Log",
#    get_id             = TRUE,
#    match_id_to_column = "about"
#  )

## ----screenshot_table, echo = FALSE, out.width = "500px", fig.cap = "edit_event confirmation"----
knitr::include_graphics("../man/figures/table_example.PNG")

## ----pull_table, eval = FALSE-------------------------------------------------
#  strength_data <- pull_smartabase(
#    form              = "Strength Testing",
#    start_date        = "15/04/2019",
#    end_date          = "15/04/2019",
#    filter_user_key   = "about",
#    filter_user_value = c("Aiden Thomas", "Jamie Anderson")
#  )

## ----strength_data, echo = FALSE----------------------------------------------
strength_data <- dplyr::tibble(
  start_date        = rep("15/04/2019", 6),
  user_id     = c(37204, 37204, 37204, 37201, 37201, 37201),
  about       = c("Aiden Thomas", "Aiden Thomas", "Aiden Thomas", 
                  "Jamie Anderson", "Jamie Anderson", "Jamie Anderson"),
  session_rpe = c(7, NA, NA, 8, NA, NA),
  exercise    = c("Bench Press", "Bench Press", "Bench Press", 
                  "Back Squat", "Back Squat", "Back Squat"),
  load        = c(120, 115, 110, 170, 165, 165),
  repetition  = c(3, 3, 3, 3, 3, 3),
  event_id    = c(2381840, 2381840, 2381840, 2382033, 2382033, 2382033)
)

## ----strength_data_print------------------------------------------------------
strength_data

## ----push_table, eval = FALSE-------------------------------------------------
#  push_smartabase(
#    df           = strength_data,
#    form         = "Strength Testing",
#    table_fields = c("exercise", "load", "repetition")
#  )

## ----gps_example, eval = FALSE------------------------------------------------
#  library(dplyr)
#  
#  # Imagine we have GPS data where column 10 through to 60 are table fields
#  gps_table_names <- gps_data %>% select(10:60) %>% names()

## ----gps_push_table, eval = FALSE---------------------------------------------
#  push_smartabase(
#    df           = gps_data,
#    form         = "GPS",
#    table_fields = gps_table_names
#  )

## ----non_table_duplicate_example, echo = FALSE--------------------------------
strength_data <- dplyr::tibble(
  start_date = c("15/04/2019", "15/04/2019", "16/04/2019",
                 "15/04/2019", "15/04/2019", "15/04/2019"),
  user_id    = c(37204, 37204, 37204, 37201, 37201, 37201),
  about      = c("Aiden Thomas", "Aiden Thomas", "Aiden Thomas", 
                 "Jamie Anderson", "Jamie Anderson", "Jamie Anderson"),
  exercise   = c("Bench Press", "Bench Press", "Bench Press", 
                 "Back Squat", "Back Squat", "Back Squat"),
  load       = c(120, 115, 110, 170, 165, 165)
) %>% 
  dplyr::arrange(start_date, user_id)

## ----non_table_duplicate_example2, echo = TRUE--------------------------------
print(strength_data)

## ----non_table_duplicate_example3, echo = FALSE-------------------------------
strength_data %>% 
  dplyr::group_by(start_date, user_id) %>% 
  dplyr::mutate(row_num = 1:dplyr::n()) %>% 
  dplyr::ungroup() %>% 
  split(.$row_num) %>% 
  purrr::map(~ .x %>% dplyr::select(-row_num))

## ----non_table_duplicate_example4, eval = FALSE-------------------------------
#  push_smartabase(
#    df   = strength_data,
#    form = "Strength Testing"
#  )

## ----non_table_duplicate_example5, echo = FALSE-------------------------------
cat("Uploading 3 new records to Strength Testing...") 
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message("SUCCESSFULLY_IMPORTED: 3 out of 3 records successfully imported by user 12345")

## ----non_table_duplicate_example6, echo = FALSE-------------------------------
cat("Uploading 2 new records to Strength Testing...") 
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message("SUCCESSFULLY_IMPORTED: 2 out of 2 records successfully imported by user 12345")

## ----non_table_duplicate_example7, echo = FALSE-------------------------------
cat("Uploading 1 new records to Strength Testing...") 
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message("SUCCESSFULLY_IMPORTED: 1 out of 1 records successfully imported by user 12345")

## ----date_conversion_data, echo = FALSE---------------------------------------
example_mdy_data <- tibble(
  date          = "01/31/2019",
  user_id       = 37204,
  example_field = "test data"
)

## ----date_conversion_data_print-----------------------------------------------
example_mdy_data

## ----date_conversion, eval = FALSE--------------------------------------------
#  push_smartabase(
#    df                  = example_mdy_data,
#    form                = "Example form",
#    current_date_format = "mdy"
#  )

## ----metadata_data, echo = FALSE----------------------------------------------
example_data <- tibble(
  user_id       = 37204,
  example_field = "test data",
  date1         = "14/03/2019",
  date2         = "14/03/2019",
  time1         = "09:00 AM",
  time2         = "09:30 AM"
)

## ----metadata_data_print------------------------------------------------------
example_data

## ----metadata_push, eval = FALSE----------------------------------------------
#  push_smartabase(
#    df         = example_data,
#    form       = "Example form",
#    start_date = "date1",
#    end_date   = "date2",
#    start_time = "time1",
#    end_time   = "time2"
#  )

## ----profile_data, echo = FALSE-----------------------------------------------
profile_data <- tibble(
  user_id = 37204,
  about   = "Aiden Thomas",
  gender  = "Male",
  Height  = 184,
  Weight  = 81
)

## ----profile_data_print-------------------------------------------------------
profile_data

## ----profile_push, eval = FALSE-----------------------------------------------
#  push_smartabase(
#    df   = profile_data,
#    form = "Athlete Profile",
#    type = "profile"
#  )

## ----shiny_progress_code_example, eval = FALSE--------------------------------
#  output_data <- eventReactive(input$push_data, {
#    push_smartabase(
#      df = "example_data",
#      form = "Example form",
#      shiny_progress_code = shinyhttr::progress(session, id = "push_data_progress")
#    )
#  })

## ----shiny_progress_code_example2, eval = FALSE-------------------------------
#  shinyWidgets::progressBar(
#    id = "push_data_progress",
#    value = 0,
#    title = "",
#    display_pct = TRUE
#  )

