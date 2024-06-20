plot_medal_counts <- function(aggregated_data) {
    ggplot(data = aggregated_data, aes(x = Year, y = medal_count, color = Country, group = Country)) +
        geom_line(size = 1) +
        geom_point(size = 2) +
        labs(title = "Individual Medals per Country per Year",
             x = "Year",
             y = "Medal Count",
             color = "Country") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5),
              legend.position = "right")
}