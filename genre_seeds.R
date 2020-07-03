#' Genre seeds
#'
#' Vector of get a list of genre seeds for spotifyr::get_recommendations()
#' @export
gen <- function()

genres <- xml2::read_html("https://developer.spotify.com/console/get-available-genre-seeds/") %>%
  html_nodes('code') %>%
  html_text() %>%
  unique()
return(gen)