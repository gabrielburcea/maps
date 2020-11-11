### ecdc data ###

column_mapping <- cfg_write(provided = c("clinical_finding", "case_count","dateRep", "day", "month", "year", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            standard = c("clinical_finding", "case_count","date", "day", "month", "year", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/ecdc_data/column_mapping.csv")

countriesAndTerritories_levels <- preprocessed %>%
  dplyr::distinct(countriesAndTerritories) %>%
  rename(provided = countriesAndTerritories) %>%
  tibble::add_column(standard = NA)
write.csv(countriesAndTerritories_levels, file = "/Users/sakelly/maps/ecdc_data/countriesAndTerritories_levels.csv",  row.names = FALSE)

geoId_levels <- preprocessed %>%
  dplyr::distinct(geoId) %>%
  rename(provided = geoId) %>%
  tibble::add_column(standard = NA)
write.csv(geoId_levels, file = "/Users/sakelly/maps/ecdc_data/geoId_levels.csv",  row.names = FALSE)

countryterritoryCode_levels <- preprocessed %>%
  dplyr::distinct(countryterritoryCode) %>%
  rename(provided = countryterritoryCode) %>%
  tibble::add_column(standard = NA)
write.csv(countryterritoryCode_levels, file = "/Users/sakelly/maps/ecdc_data/countryterritoryCode_levels.csv",  row.names = FALSE)

clinical_finding_levels <- preprocessed %>%
  dplyr::distinct(clinical_finding) %>%
  rename(provided = clinical_finding) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(clinical_finding_levels, file = "/Users/sakelly/maps/ecdc_data/clinical_finding_levels.csv",  row.names = FALSE)
