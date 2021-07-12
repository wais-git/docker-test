## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----delete_example1, eval = FALSE--------------------------------------------
#  example_data <- pull_smartabase(
#    form       = "Example profile form",
#    start_date = "15/04/2019",
#    end_date   = "31/04/2019"
#  )

## ----delete_example2, echo = FALSE--------------------------------------------
example_data <- dplyr::tibble(
  about              = c("Charlie Thompson", "Jack Williams", "Jamie Anderson", "Liam Walker"),
  user_id            = c(31808, 31811, 37201, 37204),
  form               = c("Example event form", "Example event form", "Example event form", "Example event form"),
  start_date         = c("15/04/2019", "15/04/2019", "15/04/2019", "15/04/2019"),
  Distance           = c(5411, 2374, 1600, 2564),
  RPE                = c(7, 3, 6, 5),
  entered_by_user_id = c(37201, 37201, 37201, 37201),
  event_id           = c(16517, 36505, 36014, 28970)
)

## ----delete_example3----------------------------------------------------------
print(example_data)

## ----delete_example4, eval = FALSE--------------------------------------------
#  pull_smartabase(
#    event_id = 16517
#  )

## ----delete_example5, echo = FALSE--------------------------------------------
cat("Deleting events...") 
cat("|===================================================================| 100%")
message("Authentication success: (200) ok")
message('{"message": "Deleted 16517","state": "SUCCESS"}')

