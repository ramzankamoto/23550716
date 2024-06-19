create_danceability_boxplot <- function(data) {
    # Load required package
    library(ggplot2)

    # Check if required columns are present
    required_columns <- c("name", "album", "danceability", "band")
    if (!all(required_columns %in% colnames(data))) {
        stop("Data must contain the following columns: name, album, danceability, band")
    }

    # Create a ggplot object with improved aesthetics
    plot <- ggplot(data, aes(x = album, y = danceability, fill = band)) +
        geom_boxplot(outlier.shape = NA, alpha = 0.7) +
        scale_fill_manual(values = c("metallica" = "#E74C3C", "coldplay" = "#3498DB")) +
        labs(title = "Danceability by Album",
             x = "Album",
             y = "Danceability",
             fill = "Band") +
        theme_minimal(base_size = 15) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1),
              axis.title.x = element_text(face = "bold"),
              axis.title.y = element_text(face = "bold"),
              plot.title = element_text(face = "bold", hjust = 0.5),
              legend.position = "top",
              panel.grid.major = element_line(color = "grey85"),
              panel.grid.minor = element_blank())

    # Print the plot
    print(plot)
}

