### ecdc data ###

column_mapping <- cfg_write(provided = c("dateRep", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"), 
                            standard = c("date", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/ecdc_data/column_mapping.csv")

countriesAndTerritories_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(countriesAndTerritories) %>%
  rename(provided = countriesAndTerritories) %>%
  tibble::add_column(standard = NA)
write.csv(countriesAndTerritories_levels, file = "/Users/sakelly/maps/ecdc_data/countriesAndTerritories_levels.csv",  row.names = FALSE)

geoId_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(geoId) %>%
  rename(provided = geoId) %>%
  tibble::add_column(standard = NA)
write.csv(geoId_levels, file = "/Users/sakelly/maps/ecdc_data/geoId_levels.csv",  row.names = FALSE)

countryterritoryCode_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(countryterritoryCode) %>%
  rename(provided = countryterritoryCode) %>%
  tibble::add_column(standard = NA)
write.csv(countryterritoryCode_levels, file = "/Users/sakelly/maps/ecdc_data/countryterritoryCode_levels.csv",  row.names = FALSE)

continentExp_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(continentExp) %>%
  rename(provided = continentExp) %>%
  tibble::add_column(standard = NA)
write.csv(continentExp_levels, file = "/Users/sakelly/maps/ecdc_data/continentExp_levels.csv",  row.names = FALSE)
