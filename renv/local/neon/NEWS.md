# neon 0.1.20

## Bug fixes

- Records that exist but contain no data (apart from metadata) are now filtered from the resulting data frame produced by `pull_smartabase()`
- Fixed bug in push_smartabase() whereby the same record was pushed twice when edit_event = TRUE but all event IDs were NA in outgoing data frame

# neon 0.1.19

## New features

- New `download_attachment` argument in `pull_smartabase()` allows downloading of any files attached in a file upload field.

## Enhancements

- Built under R 4.0.0
- Under certain conditions, the lengths of the values supplied to the `filter_data_key`, `filter_data_value` and `filter_data_condition` arguments in `pull_smartabase()` no longer need to be equal

## Bug fixes

- Improved error messaging around certain authentication errors not being caught in `push_smartabase()`

# neon 0.1.18

## New features

- New `delete_smartabase()` function that deletes an existing Smartabase record according to event ID

## Enhancements

- In `pull_smartabase()`, when `type = "synchronise"`, as well as returning any new events that have occurred since the `last_sync_time`, it now also returns the event IDs of any events that have been deleted since `last_sync_time`.

# neon 0.1.17

## Enhancements

- When `table_fields = NULL`, `push_smartabase()` now detects instances where a data frame contains multiple records for the same date for the same user_id and splits these records into separate data frames. `push_smartabase()` is then invoked for each separated data frame. This helps to alleviate a common pain point where users would encounter errors when trying to push into non table fields, but their data contained multiple rows for a given user_id for the same date.
- Progress bar can now be displayed in shiny apps that use `push_smartabase()` (previously was only supported for `pull_smartabase()`)
- Progress bar can now be displayed in shiny apps even when `cloud_mode = TRUE`
- guess_col_type message is suppressed when reading-in data with `pull_smartabase()`
- `profile_form` argument in `push_smartabase()` is changed to `type` so as to reflect earlier change made in `pull_smartabase()`
- If the `entered_by_user_id` argument is NULL in `push_smartabase()` and there is a column in the out going data frame called `entered_by_user_id`, then any NA values present in this column are now replaced with the entered_by_user_id value found in .REnviron.

## Bug fixes

- The message returned from `pull_smartabase()` is now changed to return the number of rows, not the number of records, since it is unknown at this stage whether the data contains table fields. For example, a table could contain three rows but could be considered one record, in the case where each row was attributed to the same user_id on the same event date.
- An error is forced when no entered_by_user_id is found when calling `push_smartabase()`; i.e. the `entered_by_user_id` argument is NULL (and no value is found in .REnviron), and there is no column in the outgoing data frame called "entered_by_user_id".
- Any columns named "First Name" and/or "Last Name" are removed from the data frame supplied to `push_smartabase()`. This is to fix a common occurrence where the destination form links in First Name and Last Name from a user's profile, and as such the Smartabase API returns an error because it detects duplicate fields (i.e., First/Last Name sent via `neon`, and First/Last Name being linked from the user's profile).
- Fixed an issue in `push_smartabase()` when the `end_time` argument is NULL. The auto-calculation of `end_time` would be incorrect when `start_time` is after 12pm.

# neon 0.1.16

## New features

- New `shiny_progress_code` argument that uses the `shinyhttr` package to allow a progress bar to appear in shiny apps that use `pull_smartabase()`

# neon 0.1.15

## New features

- New "synchronise" endpoint and `last_sync_time` argument added to `pull_smartabase()`. The `profile_form` argument is replaced with a `type` argument that can accept either "event", "profile" or "synchronise", such that when set to `type = "synchronise"`, `pull_smartbase()` will return any records that have been entered after the time supplied to `last_sync_time` (which must be in the form of the number of milliseconds since 01-01-1970; i.e., epoch time)

# neon 0.1.14

## Bug fixes

- Fixed issue where date fields (excluding event date) in profile forms were not being converted from epoch time to local date format

# neon 0.1.13

## New features

- New `last` argument in `pull_smartabase()` that allows the user to indicate how many of the last days, weeks, months or years of of data should be pulled; e.g. "7 days", "10 weeks", "2 months" etc. The user must either can supply a value to `last` or to `start_date` and `end_date`.

# neon 0.1.12

## Enhancements

- If the `entered_by_user_id` argument is NULL in `push_smartabase()`, but there is a column in the outgoing data frame called entered_by_user_id, then the values in that column will be used to populate the Entered By User ID field in Smartabase -- even if there is an entered_by_user_id value saved in .REnviron. This is to satisfy workflows where neon is being used to edit records after the fact, but original entered_by_user_id values need to be retained (i.e. not overwritten by the entered_by_user_id supplied to `neon`). Records with different entered_by_user_ids are then split into separate data frames and `push_smartabase()` is invoked for each separate data frame. If the user wants to apply an entered_by_user_id value to all records being pushed, then this ID must be nominated in the entered_by_user_id argument of `push_smartabase()`. 

## Bug fixes

- Progress bar is now suppressed when `cloud_mode = TRUE`

# neon 0.1.11

## New features

- New `get_metadata_names()` function that subsets a data frame by "about", "form", "start_date", "end_date", "start_time", "end_time", "entered_by_user_id" or "event_id".
- New `get_uuid` argument in `pull_smartabase()` and `get_id()` that returns uuid in data frame 

## Enhancements

- `tidyr::pivot_wider()` is used in `pull_smartabase()` internals to ensure that columns retain the same ordering as they appear in Smartabase

# neon 0.1.10

## Bug fixes

- Column ordering code removed since not working as expected

# neon 0.1.9

## Enhancements

- `pull_smartabase()` now retains the order of fields as they appear in Smartabase rather than ordering alphabetically

# neon 0.1.8

## New features

- New `guess_col_type` argument that uses `readr::type_convert()` to detect column types in `pull_smartabase()`

# neon 0.1.7

## Bug fixes

- Fixed issue where passwords with special characters were not being encoded correctly

# neon 0.1.6

## Enhancements

- Return error message when no users are returned by `get_id()` rather than exiting function

# neon 0.1.5

## New features

- New `cloud_mode` argument that makes `push_smartabase()` compatible with non-interactive environments by suppressing error logs and pop-up messages. 

# neon 0.1.4

## Bug fixes

- Detect/remove duplicate fields when pushing to Smartabase and added error message

# neon 0.1.3

## Bug fixes

- Improved error handling and messages when pushing data against users with same first/last name but distinct user IDs

# neon 0.1.2

## New features

- New `include_missing_users` argument in `pull_smartabase()` that returns all available users, irrespective of whether a user has entered data. If no data has been entered by a user, NAs will be returned. The aim is to aid data quality / compliance reporting.

## Enhancements

- `pull_smartabase()` recognises and automatically converts date fields (i.e. not event date) from epoch time to the timezone of user's local machine
- The number of records retrieved by `pull_smartabase()` are now returned in a message

# neon 0.1.1

## New features

- New ability to push both new records and edit existing records in the same call to `push_smartabase()`

## Enhancements

- `pull_smartabase()` automatically converts date fields (i.e. not event date) from epoch time to dd/mm/YYYY

# neon 0.1.0

## New features

- New `save_credentials()` function that allows user to save Smartabase credentials to a hidden file
- New `get_id()` function for retrieving user details
- New `get_group()` function for retrieving available Smartabase groups
- New `edit_event` argument in `push_smartabase()` that allows overwriting of existing records
- New filter arguments in `pull_smartabase()`: filter_user_key, filter_user_value, filter_data_key, filter_data_value and filter_data_condition
- New `get_id` and `match_id_to_column` arguments in `push_smartabase()` that allow user mapping via 'username', 'about' or 'email' present in data frame, whereas previously the input data frame had to contain 'user_id'
- Can now push/pull to profile forms via `profile_form` argument in `pull_smartabase()` and `push_smartabase()`
- New `current_date_format` argument in `push_smartabase()` allows user to identify current date format of start_date/Date column
- New `table_fields` argument in `push_smartabase()` allows entry into Smartabase table fields

## Enhancements

- Improved error messages for invalid start_date, end_date, start_time, end_time or table_field inputs
- Progress bar now appears `pull_smartabase()`/`push_smartabase()` is called
- Rows with malformed dates/times that `push_smartabase()` could not convert are logged to a text file in working directory

## Bug fixes

- Fixed `push_smartabase()` JSON conversion problem when both table and non-table fields are present in a data frame 
- Fixed encoding issue of special characters in form name

# neon 0.0.0.9000

- First release
