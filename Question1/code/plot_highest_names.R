# bargraoh for question1

plot_highest_names <- function(data_frame) {
    # Plot using ggplot2
    ggplot(data_frame, aes(x = factor(Decades), y = Count, fill = Name)) +
        geom_bar(stat = "identity", position = "dodge") +
        labs(x = "Decades", y = "Count", fill = "Name") +
        theme_dark() +  # Dark theme
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
        scale_x_discrete(drop = FALSE) +  # Ensure all decades are shown
        scale_fill_brewer(palette = "Set1")  # Color palette for names
}



## Come back to improve how this looks but at least it does something.

