context("grid_emis")

data(net)
data(pc_profile)
data(fkm)
PC_G <- c(33491,22340,24818,31808,46458,28574,24856,28972,37818,49050,87923,
          133833,138441,142682,171029,151048,115228,98664,126444,101027,
          84771,55864,36306,21079,20138,17439, 7854,2215,656,1262,476,512,
          1181, 4991, 3711, 5653, 7039, 5839, 4257,3824, 3068)
pc1 <- my_age(x = net$ldv, y = PC_G, name = "PC")
# Estimation for morning rush hour and local emission factors
lef <- EmissionFactorsList(ef_cetesb("CO", "PC_G"))
E_CO <- emis(veh = pc1,lkm = net$lkm, ef = lef,
             profile = 1, speed = Speed(1))
E_CO_STREETS <- emis_post(arra = E_CO, by = "streets", net = net)
g <- make_grid(net, 1/102.47/2) #500m in degrees
gCO <- emis_grid(spobj = E_CO_STREETS, g = g)
gCO$emission <- gCO$V1
area <- sf::st_area(gCO)
area <- units::set_units(area, "km^2") #Check units!
gCO$emission <- gCO$emission*area


test_that("grid_emis works", {
  expect_equal(round(grid_emis(net, gCO, verbose = TRUE, top_down = T)$emission[1]),
               7416)
  expect_output(grid_emis(net, gCO, verbose = TRUE, top_down = T),
                ".?")
})


test_that("emis_cold works", {
  expect_error(grid_emis(net, gCO, osm = 1:5, verbose = TRUE, top_down = T),
               ".?")
  expect_error(grid_emis(net, gCO, osm = 1:5, verbose = TRUE,
                         pro = 1, top_down = T),
               ".?")
  gCO$emission <- NULL
  expect_error(grid_emis(net, gCO, osm = 1:5, top_down = T),
               ".?")

})

