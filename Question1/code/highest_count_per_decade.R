# Function for max count for names.

highest_count_per_decade <- function(data_frame) {
    # Ensure required columns exist and are of correct type
    required_columns <- c("Name", "Year", "Count")
    if (!all(required_columns %in% colnames(data_frame))) {
        stop("Data frame must contain 'Name', 'Year', and 'Count' columns.")
    }

    # Convert years to decades
    data_frame <- data_frame %>%
        mutate(Decades = floor(Year / 10) * 10) %>%
        select(-Year)  # Remove 'years' column

    # Group by decades, find names with highest count per decade
    result <- data_frame %>%
        group_by(Decades) %>%
        filter(Count == max(Count)) %>%
        ungroup() %>%
        select(Name, Decades, Count) %>%
        distinct() %>%
        arrange(Decades)# Remove duplicates

    return(result)
}









