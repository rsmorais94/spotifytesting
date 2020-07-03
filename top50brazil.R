##This code compares 2019 Brazil Top 50 with current Brazil Top 50
install.packages("plotly")
library(plotly)

##Get my playlists, where both are saved
myplists <- get_my_playlists()
  playlist_name1 = "As 50 mais tocadas no Brasil"
  playlist_name2 = "Brasil Hits 2019 - Brasil Top 50 - Brazil 2019"
  plists <- myplists %>% filter(name %in% c(playlist_name1, playlist_name2))  

tr <- rbind((cbind(get_playlist_tracks(plists[1,4], limit = 50), playlist_name=playlist_name1)), (cbind(get_playlist_tracks(plists[2,4], limit = 50), playlist_name=playlist_name2)))

ft <- get_track_audio_features(tr[,16])
colnames(ft)[13] <- "track.id"

tf <- left_join(tr, ft, by="track.id")

## set colors for graphs
green <- "#1ed760"
yellow <- "#e7e247"
pink <- "#ff6f59"
blue <- "#17bebb"

viz4 <- ggplot(tf, aes(x=danceability, fill=playlist_name,
                            text = paste(playlist_name)))+
  geom_density(alpha=0.7, color=NA)+
  scale_fill_manual(values=c(green, yellow, pink, blue))+
  labs(x="Danceability", y="Density") +
  guides(fill=guide_legend(title="Playlist"))+
  theme_minimal()+
  ggtitle("Distribution of Danceability Data")

ggplotly(viz4, tooltip=c("text"))
