## Create spotify API token

Sys.setenv(SPOTIFY_CLIENT_ID = "b49005a52ddf4d4eb966b244267849be")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "73638e8fdccf4f6e85fd76ec45d63cae")

token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), 
                                  client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))

access_token <- get_spotify_access_token()

## Recommendations test
my_top <- get_my_top_artists_or_tracks(
  type = "tracks",
  time_range = "short_term"
)

track_f <- get_track_audio_features(my_top[,"id"])
my_tracks <- left_join(my_top, track_f, by="id")

recs <- get_recommendations(seed_tracks = sample(my_tracks[,"id"], 5))
to_buy <- (sample(recs[,"album.name"],3))
print(to_buy)
