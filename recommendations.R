## Create spotify API token

Sys.setenv(SPOTIFY_CLIENT_ID = "b49005a52ddf4d4eb966b244267849be")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "73638e8fdccf4f6e85fd76ec45d63cae")

token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), 
                                  client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))

access_token <- get_spotify_access_token()

## Recommendations test
my_top <- get_my_top_artists_or_tracks(
  type = "tracks",
  time_range = "medium_term"
)

track_f <- get_track_audio_features(my_top[,"id"]
my_tracks <- left_join(my_top, track_f, by="id")

ta = mean(my_tracks[["acousticness"]])
test = my_tracks[1:5,"id"]
test

recs <- get_recommendations(seed_tracks = c("77oU2rjC5XbjQfNe3bD6so", "63SHcJzckFykS8faA5zojY", "6HV9d8u4WJ9lzbGrH5OQ6G", "6lK3nCiigk34SGqEjpQoqO", "3Hlh6tIHXS1H70YqoZ1Cka"))
