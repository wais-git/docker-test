## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----metadata_example, eval = FALSE-------------------------------------------
#  pull_smartabase(
#    form       = "Example event form"
#    start_date = "15/04/2019",
#    end_date   = "31/04/2019",
#    start_time = "9:15 AM",
#    end_time   = "3:30 PM"
#  )

## ----last_example, eval = FALSE-----------------------------------------------
#  pull_smartabase(
#    form       = "Example event form",
#    last       = "7 days"
#  )
#  
#  pull_smartabase(
#    form       = "Example event form",
#    last       = "10 weeks"
#  )
#  
#  pull_smartabase(
#    form       = "Example event form",
#    last       = "3 months"
#  )
#  
#  pull_smartabase(
#    form       = "Example event form",
#    last       = "2 years"
#  )
#  
#  pull_smartabase(
#    form       = "Example event form",
#    last       = "today"
#  )

## ----na_example, echo = FALSE, paged.print = TRUE-----------------------------
n <- 2
dplyr::tibble(
  date               = c(rep(NA, n), "15/04/2019", rep(NA, n-1)),
  form               = "Example event form",
  user_id            = c(31808, 31811, 37201, 37204),
  about              = c("Charlie Thompson", "Jack Williams", "Jamie Anderson", "Liam Walker"),
  Distance           = c(rep(NA, n), 5411, rep(NA, n-1)),
  RPE                = c(rep(NA, n), 7, rep(NA, n-1)),
  entered_by_user_id = c(rep(NA, n), 37201, rep(NA, n-1))
)

## ----about_example, eval = FALSE----------------------------------------------
#  pull_smartabase(
#    form              = "Example event form",
#    filter_user_key   = "about",
#    filter_user_value = c("Aiden Thomas", "Jamie Anderson"),
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----id_example, eval = FALSE-------------------------------------------------
#  pull_smartabase(
#    form              = "Example event form",
#    filter_user_key   = "user_id",
#    filter_user_value = c(37204, 37201),
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----username_example, eval = FALSE-------------------------------------------
#  pull_smartabase(
#    form              = "Example event form",
#    filter_user_key   = "username",
#    filter_user_value = c("aiden.thomas", "jamie.anderson"),
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----email_example, eval = FALSE----------------------------------------------
#  pull_smartabase(
#    form              = "Example event form",
#    filter_user_key   = "email",
#    filter_user_value = c("aiden.thomas@fusionsport.com", "jamie.anderson@fusionsport.com"),
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----current_group_example, eval = FALSE--------------------------------------
#  pull_smartabase(
#    form            = "Example event form",
#    filter_user_key = "current_group",
#    start_date      = "15/04/2019",
#    end_date        = "31/04/2019"
#  )

## ----group_example, eval = FALSE----------------------------------------------
#  pull_smartabase(
#    form              = "Example event form",
#    filter_user_key   = "group",
#    filter_user_value = "Demo Users",
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----filter_data1, eval = FALSE-----------------------------------------------
#  pull_smartabase(
#    form              = "Training Log",
#    filter_data_key   = "Duration",
#    filter_data_value = "35",
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----filter_data_condition, eval = FALSE--------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_data_key       = "Duration",
#    filter_data_value     = "35",
#    filter_data_condition = "greater_than" # alternatively, ">"
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----length_example1, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_data_key       = c("Duration", "RPE"),
#    filter_data_value     = c("25", "6"),
#    filter_data_condition = c("<", ">="), # alternatively, c("less_than", "greater_than_or_equal_to")
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----length_example2, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_data_key       = c("Duration", "RPE"),
#    filter_data_value     = c("25", "6")
#    filter_data_condition = c("<")
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----length_example3, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_data_key       = c("Duration", "RPE"),
#    filter_data_value     = c("7"),
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----length_example4, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_data_key       = c("Duration"),
#    filter_data_value     = c("7", "25"),
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----length_example5, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_data_key       = c("Duration", "RPE"),
#    filter_data_condition = c("=", "<", ">=")
#    filter_data_value     = c("7", "25"),
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----training_log, echo = FALSE, out.extra = 'style="border:0;"'--------------
knitr::include_graphics("../man/figures/training_log.png")

## ----putting_together1, eval = FALSE------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_user_key       = "email",
#    filter_user_value     = c("aiden.thomas@fusionsport.com", "jamie.anderson@fusionsport.com"),
#    filter_data_key       = c("Duration", "RPE"),
#    filter_data_value     = c("25", "6"),
#    filter_data_condition = c("<", ">="), # alternatively, c("less_than", "greater_than_or_equal_to")
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----putting_together2, eval = FALSE------------------------------------------
#  pull_smartabase(
#    form                  = "Training Log",
#    filter_user_key       = "email",
#    filter_user_value     = c("Aiden Thomas", "Jamie Anderson"),
#    filter_data_key       = c("Duration", "RPE"),
#    filter_data_value     = c("50", "Hard"),
#    filter_data_condition = c("!=", "%in%"), # alternatively, c("not_equal_to", "contains")
#    start_date            = "15/04/2019",
#    end_date              = "31/04/2019"
#  )

## ----profile_example, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    form              = "Example profile form",
#    type              = "profile",
#    filter_user_key   = "about",
#    filter_user_value = c("Aiden Thomas", "Jamie Anderson"),
#    start_date        = "15/04/2019",
#    end_date          = "31/04/2019"
#  )

## ----synchronise_example, eval = FALSE----------------------------------------
#  synchronise_example <- pull_smartabase(
#    form       = "Example profile form",
#    type       = "synchronise",
#    start_date = "15/04/2019",
#    end_date   = "31/04/2019"
#  )

## ----synchronise_example2, echo = FALSE---------------------------------------
synchronise_example <- list(new_data = dplyr::tibble(
  about              = c("Charlie Thompson", "Jack Williams", "Jamie Anderson", "Liam Walker"),
  user_id            = c(31808, 31811, 37201, 37204),
  form               = c("Example event form", "Example event form", "Example event form", "Example event form"),
  start_date         = c("15/04/2019", "15/04/2019", "15/04/2019", "15/04/2019"),
  Distance           = c(5411, 2374, 1600, 2564),
  RPE                = c(7, 3, 6, 5),
  entered_by_user_id = c(37201, 37201, 37201, 37201),
  event_id           = c(16517, 36505, 36014, 28970)
),
last_sync_time = as.numeric(formatC(1588855000000, format = "e", digits = 6)),
deleted_events = c(991, 992, 993)
)

## ----synchronise_example3, echo = TRUE----------------------------------------
print(synchronise_example)

## ----synchronise_example4, eval = FALSE---------------------------------------
#  next_sync_example <- pull_smartabase(
#    form           = "Example profile form",
#    type           = "synchronise",
#    last           = "1 years",
#    start_date     = "15/04/2019",
#    end_date       = "31/04/2019",
#    last_sync_time = synchronise_example$last_sync_time
#  )

## ----synchronise_example5, echo = FALSE---------------------------------------
next_sync_example <- list(new_data = dplyr::tibble(
  about              = c("Jamie Anderson"),
  user_id            = c(37201),
  form               = c("Example event form"),
  start_date         = c("18/04/2019"),
  Distance           = c(3100),
  RPE                = c(7),
  entered_by_user_id = c(37201),
  event_id           = c(62331)
),
last_sync_time = as.numeric(formatC(1588856000000, format = "e", digits = 6)),
deleted_events = NULL
)

## ----synchronise_exmaple6, echo = TRUE----------------------------------------
print(next_sync_example)

## ----download_attachment1, echo = TRUE, eval = FALSE--------------------------
#  pull_smartabase(
#    form                = "Example form",
#    download_attachment = TRUE
#    start_date          = "15/04/2019",
#    end_date            = "31/04/2019"
#  )

## ----download_attachment3, echo = FALSE---------------------------------------
cat("Example form is downloading...") 
cat("|===================================================================| 100%")
cat("Dowloading 1 attachment from Example form...")
message("Authentication success: (200) ok")
message("Example form download successful: 1 rows retrieved")
message("Example form attachment download successful: 1 out of 1 files (1mb total) saved to C:/Users/ZacPross/Example_directory")

## ----download_attachment2, echo = FALSE, eval = TRUE--------------------------
dplyr::tibble(
  about              = c("Jamie Anderson"),
  user_id            = c(37201),
  form               = c("Example event form"),
  start_date         = c("18/04/2019"),
  File               = "1234|Example_file.csv",
  Distance           = c(3100),
  RPE                = c(7),
  entered_by_user_id = c(37201),
  event_id           = c(62331),
  file_name          = c("Example Event Form_ZacPross_08062020_900PM_Example_file.csv"),
  attachment_url     = "https://example.smartabase.com//x/FileDownloadServlet?id=b1b234f1-ccd7-4b12-a4fa-123456beb0&token=123456789101112",
  name               = "Example_file.csv"
)

## ----include_missing_users1, echo = FALSE-------------------------------------
include_missing_user_data <- 
  dplyr::tibble(
    about              = c("Charlie Thompson", "Jack Williams", "Jamie Anderson", "Liam Walker"),
    user_id            = c(31808, 31811, 37201, 37204),
    form               = c("Example event form", "Example event form", NA, NA),
    start_date         = c("15/04/2019", "15/04/2019", NA, NA),
    Distance           = c(5411, 2374, NA, NA),
    RPE                = c(7, 3, NA, NA),
    entered_by_user_id = c(37201, 37201, NA, NA),
    event_id           = c(16517, 36505, NA, NA)
  )

## ----include_missing_users2, echo = FALSE-------------------------------------
include_missing_user_data

## ----guess_col_type1, echo = TRUE, eval = FALSE-------------------------------
#  pull_smartabase(
#    form              = "Training Log",
#    start_date        = "15/04/2019",
#    end_date          = "15/04/2019",
#    filter_user_key   = "about",
#    filter_user_value = "Charlie Thompson"
#  )

## ----guess_col_type2, echo = FALSE--------------------------------------------
dplyr::tibble(
  about              = c("Charlie Thompson"),
  user_id            = c(31808),
  form               = c("Example event form"),
  start_date         = c("15/04/2019"),
  `Date of Session`  = "15/04/2019",
  Distance           = c(5411),
  RPE                = c(7),
  entered_by_user_id = c(37201),
  event_id           = c(16517)
)

## ----guess_col_type3, echo = TRUE, eval = FALSE-------------------------------
#  pull_smartabase(
#    form              = "Training Log",
#    start_date        = "15/04/2019",
#    end_date          = "15/04/2019",
#    filter_user_key   = "about",
#    filter_user_value = "Charlie Thompson",
#    guess_col_type    = FALSE
#  )

## ----guess_col_type4, echo = FALSE--------------------------------------------
dplyr::tibble(
  about              = c("Charlie Thompson"),
  user_id            = c(31808),
  form               = c("Example event form"),
  start_date         = c("15/04/2019"),
  `Date of Session`  = "1555288875000",
  Distance           = c("5411"),
  RPE                = c("7"),
  entered_by_user_id = c(37201),
  event_id           = c(16517)
)

## ----shiny_progress_code_example, eval = FALSE--------------------------------
#  input_data <- eventReactive(input$get_data, {
#    pull_smartabase(
#      form = "Example form",
#      start_date = "15/04/2019",
#      end_date = "30/04/2019",
#      shiny_progress_code = shinyhttr::progress(session, id = "get_data_progress")
#    )
#  })

## ----shiny_progress_code_example2, eval = FALSE-------------------------------
#  shinyWidgets::progressBar(
#    id = "get_data_progress",
#    value = 0,
#    title = "",
#    display_pct = TRUE
#  )

