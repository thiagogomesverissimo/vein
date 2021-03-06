% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ef_wear.R
\name{ef_wear}
\alias{ef_wear}
\title{Emissions factors from tyre, break and road surface wear}
\usage{
ef_wear(wear, type, pol = "TSP", speed, load = 0.5, axle = 2)
}
\arguments{
\item{wear}{Character; type of wear: "tyre", "break" and "road"}

\item{type}{Character; type of vehicle: "2W", "PC", "LCV", 'HDV"}

\item{pol}{Character; pollutant: "TSP", "PM10", "PM2.5", "PM1" and "PM0.1"}

\item{speed}{Data.frame of speeds}

\item{load}{Load of the HDV}

\item{axle}{Number of axle of the HDV}
}
\value{
emission factors grams/km
}
\description{
\code{\link{ef_wear}} estimates wear emissions.
The sources are tyres, breaks and road surface.
}
\examples{
\dontrun{
data(net)
data(pc_profile)
pc_week <- temp_fact(net$ldv+net$hdv, pc_profile)
df <- netspeed(pc_week, net$ps, net$ffs, net$capacity, net$lkm, alpha = 1)
ef <- ef_wear(wear = "tyre", type = "PC", pol = "PM10", speed = df)
}
}
\references{
Ntziachristos and Boulter 2016. Automobile tyre and break wear
and road abrasion. In: EEA, EMEP. EEA air pollutant emission inventory
guidebook-2009. European Environment Agency, Copenhagen, 2016
}
