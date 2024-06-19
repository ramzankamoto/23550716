# Function to get a dataframe with all songs from the top 5 albums by popularity
top_5_albums_popularity <- function(dataset) {
    # Calculate average popularity for each album
    album_summary <- dataset %>%
        group_by(album) %>%
        summarize(avg_popularity = mean(popularity, na.rm = TRUE)) %>%
        arrange(desc(avg_popularity)) %>%
        top_n(5, wt = avg_popularity)

    # Filter original dataset to include only songs from the top 5 albums
    top_5_albums_songs <- dataset %>%
        filter(album %in% album_summary$album)

    return(top_5_albums_songs)
}


