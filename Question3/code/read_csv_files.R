library(tidyverse)

# Function to read .csv files into global environment as data frames
read_csv_files <- function(directory_path) {
    # List all .csv files in the directory
    csv_files <- list.files(path = directory_path, pattern = "\\.csv$", full.names = TRUE)

    # Read each .csv file and assign it to the global environment
    for (file in csv_files) {
        # Extract file name without extension to use as object name
        df_name <- tools::file_path_sans_ext(basename(file))

        # Read .csv file into a data frame
        df <- read_csv(file)

        # Assign data frame to global environment
        assign(df_name, df, envir = .GlobalEnv)
    }

}


## Consider either changing or removing this
