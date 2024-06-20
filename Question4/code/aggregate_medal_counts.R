# Function to aggregate medal counts per country per year
aggregate_medal_counts <- function(data) {
    aggregated_data <- data %>%
        group_by(Year, Country) %>%
        summarize(medal_count = sum(medal_count), .groups = 'drop')

    return(aggregated_data)
}