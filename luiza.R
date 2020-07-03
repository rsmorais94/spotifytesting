## Install spotifyr and related packages

library(genius)
library(spotifyr)
library(httr)
library(lubridate)
library(tidyverse)
library(knitr)
library(ggridges)

## Create spotify API token

Sys.setenv(SPOTIFY_CLIENT_ID = "b49005a52ddf4d4eb966b244267849be")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "73638e8fdccf4f6e85fd76ec45d63cae")

token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), 
                                  client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))

access_token <- get_spotify_access_token()

## Luiza's valence

luiza <- get_user_playlists("ramonashair", limit = 50) ##Get users playlists
play <- matrix(ncol=3, nrow=40)                        ##Create a matrix to store data

for(i in c(1:40)){
  play[i,1] <- luiza[i,6] ##get playlists names
  play[i,2] <- luiza[i,4] ##get playlists id
  play[i,3] <- mean(get_playlist_audio_features("ramonashair", luiza[i,4])[["valence"]]) ##Calculate mean of each playlist valence
}

pl <- as.data.frame(play) ##Transform matrix to data frame
pl$V3 <- as.numeric(as.character(pl$V3)) ##Transform valence to numeric variable

ggplot(pl, aes(x=V3)) + geom_histogram() ##plot histogram

##Visualize a playlist

testep1 <- get_playlist_audio_features("ramonashair", luiza[1,4])
mean(testep1[["valence"]])
class(play)