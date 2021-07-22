library("here")
library("stringr")

sharepoint_folder_root <- "C:/Users/jfahey-gilmour/WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED/WAIS DMS - Competitions"

# mount as sharepoint folder!
if(dir.exists(sharepoint_folder_root) == FALSE){
  
  folder_root <- basename(sharepoint_folder_root)
  
} else{
  
  folder_root <- sharepoint_folder_root
}

seasons <- c("2021 Season", "2020 Season", "2019 Season")

season_folders <- here(folder_root, seasons)

recursive_directory_list <- list.dirs(season_folders[1])

competition_folders_directory <- recursive_directory_list[str_detect(recursive_directory_list, "[:digit:]{2}$")]

file_list <- list.files(competition_folders_directory, full.names = TRUE)

# Comp report extensions
competition_report_file_extension_list <- file_list[str_detect(file_list, ".xlsx")]

print(competition_report_file_extension_list)
write.csv(data.frame(competition_report_file_extension_list), "./Data/competition_report_file_extension_list.csv")
