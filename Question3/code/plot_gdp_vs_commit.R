plot_gdp_vs_allocation <- function(data) {
    # Check if the necessary columns are present
    required_columns <- c("country", "eu_member", "gdp", "allocation_gdp")
    if (!all(required_columns %in% colnames(data))) {
        stop("Data frame must contain columns: country, eu_member, gdp, allocation_gdp")
    }

    # Create the plot
    ggplot(data, aes(x = allocation_gdp, y = gdp, color = factor(eu_member), size = gdp)) +
        geom_point(alpha = 0.6) +
        scale_color_manual(values = c("0" = "red", "1" = "blue"),
                           labels = c("Non-EU Member", "EU Member")) +
        labs(x = "Allocation/GDP", y = "GDP", color = "EU Membership", size = "GDP") +
        theme_minimal() +
        theme(legend.position = "right")
}



