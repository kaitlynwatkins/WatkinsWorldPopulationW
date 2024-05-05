#' A plot of population data for a given country
#'
#'
#'This function will take the input of a country and produce a plot of the population data from 1950 to 2022
#'
#'
#' @param x A country as a string
#' @return A plot of the population data of that country
#' @examples
#' CountryPopulation("Italy")
#' CountryPopulation("Ethiopia")
#' @export


CountryPopulation <- function(x) {

  if (!country %in% WorldPopulation$Country) {
    stop("Error: Country not found in the World_Population data.")
  }
  else {
    xdata <- subset(WorldPopulation, Country==x)
    ggplot( data=xdata, aes(x=Year, y=Population, axes=FALSE) ) +
      geom_point() +
      labs(title = x) +
      scale_x_discrete( breaks=seq(1950, 2020, by=5)) +
      theme(axis.text.x = element_text(size = 10, angle = 45))
  }
}
