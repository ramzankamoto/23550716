read_rds_files <- function(directory, custom_names = NULL) {
    # List all files in the directory
    files <- list.files(directory, full.names = TRUE)

    # Filter out non-.rds files
    rds_files <- files[grep("\\.rds$", files)]

    # Read in each .rds file and assign it as a dataframe in the global environment
    for (i in seq_along(rds_files)) {
        file_name <- custom_names[i]
        assign(file_name, readRDS(rds_files[i]), envir = .GlobalEnv)
    }
}














