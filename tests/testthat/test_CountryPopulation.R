

test_that('CountryPopulation returns an error for a country not in World_Population',{

  A <- "Italy"

  expect_error(CountryPopulation(A))

  B <- "booger"

  expect_error(CountryPopulation(B))

  C <- NA

  expect_error(CountryPopulation(C))

  D <- 34

  expect_error(CountryPopulation(D))

})
