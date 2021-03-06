% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_polid.R
\name{add_polid}
\alias{add_polid}
\title{Add polygon id to lines road network}
\usage{
add_polid(polyg, street, by)
}
\arguments{
\item{polyg}{sf object POLYGON or sp}

\item{street}{streets road network class sf or sp}

\item{by}{Character indicating the column with the id in polyg}
}
\description{
Sometimes you need to add polygon id into your streets road network.
\code{\link{add_polid}} add add_polid id into your road network cropping your
network by.

For instance, you have open street maps road network the you have the
polygon of your regions. This function adds the id of your polygon
as a new column in the streets network.
}
\examples{
\dontrun{
data(net)
nets <- sf::st_as_sf(net)
bb <- sf::st_as_sf(sf::st_as_sfc(sf::st_bbox(nets)))
bb$id <- "a"
a <- add_polid(polyg = bb, street = nets, by = "id")
}
}
\seealso{
\code{\link{emis_to_streets}}
}
