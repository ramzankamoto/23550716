label_team_sports <- function(data) {
    # Define the keywords that indicate a team sport
    team_sport_keywords <- c("ball", "rugby", "Cricket", "Eight","Team", "Double", "Polo","Four",
                             "Pair","Lacrosse", "Five", "Hockey")

    # Create a pattern to match any of the keywords
    pattern <- paste(team_sport_keywords, collapse = "|")

    # Use mutate to create the new Label column
    data <- data %>%
        mutate(Label = ifelse(grepl(pattern, Event, ignore.case = TRUE), "Team", "Individual"))

    return(data)
}





