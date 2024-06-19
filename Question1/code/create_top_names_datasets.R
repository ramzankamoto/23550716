create_top_names_datasets <- function(data) {
    # Helper function to process the data for a given year
    process_year <- function(data, year) {
        # Filter the dataset for the specified year
        data_year <- subset(data, Year == year)

        # Split the dataset into males and females
        males_data <- subset(data_year, Gender == 'M')
        females_data <- subset(data_year, Gender == 'F')

        # Aggregate counts by Name and Gender
        aggregate_counts <- function(df) {
            aggregate(Count ~ Name + Gender, data = df, sum)
        }

        males_aggregated <- aggregate_counts(males_data)
        females_aggregated <- aggregate_counts(females_data)

        # Get top 25 names based on counts
        top_25_names <- function(df) {
            df[order(-df$Count), ][1:25, ]
        }

        top_25_males <- top_25_names(males_aggregated)
        top_25_females <- top_25_names(females_aggregated)

        # Add a year variable
        top_25_males$Year <- year
        top_25_females$Year <- year

        return(list(males = top_25_males, females = top_25_females))
    }

    # Process the data for the years 1995 and 1998
    data_1995 <- process_year(data, "1995")
    data_1998 <- process_year(data, "1998")

    # Combine results into a list
    result <- list(
        males_1995 = data_1995$males,
        females_1995 = data_1995$females,
        males_1998 = data_1998$males,
        females_1998 = data_1998$females
    )

    return(result)
}



