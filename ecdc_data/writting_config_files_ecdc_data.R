### ecdc data ###
library(tidyverse)
column_mapping <- cfg_write(provided = c("clinical_finding", "case_count","dateRep", "day", "month", "year", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            standard = c("clinical_data_item", "case_count","date", "day", "month", "year", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            term_id = c("OGMS:0000123", "STATO:0000047", NA, NA,NA, NA, "GAZ:00000448", NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c("clinical_finding_levels.csv", NA, NA, NA, NA, NA, "countriesAndTerritories_levels.csv", "geoId_levels.csv", "countryterritoryCode_levels.csv", NA, "continentExp_levels.csv"),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/ecdc_data/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution"), 
                                 term_id =  c("ENVO:00000004"),
                                 constant_values =  c("national geopolitical entity"),
                                 values_id = c("ENVO"), 
                                 units = c(NA), 
                                 units_id = c(NA), 
                                 notes = c(NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/ecdc_data/constant_values.csv")

countriesAndTerritories_levels <- preprocessed %>%
  dplyr::distinct(countriesAndTerritories) %>%
  rename(provided = countriesAndTerritories) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
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
