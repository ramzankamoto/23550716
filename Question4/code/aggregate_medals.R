# Function to aggregate medals
aggregate_medals <- function(data) {
    # Label team sports
    data <- label_team_sports(data)

    # Separate team and individual sports
    team_sports <- data %>% filter(Label == "Team")
    individual_sports <- data %>% filter(Label == "Individual")

    # Aggregate medals for team sports
    team_sports_aggregated <- team_sports %>%
        group_by(Country, Event, Medal) %>%
        summarize(medal_count = 1, .groups = 'drop') # Each event counts as one medal

    # Add medal_count column for individual sports
    individual_sports <- individual_sports %>%
        mutate(medal_count = 1)

    # Combine individual sports and aggregated team sports
    combined_data <- bind_rows(individual_sports, team_sports_aggregated)

    return(combined_data)
}




