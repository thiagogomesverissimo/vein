context("Evaporative")

test_that("Evaporative works", {
  expect_warning(Evaporative(1),
               ".?")
  expect_warning(print(Evaporative(1)),
               ".?")
})
