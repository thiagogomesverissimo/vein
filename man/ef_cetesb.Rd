% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ef_cetesb.R
\name{ef_cetesb}
\alias{ef_cetesb}
\title{Emissions factors for Environment Company of Sao Paulo, Brazil (CETESB) 2017}
\usage{
ef_cetesb(
  p,
  veh,
  year = 2017,
  agemax = 40,
  full = FALSE,
  project = "constant",
  verbose = FALSE
)
}
\arguments{
\item{p}{Character;

Pollutants: "CO", "HC", "NMHC", "CH4", "NOx", "CO2","RCHO", "ETOH",
"PM", "N2O", "KML", "FC", "NO2d", "NOd", "gD/KWH", "gCO2/KWH", "RCHO",
"CO_0km", "HC_0km", "NMHC_0km", "NOx_0km", "NO2_0km" ,"NO_0km",
"RCHO_0km" and "ETOH_0km",
(g/km).  Evaporative emissions at average temperature ranges:
"D_20_35", "S_20_35", "R_20_35", "D_10_25", "S_10_25", "R_10_25", "D_0_15",
"S_0_15" and "R_0_15" where D means diurnal (g/day), S hot/warm soak (g/trip)
and R hot/warm running losses (g/trip).}

\item{veh}{Character; Vehicle categories:
"PC_G", "PC_FG", "PC_FE", "PC_E",
"LCV_G", "LCV_FG", "LCV_FE", "LCV_E", "LCV_D",
"TRUCKS_SL", "TRUCKS_L", "TRUCKS_M", "TRUCKS_SH", "TRUCKS_H",
"BUS_URBAN", "BUS_MICRO", "BUS_COACH", "BUS_ARTIC",
"MC_G_150", "MC_G_150_500", "MC_G_500",
"MC_FG_150", "MC_FG_150_500", "MC_FG_500",
"MC_FE_150", "MC_FE_150_500", "MC_FE_500"
"CICLOMOTOR", "GNV"}

\item{year}{Numeric; Filter the emission factor to start from a specific base year.
If project is 'constant' values above 2017 and below 1980 will be repeated}

\item{agemax}{Integer; age of oldest vehicles for that category}

\item{full}{Logical; To return a data.frame instead or a vector adding
Age, Year, Brazilian emissions standards and its euro equivalents.}

\item{project}{haracter showing the method for projecting emission factors in
future. Currently the only value is "constant"}

\item{verbose}{Logical; To show more information}
}
\value{
A vector of Emission Factor or a data.frame
}
\description{
\code{\link{ef_cetesb}} returns a vector or data.frame of Brazilian emission factors.
}
\note{
The new convention for vehicles names are translated from CETESB report:
\tabular{ll}{
  veh    \tab description \cr
  PC_G   \tab Passenger Car Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  PC_E   \tab Passenger Car Ethanol (hydrous ethanol) \cr
  PC_FG   \tab Passenger Car Flex Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  PC_FE  \tab Passenger Car Flex Ethanol (hydrous ethanol) \cr
  LCV_G   \tab Light Commercial Vehicle Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  LCV_E   \tab Light Commercial Vehicle Ethanol (hydrous ethanol) \cr
  LCV_FG   \tab Light Commercial Vehicle Flex Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  LCV_FE  \tab Light Commercial Vehicle Flex Ethanol (hydrous ethanol) \cr
  LCV_D  \tab Light Commercial Vehicle Diesel (5perc bio-diesel) \cr
  TRUCKS_SL_D  \tab Trucks Semi Light Diesel (5perc bio-diesel) \cr
  TRUCKS_L_D  \tab Trucks Light Diesel (5perc bio-diesel) \cr
  TRUCKS_M_D  \tab Trucks Medium Diesel (5perc bio-diesel) \cr
  TRUCKS_SH_D  \tab Trucks Semi Heavy Diesel (5perc bio-diesel) \cr
  TRUCKS_H_D  \tab Trucks Heavy Diesel (5perc bio-diesel) \cr
  BUS_URBAN_D  \tab Urban Bus Diesel (5perc bio-diesel) \cr
  BUS_MICRO_D  \tab Micro Urban Bus Diesel (5perc bio-diesel) \cr
  BUS_COACH_D  \tab Coach (inter-state) Bus Diesel (5perc bio-diesel) \cr
  BUS_ARTIC_D  \tab Articulated Urban Bus Diesel (5perc bio-diesel) \cr
  MC_150_G   \tab Motorcycle engine less than 150cc Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  MC_150_500_G   \tab Motorcycle engine 150-500cc Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  MC_500_G   \tab Motorcycle greater than 500cc Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  MC_150_FG   \tab Flex Motorcycle engine less than 150cc Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  MC_150_500_FG   \tab Flex Motorcycle engine 150-500cc Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  MC_500_FG   \tab Flex Motorcycle greater than 500cc Gasohol (Gasoline + 27perc of anhydrous ethanol)  \cr
  MC_150_FE   \tab Flex Motorcycle engine less than 150cc Ethanol (hydrous ethanol) \cr
  MC_150_500_FE   \tab Flex Motorcycle engine 150-500cc Ethanol (hydrous ethanol) \cr
  MC_500_FE   \tab Flex Motorcycle greater than 500cc Ethanol (hydrous ethanol) \cr
}

The percentage varies of bioduels varies by law.

This emission factors are not exactly the same as the report of CETESB.

1) In this emission factors, there is also NO and NO2 based on split by
published in the EMEP/EEA air pollutant emission inventory guidebook.

2) Also, the emission factors were extended till 50 years of use, repeating
the oldest value.

3) CNG emission factors were expanded to other pollutants by comparison
of US.EPA-AP42 emission factor: Section 1.4 Natural Gas Combustion.

In the previous versions I used the letter 'd' for deteriorated. I removed the
letter 'd' internally to not break older code.

If by mistake, the user inputs one of veh names from the old convention,
they are internally changed to the new convention:
"SLT", "LT", "MT", "SHT","HT", "UB", "SUB", "COACH", "ARTIC", "M_G_150",
"M_G_150_500", "M_G_500", "M_FG_150", "M_FG_150_500", "M_FG_500",
"M_FE_150", "M_FE_150_500","M_FE_500",

\strong{Emission factor for vehicles older than the reported by CETESB were filled as the moving average of 2:}

\itemize{
\item Range EF from PC and LCV otto: 2018 - 1982. EF for 1981 and older as movign average.
\item Range LCV diesel : 2018 - 2006. EF for 2005 and older as movign average.
\item Range Trucks and Buse: 2018 - 1998. EF for 1997 and older as movign average.
\item Range MC Gasoline: 2018 - 2003.  EF for 2002 and older as movign average.
\item Range MC Flex 150-500cc and >500cc: 2018 - 2012.  EF for 2011 and older as movign average.
}
}
\examples{
\dontrun{
a <- ef_cetesb("CO", "PC_G")
a <- ef_cetesb("R_10_25", "PC_G")
a <- ef_cetesb("CO", c("PC_G", "PC_FE"))
ef_cetesb(p = "CO", veh = "PC_G", year = 2018, agemax = 40)
ef_cetesb(p = "CO", veh = "PC_G", year = 1970, agemax = 40)
ef_cetesb(p = "CO", veh = "PC_G", year = 2030, agemax = 40)
ef_cetesb(p = "CO", veh = "TRUCKS_L_D", year = 2018)
ef_cetesb(p = "CO", veh = "SLT", year = 2018) #  olds names
}
}
\references{
Emissoes Veiculares no Estado de Sao Paulo 2016. Technical Report.
url: https://cetesb.sp.gov.br/veicular/relatorios-e-publicacoes/.
}
\keyword{emission}
\keyword{factors}
